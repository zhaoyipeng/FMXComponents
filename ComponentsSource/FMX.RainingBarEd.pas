unit FMX.RainingBarEd;

interface

uses
  System.Classes,
  DesignIntf,
  DesignEditors,
  DesignMenus,
  FMX.RatingBar;

type
  TFMXRatingBarComponentEditor = class(TComponentEditor)
  private
     procedure MenuItemHandler(Sender: TObject);
  public
    procedure PrepareItem(index: Integer; const AItem: IMenuItem); override;
    procedure Edit; override;
    procedure ExecuteVerb(index: Integer); override;
    function GetVerb(index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

procedure register;

implementation

procedure register;
begin
  RegisterComponentEditor(TFMXRatingBar, TFMXRatingBarComponentEditor);
end;


{ TLogGraphComponentEditor }

procedure TFMXRatingBarComponentEditor.Edit;
begin
  inherited;
end;

procedure TFMXRatingBarComponentEditor.ExecuteVerb(index: Integer);
begin
  inherited;

end;

function TFMXRatingBarComponentEditor.GetVerb(index: Integer): string;
begin
  case index of
    0:
      Result := 'Shape';
  end;
end;

function TFMXRatingBarComponentEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

procedure TFMXRatingBarComponentEditor.MenuItemHandler(Sender: TObject);
var
  CompOwner: TComponent;
  rb: TFMXRatingBar;
begin
  CompOwner := Designer.GetRoot;
  if CompOwner <> nil then
  begin
    rb := TFMXRatingBar(Component);
    case (Sender as TComponent).Tag of
      0: // Star
        rb.Data.Data := 'm 4677,2657 -1004,727 385,1179 -1002,-731 -1002,731 386,-1179 -1005,-727 1240,3 381,-1181 381,1181 z';
      1: // Heart
        rb.Data.Data := 'M 23.252905,18.859647 A 30,30 0 0 1 65.679312,61.286053 L 23.252905,103.71246 -19.173502,61.286053 A 30,30 0 0 1 23.252905,18.859647';
      2:  // Diamond
        rb.Data.Data := 'm 102.49805,188.72848 13.22984,-13.43029 53.15322,0.0668 12.99598,13.22984 -39.65611,39.75635 z';
    end;
    Designer.Modified;
  end;
end;

procedure TFMXRatingBarComponentEditor.PrepareItem(index: Integer;
  const AItem: IMenuItem);
var
  MenuItem: IMenuItem;
begin
  case Index of
    0:
    begin
      MenuItem := AItem.AddItem('Star', 0, False, True, MenuItemHandler);
      MenuItem.Tag := 0;
      MenuItem := nil;
      MenuItem := AItem.AddItem('Heart', 0, False, True, MenuItemHandler);
      MenuItem.Tag := 1;
      MenuItem := nil;
      MenuItem := AItem.AddItem('Diamond', 0, False, True, MenuItemHandler);
      MenuItem.Tag := 2;
      MenuItem := nil;
    end;
  end;
end;

end.
