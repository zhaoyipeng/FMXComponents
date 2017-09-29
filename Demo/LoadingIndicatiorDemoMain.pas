unit LoadingIndicatiorDemoMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.LoadingIndicator,
  FMX.Objects;

type
  TLoadingIndicatorDemoForm = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Rectangle3: TRectangle;
    Label13: TLabel;
    rect1: TRectangle;
    Rectangle2: TRectangle;
    Label1: TLabel;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    GridPanelLayout2: TGridPanelLayout;
    FMXLoadingIndicator6: TFMXLoadingIndicator;
    FMXLoadingIndicator7: TFMXLoadingIndicator;
    FMXLoadingIndicator8: TFMXLoadingIndicator;
    FMXLoadingIndicator9: TFMXLoadingIndicator;
    FMXLoadingIndicator10: TFMXLoadingIndicator;
    FMXLoadingIndicator11: TFMXLoadingIndicator;
    FMXLoadingIndicator13: TFMXLoadingIndicator;
    FMXLoadingIndicator14: TFMXLoadingIndicator;
    FMXLoadingIndicator12: TFMXLoadingIndicator;
    FMXLoadingIndicator5: TFMXLoadingIndicator;
    FMXLoadingIndicator4: TFMXLoadingIndicator;
    FMXLoadingIndicator3: TFMXLoadingIndicator;
    FMXLoadingIndicator2: TFMXLoadingIndicator;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    FMXLoadingIndicator15: TFMXLoadingIndicator;
    FMXLoadingIndicator16: TFMXLoadingIndicator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoadingIndicatorDemoForm: TLoadingIndicatorDemoForm;

implementation

{$R *.fmx}

end.
