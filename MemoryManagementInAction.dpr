program MemoryManagementInAction;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  AnimalUnit in 'AnimalUnit.pas',
  FactoryUnit in 'FactoryUnit.pas';

var
  ActualAnimal : TAnimal;
  AnimalSpeech: string;

begin
  try
    ActualAnimal := TAnimalFactory.CreateAnimal(atDog);
    AnimalSpeech := ActualAnimal.MakeNoise;

    WriteLn(string.Format('The animal says: "%s"', [AnimalSpeech]));
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
