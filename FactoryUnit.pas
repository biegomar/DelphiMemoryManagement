unit FactoryUnit;

interface

uses AnimalUnit;

type

  TAnimalFactory = class
    public class function CreateAnimal(AnimalType: TAnimalType): TAnimal;
  end;

implementation

{ TAnimalFactory }

class function TAnimalFactory.CreateAnimal(AnimalType: TAnimalType): TAnimal;
begin
  Result := nil;
  case AnimalType of
    atDog:  Result := TDog.Create;
    atCat:  Result := TCat.Create;
  end;
end;

end.
