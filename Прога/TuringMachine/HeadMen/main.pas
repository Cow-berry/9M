unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, headmenModel;

type

  { TForm1 }

  TForm1 = class(TForm)
    gameButton: TButton;
    Panel3: TPanel;
    ResignButton: TButton;
    PaintBox1: TPaintBox;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure gameButtonClick(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure ResignButtonClick(Sender: TObject);
  private
    { private declarations }
    theGame : Game;
    wordLabels : TList; //метки, отображающиеся на верхней панели (квадратики с буквами и подчёркиваниями)
    letters : TList;    //кнопки клавиатуры сверху
    procedure gameNewWord(Sender : TObject);
    procedure gameSuccess(Sender : TObject);
    procedure gameHung(Sender : TObject);
    procedure gameErrorsCount(Sender : TObject);
    procedure gameNewLetter(Sender : TObject);
    procedure LetterClick (Sender : TObject);
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var temp : TButton;
i : Integer ;
begin
  theGame := Game.Create;
  theGame.onNewWord := @gameNewWord;
  theGame.onSuccess := @gameSuccess;
  theGame.onHung := @gameHung;
  theGame.onError := @gameErrorsCount;
  theGame.onNewLetter := @gameNewLetter;
  wordLabels := Tlist.Create;
  letters := TList.Create;
  for i := 1 to length(alphabet) do
  begin
       temp := TButton.Create(Form1);
       temp.Parent := Panel2;
       temp.Top := 1;
       temp.Left := (i-1)*25+1;
       temp.Width := 24;
       temp.Caption := alphabet[i] ;
       temp.enabled:=False;
       temp.OnClick := @LetterClick;
       letters.Add(temp);
  end;
  dictionary := TStringList.Create;
  dictionary.LoadFromFile(ExtractFilePath(ParamStr(0))+'dictionary.txt');
  randomize;
end;

procedure TForm1.gameButtonClick(Sender: TObject);
begin
  theGame.new;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
var half : Integer;
begin
     PaintBox1.Canvas.Pen.Color := clGreen;
     half := PaintBox1.width div 2;
     PaintBox1.Canvas.clear;
     if (theGame.getErrorsCount > 0) then
     begin
          PaintBox1.Canvas.MoveTo(half-20, 10);
          PaintBox1.Canvas.LineTo(half-20, 110);
     end;
     if (theGame.getErrorsCount > 1) then
     begin
          PaintBox1.Canvas.MoveTo(half-20, 20);
          PaintBox1.Canvas.LineTo(half+20, 20);
     end;
     if (theGame.getErrorsCount > 2) then
     begin
          PaintBox1.Canvas.MoveTo(half, 20);
          PaintBox1.Canvas.LineTo(half, 28);
     end;
     if (theGame.getErrorsCount > 3) then
     begin
          PaintBox1.canvas.Ellipse(half-5, 28, half+5, 38)
     end;
     if (theGame.getErrorsCount > 4) then
     begin
          PaintBox1.Canvas.MoveTo(half, 38);
          PaintBox1.Canvas.LineTo(half, 78);
     end;
     if (theGame.getErrorsCount > 5) then
     begin
          PaintBox1.Canvas.MoveTo(half, 48);
          PaintBox1.Canvas.LineTo(half-15, 48);
     end;
     if (theGame.getErrorsCount > 6) then
     begin
          PaintBox1.Canvas.MoveTo(half, 48);
          PaintBox1.Canvas.LineTo(half+15, 48);
     end;
     if (theGame.getErrorsCount > 7) then
     begin
          PaintBox1.Canvas.MoveTo(half, 78);
          PaintBox1.Canvas.LineTo(half-15, 90);
     end;
     if (theGame.getErrorsCount > 8) then
     begin
          PaintBox1.Canvas.MoveTo(half, 78);
          PaintBox1.Canvas.LineTo(half+15, 90);
     end;


end;

procedure TForm1.ResignButtonClick(Sender: TObject);
var i : Integer;
begin
     for i := 0 to (wordLabels.count - 1) do
     begin
          TLabel(wordLabels[i]).Caption:=theGame.getWord[i+1]
     end;
end;

procedure TForm1.gameNewWord(Sender: TObject);
var i : Integer;
temp : TLabel;
begin
     for i := (wordLabels.Count -1) downto 0 do TLabel(wordLabels[i]).free;
     wordLabels.clear;
     for i := 1 to length(TheGame.getDisplayWord) do
     begin
          temp := Tlabel.Create(Form1);
          temp.Parent := Panel3;
          temp.Top := 1;
          temp.Left := (i-1)*25+4;
          temp.autosize := False;
          temp.Width := 24;
          temp.Height := 24;
          temp.Caption := theGame.getDisplayWord[i];
          temp.Alignment := taCenter;
          temp.Layout := tlBottom;
          temp.Color := clBlack;
          wordlabels.Add(temp);
     end;
     PaintBox1.RePaint;    // перерисовка, а не просто очищеник
     for i := 0 to letters.count -1 do TButton(letters[i]).enabled := True;
end;

procedure TForm1.lockLetters;
var i : Integer;
begin
     for i := 0 to Letters.count-1 do TButton(letters[i]).Enabled:=False;
end;

procedure TForm1.gameSuccess(Sender: TObject);
var i : Integer;
begin
     showMessage('Congratulations');
     lockLetters;

end;

procedure TForm1.gameHung(Sender: TObject);
var i : Integer;
begin
     showMessage('Failed');
     lockLetters;
end;

procedure TForm1.gameErrorsCount(Sender: TObject);
begin
     beep;
     PaintBox1.repaint;
end;

procedure TForm1.gameNewLetter(Sender: TObject);
var i : Integer;                                       a
begin
     for i := 0 to (wordLabels.count - 1) do
     begin
          TLabel(wordLabels[i]).Caption:=theGame.getDisplayWord[i+1]
     end;
end;

procedure TForm1.LetterClick(Sender: TObject);
begin
     TButton(sender).enabled := False;
     theGame.tryLetter(TButton(sender).Caption[1]);
end;

end.

