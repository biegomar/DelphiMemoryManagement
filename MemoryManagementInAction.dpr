program MemoryManagementInAction;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  FastMM5,
  System.SysUtils,
  AnimalUnit in 'AnimalUnit.pas',
  FactoryUnit in 'FactoryUnit.pas';

var
  actualAnimal : TAnimal;
  animalSpeech: string;

begin
  try
    actualAnimal := TAnimalFactory.CreateAnimal(atDog);
    animalSpeech := actualAnimal.MakeNoise;

    WriteLn(string.Format('The animal says: "%s"', [animalSpeech]));
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
