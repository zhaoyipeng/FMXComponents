unit LoadingIndicatorDemoMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.LoadingIndicator;

type
  TLoadingIndicatorDemoMainForm = class(TForm)
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    Button1: TButton;
    FMXLoadingIndicator2: TFMXLoadingIndicator;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoadingIndicatorDemoMainForm: TLoadingIndicatorDemoMainForm;

implementation

{$R *.fmx}

procedure TLoadingIndicatorDemoMainForm.Button1Click(Sender: TObject);
begin
  FMXLoadingIndicator1.Active := not FMXLoadingIndicator1.Active;
  FMXLoadingIndicator2.Active := not FMXLoadingIndicator2.Active;
end;

end.
