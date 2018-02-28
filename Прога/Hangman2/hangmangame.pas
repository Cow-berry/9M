unit hangmangame;

{$mode objfpc}{$H+}

interface

uses Classes, SysUtils;

const
  Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  ERRORLIMIT = 9;
type

  { Game }

  Game = class
    private
      theWord:String;
      DisplayWord:String;
      ErrorCount:Integer;
    public
      onNewWord:TNotifyEvent;
      onSuccess:TNotifyEvent;
      onHang:TNotifyEvent;
      onError:TNotifyEvent;
      onLetter:TNotifyEvent;
      function getWord:String;
      function getDisplayWord:String;
      function getErrorCount:Integer;
      procedure new;
      procedure tryLetter(c:Char);
  end;

var Dictionary:TStringList;

implementation

{ Game }

function Game.getWord: String;
begin
  result:=theWord;
end;

function Game.getDisplayWord: String;
begin
  result:=DisplayWord;
end;

function Game.getErrorCount: Integer;
begin
  result:=ErrorCount;
end;

procedure Game.new;
var i:Integer;
begin
  theWord:=AnsiUpperCase(Dictionary[random(Dictionary.Count)]);
  DisplayWord:='';
  for i:=1 to Length(theWord) do DisplayWord:=DisplayWord + '_';
  ErrorCount:=0;
  if Assigned(onNewWord) then onNewWord(self);
end;

procedure Game.tryLetter(c: Char);
var k, i:Integer;
begin
  k:=0;
  for i:=1 to Length(theWord) do
  if (theWord[i] = c) then begin
    DisplayWord[i]:=c;
    k:=k+1;
  end;
  if (k > 0) then begin
    if Assigned(onLetter) then onLetter(self);
    if (DisplayWord = theWord) then begin
      if Assigned(onSuccess) then onSuccess(self);
    end;
  end else begin
    ErrorCount:=ErrorCount + 1;
    if Assigned(onError) then onError(self);
    if (ErrorCount = ERRORLIMIT) then begin
      if Assigned(onHang) then onHang(self);
    end;
  end;
end;

end.

