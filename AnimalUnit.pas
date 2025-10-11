unit AnimalUnit;

interface

type
  TAnimalType = (atDog, atCat);

  TAnimal = class
  public
    function MakeNoise: String; virtual; abstract;
  end;

  TDog = class(TAnimal)
    public
      function MakeNoise: String; override;
  end;

  TCat = class(TAnimal)
    public
      function MakeNoise: String; override;
  end;

implementation

{ TAnimal }


{ TDog }

function TDog.MakeNoise: String;
begin
  Result := 'Wuff';
end;

{ TCat }

function TCat.MakeNoise: String;
begin
  Result := 'Miau';
end;

end.
