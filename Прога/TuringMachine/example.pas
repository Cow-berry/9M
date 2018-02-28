type                              \\ создаём тип Кот
    Cat = class
        color : Integer;
        name : string;
        procedure miaoo;
    end                            \\ color = COLOR одно и то же 
var TheCat : Cat;                  \\ Создаём кота
	TheCat.color := 0 ;            \\ чёрный кот
	TheCat.name := 'Вжух';         \\ назовём его Вжух
	procedure Cat.miaoo
	begin
	if (color = 0) then PlaySound(...) else PlaySound(...)
	end
	TheCat.miaoo;                  \\ вызываем процедуру мяу 
	
var i : Integer
i:= 0                              \\ то всё будет прекрасно, но если сделать также с объектом то 										вылезет ошибка. т.к. объекты -- указатели на память.
                                   \\Объектный паскаль предоставляет метод конструктора -- Create
TheCat := Cat.Create               \\ и только тогда ему будут дано место в памяти

myCat:Cat
for i :=- 1 to 100 do
begin
	TheCat := Cat.Create
	MyCat := TheCat
end;

									\\ free уничтожает(освобождает) объект
TheCat.free
TheCat := nil
if TheCat <> nil then ... 			\\можно проверять
if TheCat.color = 0 then ... 		\\ ошибка
									\\ последовательность : class -> var -> x.Create 
type									
Cat = class
	private
		Color:TColor;
		Name:String
	public
		function getColor:TColor
		procedure miaoo;
		constructor Create(_Color:Tcolor; _Name:String)
		procedure rename(newName:String)
end

constructor Cat.Create(...)
begin
	Color := _Color
	Name := _Name
end

procedure Cat.rename(newName)
begin
	Name := newName
end
theCat := Cat.Create(clGreen, 'Vzhuh')
theCat.getColor

\\Дружественные классы имеют доступ к закрытым зонам этих объектов friendlyclass все классы в одно модуле -- дружественные
\\Классы могут выстраиваться в иеарархии Животное -> кот -> Вжух
type
	Animal = class
		...
	end;
	Cat = class(Animal)
		...
	end
\\Все классы --- подклассы класса TObject	
\\class(TOblect) писать не надо

var x : String
x:array[1..100] of array[1..50] of Cat
x[1] := 'abc'

\\Типы : integer, double, boolean, string, char
x := 'abc'+'def' 
x = 'abcdef'
Length(x)

\\ЦИКЛЫ
for i := 1 to 100 do
begin
	x[i] = i;
	if i = 50 then break;
end

while i > 0 do
begin
	...
	i:=i-1
end

repeat
begin
...
i:=i-1
until i>0

\\\\\ Процедуры и их пререопределения

\\virtual -- в каждом потомке своя реализация и вызываться будет она
\\abstract -- в этом классе реализации метода не будет, она будет только у потомков
\\override -- данный метод является переписанным виртуальным методом родительского класса-эб


procedure Say :
	procedure Animal.Say : \\ в определении класса virtual ; abstract;
	begin
		writeln("Uuuu")
	end;
	
	procedure Cat.Say :  \\ в опредлелении класса override ;
	begin
		writeln("Meow")
	end;
	
	procedure Dog.Say :
	begin
		writeln("woof")	
		end																					
		
		
		
Salutation =
class
	procedure Day virtual; abstract;
end;

RissianSalutation = 
class 
	procedure say override;
end;

procedure RussianSalutaton.say:
begin
	writln("Привет!")
end;

 
if (TheAnimal <> nil) \\ self = this в Java

\\Записи 
type
	Person = record
		Name:String;
		Birtday:TDay;
		Sex:Tsex;
end;

type TSex = (Male, Female);

ThePerson := Person;
ThePerson.name

\\функции и процедуры 
\\процедуры ничего не возвращают
\\функции наоборот
\\function имя(параметры):возвращаемый тип
\\хороший стиль --- result := "" или 0 ..(что-нибудь по умолчанию для данного типа )

try
	..код..
except 
	on e:Exception -- прородитель всех исключний
	do
	e.massage
