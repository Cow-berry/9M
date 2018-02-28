program ObjectPascalExample;

uses crt;

type
  THelloWorld = class                    { определение класса }
    procedure Put;
  end;

procedure THelloWorld.Put;               { описание процедуры метода Put класса THelloWorld }
begin
  Writeln('Hello, World!');
end;

var
  HelloWorld: THelloWorld;               { определение переменной-указателя на экземпляр класса }

begin
  clrscr;
  HelloWorld := THelloWorld.Create;      { конструктор возвращает значение указателя на экземпляр класса }
  HelloWorld.Put;
  HelloWorld.Free;                       { деструктор уничтожает экземпляр класса и освобождает область памяти }
end.


