unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    procedure FormClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormClick(Sender: TObject);
begin
  Form1.Color := clGreen;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
   Form1.Caption := 'Выбор...' ;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
    Form1.Caption := 'Зелёненький';
    Form1.Color := clLime;
end;

end.