end;

try

finally

end;

x:= MyObject.Create()

try 
	try
	
	except
	
	end
finally
	x.Free
end;

raise Except.Create()

x:= TList.Create;
	x.add(TheCat);
	x.add(TheDog);
x.count -- количество элементов
x[i] -- обращение к и-тому элементу списка
for i := 0 to x.count - 1 do Something(x[i])

y:= x[i]

var tmp : TButton;

for i := 1 to 100 do
begin
	tmp := TButton.Create(myWind)
	tmp := ...
	x.add(tmp)
end
	
	x[i] : TObject
	
TStringList -- список строчек
x.LoadFromFile ("Путь")
x.SaveToFile("Путь")

PChar -- Сишная строка


///


.lpr -- расширение проекта
.pas -- расширение модулей

делать проекты в отдельных папках
Лучше всего сохранять всю работу, выкладывая на github (мало ли что с компом случиться)

Как создавать новый проект:
1) Создать для него папку
2) Запустить lazarus
3) File -> создать -> приложение
3'') не оставляйте имя unit1.pas, а также лучше переименуйте в то, что вам нравится
3'') в самом начале кода файла .pas  нужно заменить  unit unit1 на unit <то, что вам нравится>
4) File -> сохранить -> выбор папки созданной в п. 1
5) не оставляйте имя project1.lpr, а заменяйте на то, что вам нравится


1) TLabel -- надпись
	Caption -- тест налписи
	Color -- цвет фона
	AutoSize : boolean -- 
	Top, Left, Hight, Width
	Aligment -- выравнивание текста внутри label-а
	Font : TObject
		Color
		Name
		Size
	событий нет (хотя есть клик) 
	можно переписать метод draw

2) TEdit -- поле ввода однострочного текста
	Top, Left, Hight, Width
	Text
	OnChange -- событие измены текста
	OnKeyPress -- key : Char
	OnKeyDown -- code : Word (Word = Integer для символов)
	OnEnter -- событие установки фокуса 
	OnExit -- событие снятиея фокуса

3) TButton -- кнопка
	Caption
	OnClick
	Top, Left, Hight, Width
	
4) TCheckBox -- квадратик в котором можно поставить галочку
	Cheked : boolean

5) TListBox & TComboBox
	Items -- список строчек [i] -- можно обратиться по номеру
	ItremIndex -- номер выбранного элемента (если ничего не выбрано, то < -1 >) 
	
6)TForm -- окно
	Caption -- заголовок
	OnShow -- она показывается на экране
	OnHide -- она не показвается на экране
	BorderStile := 
		bsSizeble --  
		bsSingle --  
		bsDialog -- только крестик
		bsNone -- нет кнопок
		
7) TPanel -- панель 
	Align --
	alClient -- рзанимает пространство, оставшееся от прошлых изменений 
	
8)TSpliter -- разделитель между панелямиб его можно двигать
9)TPageControl -- окно с вкладками. Кадая вкладка имеет тип TTabShift
10)TPaintBox 
	Canvas -- зона рисования (холст)
		Brush
			Color
			...
		Pen
			Color
			...
		moveTo(x, y)
		lineTo(x, y)
		draw(битовый образ из файла)
		TextOut

11)TListView -- таблица
		
//////////// События
TNotifyEvent -- прародитель почти всех событий
= procedure(Sender:TObject) of Object; (возвращает объект)

Button1.OnClick -- указательна процедуру
Button1.OnClick := @Foo

procedure Foo (Sender:TObject)

OnKeyDown (Sender:TObject, Key:Word, ...)
if key = VK_RETURN (VK_RETURN = 13)



\\\
var L:TListBox ;
	L.items.add('Moscow');
	L.items.add('Rome');
	L.items.delete(0);
	
	L.items.addObject('Moscow', x)
	L.items.Object[0]

View -- пользовательский йинтерфейс
Model -- класссы сущностей
Comtroller -- взаитмодействие между пользователем и сущностью

MVC
   ____
   \  /
	\/

Controller -> Model -> View

View -- main






















