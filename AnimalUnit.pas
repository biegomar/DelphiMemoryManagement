unit AnimalUnit;

interface

type
  TSpecies = (atDog, atCat);

  TAnimal = class
  private
    FSpecies: TSpecies;
  public
    property Species: TSpecies read FSpecies;
    function MakeNoise: String; virtual; abstract;
  end;

  TDog = class(TAnimal)
  public
    constructor Create;
    function MakeNoise: String; override;
  end;

  TCat = class(TAnimal)
  public
    constructor Create;
    function MakeNoise: String; override;
  end;

implementation

{ TAnimal }


{ TDog }

constructor TDog.Create;
begin
  self.FSpecies := atDog;
end;

function TDog.MakeNoise: String;
begin
  Result := 'Wuff';
end;

{ TCat }

constructor TCat.Create;
begin
  self.FSpecies := atCat;
end;

function TCat.MakeNoise: String;
begin
  Result := 'Miau';
end;

end.


(************* Test hinzufügen ***************
Um eine einfache Unit-Test Suite für den obigen Code zu erstellen, würde man typischerweise einen Test für
jede Klasse und jeden möglichen Ausgang in diesen Klassen schreiben. Hier ist ein einfaches Beispiel, wie man das in Delphi umsetzen könnte:

```delphi
unit
TestAnimalUnit;

interface

uses
  TestFramework, SysUtils, AnimalUnit;

type
  // Test methods for class TDog
  TestTDog = class(TTestCase)

published
    procedure TestMakeNoise;
  end;

  // Test methods for class TCat
  TestTCat = class(TTestCase)
  published
    procedure TestMakeNoise;

end;

implementation

{ TestTDog }

procedure TestTDog.TestMakeNoise;
var
  Dog: TDog;
begin
  Dog := TDog.Create;
  try
    CheckEquals('Wuff',
Dog.MakeNoise, 'Expected dog to make noise: Wuff');
  finally
    Dog.Free;
  end;
end;

{ TestTCat }

procedure TestTCat.TestMakeNoise;
var
  Cat:
TCat;
begin
  Cat := TCat.Create;
  try
    CheckEquals('Miau', Cat.MakeNoise, 'Expected cat to make noise: Miau');
  finally
    Cat.Free;

end;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTDog.Suite);

RegisterTest(TestTCat.Suite);
end.
```

Dieser Code stellt sicher, dass sowohl `TDog.MakeNoise` `Wuff` und `TCat.MakeNoise` `Miau` zurückgeben.
*)
