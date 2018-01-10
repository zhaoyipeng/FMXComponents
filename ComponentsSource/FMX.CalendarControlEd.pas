unit FMX.CalendarControlEd;

interface

uses
  System.Classes,
  DesignIntf,
  DesignEditors,
  DesignMenus,
  FMX.CalendarControl;

type
  TFMXCalendarControlEditor = class(TComponentEditor)
  public
    procedure Edit; override;
    procedure ExecuteVerb(index: Integer); override;
    function GetVerb(index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

procedure register;

implementation

procedure register;
begin
  RegisterComponentEditor(TFMXCalendarControl, TFMXCalendarControlEditor);
end;


{ TLogGraphComponentEditor }

procedure TFMXCalendarControlEditor.Edit;
begin
  inherited;
end;

procedure TFMXCalendarControlEditor.ExecuteVerb(index: Integer);
var
  CompOwner: TComponent;
  cal: TFMXCalendarControl;
begin
  inherited;
  CompOwner := Designer.GetRoot;
  if CompOwner <> nil then
  begin
    cal := TFMXCalendarControl(Component);
    case index of
      0: // Chinese
      begin
        cal.SetMonthNames(TCnMonths);
        cal.SetWeekNames(TCnWeeks);
      end;
      1: // English
      begin
        cal.SetMonthNames(TEnMonths);
        cal.SetWeekNames(TEnWeeks);
      end;
    end;
    Designer.Modified;
  end;
end;

function TFMXCalendarControlEditor.GetVerb(index: Integer): string;
begin
  case index of
    0:
      Result := 'Chinese';
    1:
      Result := 'English';
  end;
end;

function TFMXCalendarControlEditor.GetVerbCount: Integer;
begin
  Result := 2;
end;

end.
