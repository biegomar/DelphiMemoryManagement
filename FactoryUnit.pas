unit FactoryUnit;

interface

uses AnimalUnit;

type

  TAnimalFactory = class
    public class function CreateAnimal(Species: TSpecies): TAnimal;
  end;

implementation

{ TAnimalFactory }

class function TAnimalFactory.CreateAnimal(Species: TSpecies): TAnimal;
begin
  Result := nil;
  case Species of
    atDog:  Result := TDog.Create;
    atCat:  Result := TCat.Create;
  end;
end;

end.
