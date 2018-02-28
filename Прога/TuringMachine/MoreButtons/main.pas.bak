unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ScrollBox1: TScrollBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    buttonCount : Integer;
    procedure tempClick(Sender: TObject);
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  buttonCount := 0;
end;

procedure TForm1.tempClick(Sender: TObject);
begin
  Form1.Caption := TButton(Sender).Caption;
end;

procedure TForm1.Button1Click(Sender: TObject);
var temp : TButton;
begin
     temp := TButton.Create(Form1);
     temp.parent := ScrollBox1;
     temp.Left := 0;
     temp.Top := (buttonCount) * 25;
     temp.Caption := IntToStr(buttonCount + 1);
     buttonCount := buttonCount + 1;
     temp.OnClick:=@tempClick;
end;

end.







