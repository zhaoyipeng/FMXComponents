unit BaiduMapAPI.NaviService.CommTypes;

interface

uses
  FMX.Maps;

type
  TBNRoutePlanNode = record
    location:TMapCoordinate;  //坐标
    name:string; //算路节点名
    description:string; //算路节点地址描述
  end;

  TBNRoutePlanNodes = TArray<TBNRoutePlanNode>;

implementation

end.
