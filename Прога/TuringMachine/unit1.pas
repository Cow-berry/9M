unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation
var n : Integer;
{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
var knopka: TButton;
begin
     knopka := TButton.Create(Form1);
     knopka.parent := Form1;
     knopka.top := 50;
     knopka.left:= 50;
     knopka.Caption := 'New button';

end;

end.

