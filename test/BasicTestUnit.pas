unit BasicTestUnit;

interface

uses
  SysUtils,
  DUnitX.TestFramework,
  AnimalUnit,
  FactoryUnit;

type
  [TestFixture]
  TBasicTest = class
  public
    [Test]
    procedure TestCreateDog;
    [Test]
    procedure TestCreateCat;

    [Test]
    [TestCase('Dog', 'atDog,Wuff')]
    [TestCase('Cat', 'atCat,Miau')]
    procedure TestMakeNoise(const Species : TSpecies; const Expected : string);
  end;


implementation

{ TBasicTest }

procedure TBasicTest.TestCreateCat;
var
  actual: TAnimal;
begin
  try
    actual := TAnimalFactory.CreateAnimal(atCat);
    Assert.IsTrue(actual.ClassType = TCat, 'Factory should return an object of type TCat (or derived).');
  finally
    actual.Free;
  end;
end;

procedure TBasicTest.TestCreateDog;
var
  Dog: TDog;
begin
  Dog := TDog.Create;
  Assert.AreEqual('Wuff', Dog.MakeNoise, 'Dog should bark');
end;

procedure TBasicTest.TestMakeNoise(const Species : TSpecies;const Expected : string);
var
  sut: TAnimal;
  actual: string;

begin
  try
    sut := TAnimalFactory.CreateAnimal(Species);
    actual := sut.MakeNoise;

    Assert.IsTrue(actual = Expected, Format('Should be "%s" but was "%s"', [Expected, actual]));
  finally
    sut.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TBasicTest);

end.
