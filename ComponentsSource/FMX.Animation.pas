unit FMX.Animation;

interface
uses
  FMX.Ani;

type
  TFMXAnimation = class(TAnimation)
  protected
    procedure ProcessAnimation; override;
  end;
implementation

{ TFMXAnimation }

procedure TFMXAnimation.ProcessAnimation;
begin
  inherited;

end;

end.
