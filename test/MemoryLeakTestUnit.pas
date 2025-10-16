unit MemoryLeakTestUnit;

interface

uses
  DUnitX.TestFramework,
  AnimalUnit,
  System.Generics.Collections;

type
  [TestFixture]
  TMemoryLeakTest = class
  public
    [Test]
    procedure TestCorrectMemoryManagement;

    [Test]
    procedure TestSimpleMemoryLeak;

    [Test]
    procedure TestMemoryLeakInLoop;

    [Test]
    procedure TestPartialMemoryLeak;

    [Test]
    procedure TestMemoryLeakDueToException;
  end;

implementation

uses
  System.SysUtils;

{ TMemoryLeakTest }

procedure TMemoryLeakTest.TestCorrectMemoryManagement;
var
  Dog: TDog;
  Cat: TCat;
begin
  Dog := TDog.Create;
  try
    Assert.AreEqual('Wuff', Dog.MakeNoise, 'Dog should bark');
  finally
    Dog.Free;
  end;

  Cat := TCat.Create;
  try
    Assert.AreEqual('Miau', Cat.MakeNoise, 'Cat should meow');
  finally
    Cat.Free;
  end;
end;

procedure TMemoryLeakTest.TestSimpleMemoryLeak;
var
  Dog: TDog;
begin
  Dog := TDog.Create;
  Assert.AreEqual('Wuff', Dog.MakeNoise, 'Dog should bark');
end;

procedure TMemoryLeakTest.TestMemoryLeakInLoop;
var
  I: Integer;
  Animal: TAnimal;
begin
  for I := 1 to 5 do
  begin
    if I mod 2 = 0 then
      Animal := TDog.Create
    else
      Animal := TCat.Create;

    Assert.IsNotNull(Animal, 'Animal should be created');
  end;
end;

procedure TMemoryLeakTest.TestPartialMemoryLeak;
var
  AnimalList: TObjectList<TAnimal>;
  I: Integer;
begin
  AnimalList := TObjectList<TAnimal>.Create(False);
  try
    for I := 1 to 10 do
    begin
      if I mod 2 = 0 then
        AnimalList.Add(TDog.Create)
      else
        AnimalList.Add(TCat.Create);
    end;
    
    Assert.AreEqual<integer>(10, AnimalList.Count, 'Should have 10 animals');

    for I := 0 to 4 do
    begin
      AnimalList[I].Free;
    end;
  finally
    AnimalList.Free;
  end;
end;

procedure TMemoryLeakTest.TestMemoryLeakDueToException;
var
  Dog: TDog;
  Cat: TCat;
begin
  Dog := TDog.Create;

  Cat := TCat.Create;
  try
    raise Exception.Create('Simulated error');
  except
    on E: Exception do
    begin
      Assert.Pass('Exception was caught as expected');
    end;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TMemoryLeakTest);

end.
