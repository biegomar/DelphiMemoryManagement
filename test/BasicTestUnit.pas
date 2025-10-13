unit BasicTestUnit;

interface

uses
  DUnitX.TestFramework,
  AnimalUnit,
  FactoryUnit;

type
  [TestFixture]
  TBasicTest = class
  public
    [Test]
    procedure TestCreateDog;
    procedure TestCreateCat;

    [Test]
    [TestCase('TestA','1,2')]
    [TestCase('TestB','3,4')]
    procedure TestMakeNoise(const AValue1 : Integer;const AValue2 : Integer);
  end;


implementation

{ TBasicTest }

procedure TBasicTest.TestCreateCat;
var
  actual: TAnimal;
begin
  actual := TAnimalFactory.CreateAnimal(atDog);

  Assert.IsTrue(actual.ClassType = TCat, 'Factory sollte ein Objekt vom Typ TCat (oder abgeleitet) liefern.');

end;

procedure TBasicTest.TestCreateDog;
begin

end;

procedure TBasicTest.TestMakeNoise(const AValue1, AValue2: Integer);
begin

end;

initialization
  TDUnitX.RegisterTestFixture(TBasicTest);

end.
