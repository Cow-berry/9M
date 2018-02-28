unit headmenModel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
const alphabet = 'abcdefghijklmnopqrstuvwxyz';
type

{ Game }

 Game = class
  private
    theWord : String;
    displayWord : String;
    ErrorsCount : Integer;
  public
    onNewWord : TNotifyEvent;  {слово загадывается}
    onSuccess : TNotifyEvent;  {слово отгадано}
    onHung : TNotifyEvent;     {повешение/конец игры}
    onError : TNotifyEvent;    {буква отгадана неверно}
    onNewLetter : TNotifyEvent;   {буква отгадана верно}
    function getWord : String;
    function getDisplayWord : String;
    function getErrorsCount : Integer;
    procedure new;
    procedure tryLetter(c : Char);
end;
var dictionary : TStringList;
implementation

{ Game }

function Game.getWord: String;
begin
     result := theWord;
end;

function Game.getDisplayWord: String;
begin
     result := DisplayWord;
end;

function Game.getErrorsCount: Integer;
begin
     result := ErrorsCount;
end;

procedure Game.new;
var i : Integer;
begin
     theWord := Dictionary[random(Dictionary.Count)];     //случайный выбор слова.
     displayWord := '';     //задать display word
     for i := 1 to length(theWord) do displayWord := DisplayWord + '_';
     ErrorsCount := 0;
     if (Assigned(onNewWord)) then onNewWord(self);
end;

procedure Game.tryLetter(c : Char);
var i, k:Integer;
begin
     k:=0;
     for i := 1 to length(theWord) do
     begin
          if (theWord[i]=c) then
          begin
               displayWord[i]:=c;
               inc(k);
          end;
     end;
     if (k=0) then
     begin
         inc(errorsCount);
         if (assigned(OnError)) then OnError(self);
         if ((errorsCount=9) and (assigned(onHung))) then onHung(self);
     end
     else
     begin
          if (assigned(onNewLetter)) then onNewLetter(self);
          if ((displayWord=theWord) and (assigned(onSuccess))) then onSuccess(self);
     end;

end;

end.

