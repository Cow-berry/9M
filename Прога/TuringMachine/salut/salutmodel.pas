unit salutModel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type Salutation = class
     function say : String; virtual; abstract;
end;


EngSalutation = class(Salutation)
     function say : String; override;
end;


RusSalutation = class(Salutation)
     function say : String; override;
end;


EspSalutation = class(Salutation)
     function say : String; override;
end;


ItSalutation = class(Salutation)
     function say : String; override;
end;

PortSalutation = class(Salutation)
     function say : String; override;
end;

implementation


function PortSalutation.say: String;
begin
     result := 'Ola!'
end;


function ItSalutation.say: String;
begin
     result := 'Ciao!'
end;

function EspSalutation.say: String;
begin
     result := 'Hola!'
end;

function RusSalutation.say: String;
begin
     result := 'Привет'
end;

function EngSalutation.say: String;
begin
     result := 'Hello!'
end;

end.

