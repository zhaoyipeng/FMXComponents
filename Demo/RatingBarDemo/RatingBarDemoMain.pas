unit RatingBarDemoMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.RatingBar, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TRatingBarDemoForm = class(TForm)
    FMXRatingBar1: TFMXRatingBar;
    FMXRatingBar2: TFMXRatingBar;
    FMXRatingBar3: TFMXRatingBar;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FMXRatingBar1Changed(Sender: TObject);
    procedure FMXRatingBar3Changed(Sender: TObject);
    procedure FMXRatingBar2Changed(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RatingBarDemoForm: TRatingBarDemoForm;

implementation

{$R *.fmx}

procedure TRatingBarDemoForm.FMXRatingBar1Changed(Sender: TObject);
begin
  Label1.Text := FMXRatingBar1.Value.ToString;
end;

procedure TRatingBarDemoForm.FMXRatingBar2Changed(Sender: TObject);
begin
  Label2.Text := FMXRatingBar2.Value.ToString;
end;

procedure TRatingBarDemoForm.FMXRatingBar3Changed(Sender: TObject);
begin
  Label3.Text := FMXRatingBar3.Value.ToString;
end;

end.
