program MemoryManagementInAction;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  FastMM5,
  System.SysUtils,
  System.Generics.Collections,
  AnimalUnit in 'AnimalUnit.pas',
  FactoryUnit in 'FactoryUnit.pas';

var
  actualAnimal : TAnimal;
  animalSpeech: string;
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

    for I := 0 to 4 do
    begin
      AnimalList[I].Free;
    end;

  finally
    AnimalList.Free;
  end;

  try
    actualAnimal := TAnimalFactory.CreateAnimal(atDog);
    animalSpeech := actualAnimal.MakeNoise;

    WriteLn(Format('The animal says: "%s"', [animalSpeech]));
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
