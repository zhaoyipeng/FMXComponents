unit qcndate;

interface

{
  本单元算法数据使用自早期 UCDOS 的农历数据，本来想使用寿星万年历的数据，但太复杂
  所以暂时舍弃。

  本单元Delphi接口由swish设计实现，版权归swish所有。

更新日志
  2015.2.26
  ==========
  * 修正了在2007下的编译警告（感谢麦子仲肥）
}
uses
  System.Classes,
  System.SysUtils;

type
{$HPPEMIT '#pragma link "qcndate"'}
  TCnDate = record
    case Integer of
      1:
        (Year: Word; Month: Shortint; Day: Byte); // 16位年，8位月，8位日
      2:
        (Value: Integer); // 32位的整数值
  end;

const
  CnDayNames: array [1 .. 30] of String = ('初一', '初二', '初三', '初四', '初五', '初六',
    '初七', '初八', '初九', '初十', '十一', '十二', '十三', '十四', '十五', '十六', '十七', '十八',
    '十九', '二十', '廿一', '廿二', '廿三', '廿四', '廿五', '廿六', '廿七', '廿八', '廿九', '三十');
  CnMonthNames: array [1 .. 12] of String = ('正月', '二月', '三月', '四月', '五月',
    '六月', '七月', '八月', '九月', '十月', '冬月', '腊月');
  CnSkyNames: array [1 .. 10] of String = ('甲', '乙', '丙', '丁', '戊', '己', '庚',
    '辛', '壬', '癸');
  CnEarthNames: array [1 .. 12] of String = ('子', '丑', '寅', '卯', '辰', '巳',
    '午', '未', '申', '酉', '戌', '亥');
  CnAnimals: array [1 .. 12] of String = ('鼠', '牛', '虎', '兔', '龙', '蛇', '马',
    '羊', '猴', '鸡', '狗', '猪');
  CnSolarTerms: array [0 .. 24] of String = ('', '小寒', '大寒', '立春', '雨水', '惊蛰',
    '春分', '清明', '谷雨', '立夏', '小满', '芒种', '夏至', '小暑', '大暑', '立秋', '处暑', '白露',
    '秋分', '寒露', '霜降', '立冬', '小雪', '大雪', '冬至');
  CnWeekNames: array [1 .. 7] of String = ('一', '二', '三', '四', '五', '六', '日');
  /// <summary>
  /// 将指定的农历年月日编码为一个TCnDate变量
  /// </summary>
  /// <params>
  /// <param name="Y">农历年份，取值范围为1901-2050  </param>
  /// <param name="M">农历月份，负数代表是闰月</param>
  /// <param name="D">农历日数，取值范围为1-30</param>
  /// </params>
  /// <returns>返回编码后日期</returns>
function CnDate(Y: Word; M, D: Shortint): TCnDate; inline;
/// <summary>将指定的日期转换为农历日期</summary>
/// <params>
/// <param name=“ADate">阳历日期</param>
/// </params>
/// <returns>返回转换后的日期</returns>
function ToCnDate(ADate: TDateTime): TCnDate; overload;
/// <summary>将指定的日期转换为农历日期</summary>
/// <params>
/// <param name=“yyyy">阳历年份</param>
/// <param name="mm">阳历月份</param>
/// <param name="dd">阳历日</param>
/// </params>
/// <returns>返回转换后的日期</returns>
function ToCnDate(yyyy, mm, dd: Word): TCnDate; overload;
/// <summary>将指定农历日期转换为阳历日期</summary>
/// <params>
/// <param name="ADate">阴历日期</param>
/// </params>
/// <returns>返回转换后的阳历日期</returns>
function ToEnDate(ADate: TCnDate): TDateTime;
/// <summary>获取指定阳历日期的农历年份</summary>
/// <params>
/// <param name="ADate">阳历日期</param>
/// </params>
/// <returns>返回指定阳历日期的农历年份</returns>
function CnYearOf(ADate: TDateTime): Smallint; overload;
/// <summary>获取指定农历日期的年份的天干地支名称</summary>
/// <params>
/// <param name="ADate">阴历日期</param>
/// </params>
/// <returns>返回天干地支名称，如"甲午"</reutrns>
function CnYearName(ADate: TCnDate): String; overload;
/// <summary>获取指定阳历日期对应的农历年份的天干地支名称</summary>
/// <params>
/// <param name="ADate">阴历日期</param>
/// </params>
/// <returns>返回天干地支名称，如"甲午"</reutrns>
function CnYearName(ADate: TDateTime): String; overload;
/// <summary>获取指定阳历日期对应的月份数</summary>
/// <params>
/// <param name="ADate">阳历日期</param>
/// </params>
/// <returns>返回月份数，取值范围为1-12，-12~-1，负数代表是闰月</returns>
function CnMonthOf(ADate: TDateTime): Shortint; overload;
/// <summary>获取指定农历日期对应的月份名称</summary>
/// <params>
/// <param name="ADate">农历日期</param>
/// </params>
/// <returns>返回农历月份名称，如“腊月”</param>
function CnMonthName(ADate: TCnDate): String; overload;
/// <summary>获取指定阳历日期对应农历日期对应的月份名称</summary>
/// <params>
/// <param name="ADate">农历日期</param>
/// </params>
/// <returns>返回农历月份名称，如“腊月”</param>
function CnMonthName(ADate: TDateTime): String; overload;
/// <summary>获取指定农历年月的天数</summary>
/// <params>
/// <param name="Y">农历年份</param>
/// <param name="M">农历月份，负数代表闰月</param>
/// </params>
/// <returns>返回指定农历年月的天数</returns>
function CnMonthDays(Y: Word; M: Shortint): Byte;
/// <summary>获取指定阳历日期的农历日</summary>
/// <params>
/// <param name="ADate">阳历日期</param>
/// </params>
/// <returns>返回指定的农历日</returns>
function CnDayOf(ADate: TDateTime): Shortint; overload;
/// <summary>获取指定农历日期的中文名称</summary>
/// <params>
/// <param name="ADate">农历日期</param>
/// </params>
/// <returns>返回指定日期的日的中文名称</returns>
function CnDayName(ADate: TCnDate): String; overload;
/// <summary>获取指定阳历日期对应农历日期日的中文名称</summary>
/// <params>
/// <param name="ADate">阳历日期</param>
/// </params>
/// <returns>返回指定日期的日的中文名称</returns>
function CnDayName(ADate: TDateTime): String; overload;
/// <summary>获取指定小时的时刻名称</summary>
/// <params>
/// <param name="AHour">小时数，取值范围0-23</param>
/// </params>
/// <returns>返回中文的小时对应的时刻名称（子、丑等）</returns>
function CnHourName(AHour: Byte): String; overload;
/// <summary>获取指定的农历日期的属相名称</summary>
/// <params>
/// <param name="ADate">农历日期</param>
/// </params>
/// <returns>返回指定的农历年份对应的属相名称</returns>
function CnAnimalOf(ADate: TCnDate): String; overload;
/// <summary>获取指定的阳历日期的属相名称</summary>
/// <params>
/// <param name="ADate">阳历日期</param>
/// </params>
/// <returns>返回指定的阳历年份对应的属相名称</returns>
function CnAnimalOf(ADate: TDateTime): String; overload;
/// <summary>获取指定年份相应节气对应的阳历日期</summary>
/// <params>
/// <param name="AYear">农历年份</param>
/// <param name="AName">节气名称</param>
/// </params>
/// <returns>返回对应的阳历日期</returns>
function DateOfCnSolarTerm(AYear: Smallint; AName: String)
  : TDateTime; overload;
/// <summary>获取指定阳历日期对应的节气序号</summary>
/// <params>
/// <param name="AYear">阳历年份</param>
/// <param name="AMonth">阳历月份</param>
/// <param name="ADay">阳历日</param>
/// </params>
/// <returns>返回节气序列，如果不是任何节气，返回0</returns>
function CnSolarTerm(AYear, AMonth, ADay: Word): Shortint; overload;
/// <summary>获取指定农历日期对应的节气序号</summary>
/// <params>
/// <param name="AYear">农历年份</param>
/// <param name="AMonth">农历月份</param>
/// <param name="ADay">农历日</param>
/// </params>
/// <returns>返回节气序列，如果不是任何节气，返回0</returns>
function CnSolarTerm(ADate: TCnDate): Shortint; overload;
/// <summary>获取指定阳历日期对应的节气序号</summary>
/// <params>
/// <param name="ADate">阳历日期</param>
/// </params>
/// <returns>返回节气序列，如果不是任何节气，返回0</returns>
function CnSolarTerm(ADate: TDateTime): Shortint; overload;
/// <summary>获取指定农历日期对应的节气名称</summary>
/// <params>
/// <param name="ADate">农历日期</param>
/// </params>
/// <returns>返回节气名称，如果不属于任何节气，返回空字符串</returns>
function CnSolarTermName(ADate: TCnDate): String; overload;
/// <summary>获取指定阳历日期对应的节气名称</summary>
/// <params>
/// <param name="ADate">阳历日期</param>
/// </params>
/// <returns>返回节气名称，如果不属于任何节气，返回空字符串</returns>
function CnSolarTermName(ADate: TDateTime): String; overload;
/// <summary>获取指定日期在相应的农历年份中的周次</summary>
/// <params>
/// <param name="ADate">阳历日期</param>
/// </params>
/// <returns>返回周次</returns>
function CnWeeksInYear(const ADate: TDateTime): Byte;
/// <summary>增加指定的农历的年数</summary>
/// <params>
/// <param name="ADate">当前日期</param>
/// <param name="ADelta">增量</param>
/// </params>
/// <returns>返回增加或减少（负增量）的年数后的农历日期</returns>
function CnIncYear(ADate: TCnDate; ADelta: Integer = 1): TCnDate;
/// <summary>增加指定的农历的月数</summary>
/// <params>
/// <param name="ADate">当前日期</param>
/// <param name="ADelta">增量</param>
/// </params>
/// <returns>返回增加或减少（负增量）的月数后的农历日期</returns>
function CnIncMonth(ADate: TCnDate; ADelta: Integer = 1): TCnDate;
/// <summary>增加指定的农历的天数</summary>
/// <params>
/// <param name="ADate">当前日期</param>
/// <param name="ADelta">增量</param>
/// </params>
/// <returns>返回增加或减少（负增量）的月数后的农历日期</returns>
function CnIncDay(ADate: TCnDate; ADelta: Integer = 1): TCnDate;

implementation

uses math, dateutils;

const
  // 农历月份数据，每年4字节，从1901年开始，共150年
  // 数据来源：UCDOS 6.0 UCT.COM
  // 分析整理：Copyright (c) 1996-1998, Randolph
  // 数据解析：
  // 如果第一字节的bit7为1，则该年1月1日位于农历12月，否则位于11月
  // 第一字节去除bit7为该年1月1日的农历日期
  // 第二字节                 第三字节
  // bit:     7  6  5  4  3  2  1  0   7  6  5  4  3  2  1  0
  // 农历月份:16 15 14 13 12 11 10 9   8  7  6  5  4  3  2  1
  // 农历月份指的是从该年1月1日的农历月份算起的顺序号
  // 农历月份对应的bit为1则该月为30日，否则为29日
  // 第四字节为闰月月份
  // BaseDate='2000/02/04';//2000立春
  BaseAnimalDate  = 1972; // 1972年支为子(是鼠年)
  BaseSkyStemDate = 1974; // 1974年干为甲
  START_YEAR      = 1901;
  END_YEAR        = 2050;

  gLunarHolDay: array [0 .. 1799] of Byte = ($96, $B4, $96, $A6, $97, $97, $78,
    $79, $79, $69, $78, $77, // 1901
    $96, $A4, $96, $96, $97, $87, $79, $79, $79, $69, $78, $78, // 1902
    $96, $A5, $87, $96, $87, $87, $79, $69, $69, $69, $78, $78, // 1903
    $86, $A5, $96, $A5, $96, $97, $88, $78, $78, $79, $78, $87, // 1904
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, // 1905
    $96, $A4, $96, $96, $97, $97, $79, $79, $79, $69, $78, $78, // 1906
    $96, $A5, $87, $96, $87, $87, $79, $69, $69, $69, $78, $78, // 1907
    $86, $A5, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, // 1908
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, // 1909
    $96, $A4, $96, $96, $97, $97, $79, $79, $79, $69, $78, $78, // 1910
    $96, $A5, $87, $96, $87, $87, $79, $69, $69, $69, $78, $78, // 1911
    $86, $A5, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, // 1912
    $95, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, // 1913
    $96, $B4, $96, $A6, $97, $97, $79, $79, $79, $69, $78, $78, // 1914
    $96, $A5, $97, $96, $97, $87, $79, $79, $69, $69, $78, $78, // 1915
    $96, $A5, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, // 1916
    $95, $B4, $96, $A6, $96, $97, $78, $79, $78, $69, $78, $87, // 1917
    $96, $B4, $96, $A6, $97, $97, $79, $79, $79, $69, $78, $77, // 1918
    $96, $A5, $97, $96, $97, $87, $79, $79, $69, $69, $78, $78, // 1919
    $96, $A5, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, // 1920
    $95, $B4, $96, $A5, $96, $97, $78, $79, $78, $69, $78, $87, // 1921
    $96, $B4, $96, $A6, $97, $97, $79, $79, $79, $69, $78, $77, // 1922
    $96, $A4, $96, $96, $97, $87, $79, $79, $69, $69, $78, $78, // 1923
    $96, $A5, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, // 1924
    $95, $B4, $96, $A5, $96, $97, $78, $79, $78, $69, $78, $87, // 1925
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, // 1926
    $96, $A4, $96, $96, $97, $87, $79, $79, $79, $69, $78, $78, // 1927
    $96, $A5, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, // 1928
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, // 1929
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, // 1930
    $96, $A4, $96, $96, $97, $87, $79, $79, $79, $69, $78, $78, // 1931
    $96, $A5, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, // 1932
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, // 1933
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, // 1934
    $96, $A4, $96, $96, $97, $97, $79, $79, $79, $69, $78, $78, // 1935
    $96, $A5, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, // 1936
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, // 1937
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, // 1938
    $96, $A4, $96, $96, $97, $97, $79, $79, $79, $69, $78, $78, // 1939
    $96, $A5, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, // 1940
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, // 1941
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, // 1942
    $96, $A4, $96, $96, $97, $97, $79, $79, $79, $69, $78, $78, // 1943
    $96, $A5, $96, $A5, $A6, $96, $88, $78, $78, $78, $87, $87, // 1944
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, // 1945
    $95, $B4, $96, $A6, $97, $97, $78, $79, $78, $69, $78, $77, // 1946
    $96, $B4, $96, $A6, $97, $97, $79, $79, $79, $69, $78, $78, // 1947
    $96, $A5, $A6, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, // 1948
    $A5, $B4, $96, $A5, $96, $97, $88, $79, $78, $79, $77, $87, // 1949
    $95, $B4, $96, $A5, $96, $97, $78, $79, $78, $69, $78, $77, // 1950
    $96, $B4, $96, $A6, $97, $97, $79, $79, $79, $69, $78, $78, // 1951
    $96, $A5, $A6, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, // 1952
    $A5, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, // 1953
    $95, $B4, $96, $A5, $96, $97, $78, $79, $78, $68, $78, $87, // 1954
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, // 1955
    $96, $A5, $A5, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, // 1956
    $A5, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, // 1957
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, // 1958
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, // 1959
    $96, $A4, $A5, $A5, $A6, $96, $88, $88, $88, $78, $87, $87, // 1960
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, // 1961
    $96, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, // 1962
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, // 1963
    $96, $A4, $A5, $A5, $A6, $96, $88, $88, $88, $78, $87, $87, // 1964
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, // 1965
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, // 1966
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, // 1967
    $96, $A4, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, // 1968
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, // 1969
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, // 1970
    $96, $B4, $96, $A6, $97, $97, $78, $79, $79, $69, $78, $77, // 1971
    $96, $A4, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, // 1972
    $A5, $B5, $96, $A5, $A6, $96, $88, $78, $78, $78, $87, $87, // 1973
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, // 1974
    $96, $B4, $96, $A6, $97, $97, $78, $79, $78, $69, $78, $77, // 1975
    $96, $A4, $A5, $B5, $A6, $A6, $88, $89, $88, $78, $87, $87, // 1976
    $A5, $B4, $96, $A5, $96, $96, $88, $88, $78, $78, $87, $87, // 1977
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $78, $87, // 1978
    $96, $B4, $96, $A6, $96, $97, $78, $79, $78, $69, $78, $77, // 1979
    $96, $A4, $A5, $B5, $A6, $A6, $88, $88, $88, $78, $87, $87, // 1980
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $77, $87, // 1981
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, // 1982
    $95, $B4, $96, $A5, $96, $97, $78, $79, $78, $69, $78, $77, // 1983
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $87, // 1984
    $A5, $B4, $A6, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, // 1985
    $A5, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, // 1986
    $95, $B4, $96, $A5, $96, $97, $88, $79, $78, $69, $78, $87, // 1987
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, // 1988
    $A5, $B4, $A5, $A5, $A6, $96, $88, $88, $88, $78, $87, $87, // 1989
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $79, $77, $87, // 1990
    $95, $B4, $96, $A5, $86, $97, $88, $78, $78, $69, $78, $87, // 1991
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, // 1992
    $A5, $B3, $A5, $A5, $A6, $96, $88, $88, $88, $78, $87, $87, // 1993
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, // 1994
    $95, $B4, $96, $A5, $96, $97, $88, $76, $78, $69, $78, $87, // 1995
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, // 1996
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, // 1997
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, // 1998
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, // 1999
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, // 2000
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, // 2001
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, // 2002
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, // 2003
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, // 2004
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, // 2005
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, // 2006
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $69, $78, $87, // 2007
    $96, $B4, $A5, $B5, $A6, $A6, $87, $88, $87, $78, $87, $86, // 2008
    $A5, $B3, $A5, $B5, $A6, $A6, $88, $88, $88, $78, $87, $87, // 2009
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, // 2010
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $78, $87, // 2011
    $96, $B4, $A5, $B5, $A5, $A6, $87, $88, $87, $78, $87, $86, // 2012
    $A5, $B3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $87, // 2013
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, // 2014
    $95, $B4, $96, $A5, $96, $97, $88, $78, $78, $79, $77, $87, // 2015
    $95, $B4, $A5, $B4, $A5, $A6, $87, $88, $87, $78, $87, $86, // 2016
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $87, // 2017
    $A5, $B4, $A6, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, // 2018
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $79, $77, $87, // 2019
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $86, // 2020
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, // 2021
    $A5, $B4, $A5, $A5, $A6, $96, $88, $88, $88, $78, $87, $87, // 2022
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $79, $77, $87, // 2023
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $96, // 2024
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, // 2025
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, // 2026
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, // 2027
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $96, // 2028
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, // 2029
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, // 2030
    $A5, $B4, $96, $A5, $96, $96, $88, $78, $78, $78, $87, $87, // 2031
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $96, // 2032
    $A5, $C3, $A5, $B5, $A6, $A6, $88, $88, $88, $78, $87, $86, // 2033
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $78, $88, $78, $87, $87, // 2034
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, // 2035
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $96, // 2036
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $86, // 2037
    $A5, $B3, $A5, $A5, $A6, $A6, $88, $88, $88, $78, $87, $87, // 2038
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, // 2039
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $78, $87, $96, // 2040
    $A5, $C3, $A5, $B5, $A5, $A6, $87, $88, $87, $78, $87, $86, // 2041
    $A5, $B3, $A5, $B5, $A6, $A6, $88, $88, $88, $78, $87, $87, // 2042
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, // 2043
    $95, $B4, $A5, $B4, $A5, $A6, $97, $87, $87, $88, $87, $96, // 2044
    $A5, $C3, $A5, $B4, $A5, $A6, $87, $88, $87, $78, $87, $86, // 2045
    $A5, $B3, $A5, $B5, $A6, $A6, $87, $88, $88, $78, $87, $87, // 2046
    $A5, $B4, $96, $A5, $A6, $96, $88, $88, $78, $78, $87, $87, // 2047
    $95, $B4, $A5, $B4, $A5, $A5, $97, $87, $87, $88, $86, $96, // 2048
    $A4, $C3, $A5, $A5, $A5, $A6, $97, $87, $87, $78, $87, $86, // 2049
    $A5, $C3, $A5, $B5, $A6, $A6, $87, $88, $78, $78, $87, $87); // 2050

  CnData: array [0 .. 599] of Byte = ($0B, $52, $BA, $00, $16, $A9, $5D, $00,
    $83, $A9, $37, $05, $0E, $74, $9B, $00, $1A, $B6, $55, $00, $87, $B5, $55,
    $04, $11, $55, $AA, $00, $1C, $A6, $B5, $00, $8A, $A5, $75, $02, $14, $52,
    $BA, $00, $81, $52, $6E, $06, $0D, $E9, $37, $00, $18, $74, $97, $00, $86,
    $EA, $96, $05, $10, $6D, $55, $00, $1A, $35, $AA, $00, $88, $4B, $6A, $02,
    $13, $A5, $6D, $00, $1E, $D2, $6E, $07, $0B, $D2, $5E, $00, $17, $E9, $2E,
    $00, $84, $D9, $2D, $05, $0F, $DA, $95, $00, $19, $5B, $52, $00, $87, $56,
    $D4, $04, $11, $4A, $DA, $00, $1C, $A5, $5D, $00, $89, $A4, $BD, $02, $15,
    $D2, $5D, $00, $82, $B2, $5B, $06, $0D, $B5, $2B, $00, $18, $BA, $95, $00,
    $86, $B6, $A5, $05, $10, $56, $B4, $00, $1A, $4A, $DA, $00, $87, $49, $BA,
    $03, $13, $A4, $BB, $00, $1E, $B2, $5B, $07, $0B, $72, $57, $00, $16, $75,
    $2B, $00, $84, $6D, $2A, $06, $0F, $AD, $55, $00, $19, $55, $AA, $00, $86,
    $55, $6C, $04, $12, $C9, $76, $00, $1C, $64, $B7, $00, $8A, $E4, $AE, $02,
    $15, $EA, $56, $00, $83, $DA, $55, $07, $0D, $5B, $2A, $00, $18, $AD, $55,
    $00, $85, $AA, $D5, $05, $10, $53, $6A, $00, $1B, $A9, $6D, $00, $88, $A9,
    $5D, $03, $13, $D4, $AE, $00, $81, $D4, $AB, $08, $0C, $BA, $55, $00, $16,
    $5A, $AA, $00, $83, $56, $AA, $06, $0F, $AA, $D5, $00, $19, $52, $DA, $00,
    $86, $52, $BA, $04, $11, $A9, $5D, $00, $1D, $D4, $9B, $00, $8A, $74, $9B,
    $03, $15, $B6, $55, $00, $82, $AD, $55, $07, $0D, $55, $AA, $00, $18, $A5,
    $B5, $00, $85, $A5, $75, $05, $0F, $52, $B6, $00, $1B, $69, $37, $00, $89,
    $E9, $37, $04, $13, $74, $97, $00, $81, $EA, $96, $08, $0C, $6D, $52, $00,
    $16, $2D, $AA, $00, $83, $4B, $6A, $06, $0E, $A5, $6D, $00, $1A, $D2, $6E,
    $00, $87, $D2, $5E, $04, $12, $E9, $2E, $00, $1D, $EC, $96, $0A, $0B, $DA,
    $95, $00, $15, $5B, $52, $00, $82, $56, $D2, $06, $0C, $2A, $DA, $00, $18,
    $A4, $DD, $00, $85, $A4, $BD, $05, $10, $D2, $5D, $00, $1B, $D9, $2D, $00,
    $89, $B5, $2B, $03, $14, $BA, $95, $00, $81, $B5, $95, $08, $0B, $56, $B2,
    $00, $16, $2A, $DA, $00, $83, $49, $B6, $05, $0E, $64, $BB, $00, $19, $B2,
    $5B, $00, $87, $6A, $57, $04, $12, $75, $2B, $00, $1D, $B6, $95, $00, $8A,
    $AD, $55, $02, $15, $55, $AA, $00, $82, $55, $6C, $07, $0D, $C9, $76, $00,
    $17, $64, $B7, $00, $86, $E4, $AE, $05, $11, $EA, $56, $00, $1B, $6D, $2A,
    $00, $88, $5A, $AA, $04, $14, $AD, $55, $00, $81, $AA, $D5, $09, $0B, $52,
    $EA, $00, $16, $A9, $6D, $00, $84, $A9, $5D, $06, $0F, $D4, $AE, $00, $1A,
    $EA, $4D, $00, $87, $BA, $55, $04, $12, $5A, $AA, $00, $1D, $AB, $55, $00,
    $8A, $A6, $D5, $02, $14, $52, $DA, $00, $82, $52, $BA, $06, $0D, $A9, $3B,
    $00, $18, $B4, $9B, $00, $85, $74, $9B, $05, $11, $B5, $4D, $00, $1C, $D6,
    $A9, $00, $88, $35, $AA, $03, $13, $A5, $B5, $00, $81, $A5, $75, $0B, $0B,
    $52, $B6, $00, $16, $69, $37, $00, $84, $E9, $2F, $06, $10, $F4, $97, $00,
    $1A, $75, $4B, $00, $87, $6D, $52, $05, $11, $2D, $69, $00, $1D, $95, $B5,
    $00, $8A, $A5, $6D, $02, $15, $D2, $6E, $00, $82, $D2, $5E, $07, $0E, $E9,
    $2E, $00, $19, $EA, $96, $00, $86, $DA, $95, $05, $10, $5B, $4A, $00, $1C,
    $AB, $69, $00, $88, $2A, $D8, $03);

function CnDate(Y: Word; M, D: Shortint): TCnDate;
begin
if (Y < 1901) or (Y > 2050) then
  raise EConvertError.CreateFmt('农历年份范围无效，只支持 1901-2050 年间的农历范围。', [Y]);
if (M > 12) or (M = 0) or (M < -12) then
  raise EConvertError.CreateFmt('农历月份范围无效，只支持 -12~-1,1-12 之间的有效值。', [M]);
if (D < 1) or (D > 30) then
  raise EConvertError.CreateFmt('农历日值范围无效，只支持 1-30 之间的有效值。', [M]);
Result.Year := Y;
Result.Day := CnMonthDays(Y, M);
if Result.Day = 0 then
  raise Exception.CreateFmt('指定的年份 %d 不存在 %s 月', [Y, CnMonthName(M)]);
Result.Month := M;
if Byte(D) > Result.Day then
  raise Exception.CreateFmt('指定的 %d 年 %s 月 %d 日无效，该月只有 %d 天',
    [Y, CnMonthName(M), Result.Day]);
Result.Day := D;
end;

// 日期是该年的第几天，1月1日为第一天
function DaysNumberOfDate(yyyy, mm, dd: Word): Integer; overload;
var
  I: Integer;
begin
Result := 0;
for I := 1 to mm - 1 do
  Inc(Result, MonthDays[IsLeapYear(yyyy), I]);
Inc(Result, dd);
end;

function DaysNumberOfDate(ADate: TDateTime): Integer; overload;
var
  yyyy, mm, dd: Word;
begin
DecodeDate(ADate, yyyy, mm, dd);
Result := DaysNumberOfDate(yyyy, mm, dd);
end;

function ToCnDate(ADate: TDateTime): TCnDate;
var
  yyyy, mm, dd: Word;
begin
DecodeDate(ADate, yyyy, mm, dd);
Result := ToCnDate(yyyy, mm, dd);
end;

function CnMonthDays(Y: Word; M: Shortint): Byte;
var
  CnMonth, CnMonthDays: array [0 .. 15] of Integer;
  Bytes: array [0 .. 3] of Byte;
  I: Integer;
  LeapMonth: Integer;
  CnMonthData: Word;
begin
Result := 0;
if (Y < 1901) or (Y > 2050) then
  Exit;
Bytes[0] := CnData[(Y - 1901) * 4];
Bytes[1] := CnData[(Y - 1901) * 4 + 1];
Bytes[2] := CnData[(Y - 1901) * 4 + 2];
Bytes[3] := CnData[(Y - 1901) * 4 + 3];
if (Bytes[0] and $80) <> 0 then
  CnMonth[0] := 12
else
  CnMonth[0] := 11;
CnMonthData := Bytes[1];
CnMonthData := CnMonthData shl 8;
CnMonthData := CnMonthData or Bytes[2];
LeapMonth := Bytes[3];
for I := 15 downto 0 do
  begin
  CnMonthDays[15 - I] := 29;
  if ((1 shl I) and CnMonthData) <> 0 then
    Inc(CnMonthDays[15 - I]);
  if CnMonth[15 - I] = LeapMonth then
    CnMonth[15 - I + 1] := -LeapMonth
  else
    begin
    if CnMonth[15 - I] < 0 then // 上月为闰月
      CnMonth[15 - I + 1] := -CnMonth[15 - I] + 1
    else
      CnMonth[15 - I + 1] := CnMonth[15 - I] + 1;
    if CnMonth[15 - I + 1] > 12 then
      CnMonth[15 - I + 1] := 1;
    end;
  end;
I := 0;
while I < 16 do
  begin
  if CnMonth[I] = 1 then // 1月
    begin
    while I < 16 do
      begin
      if CnMonth[I] = M then
        begin
        Result := CnMonthDays[I];
        Break;
        end;
      Inc(I);
      end;
    Break;
    end;
  Inc(I);
  end;
end;

function ToCnDate(yyyy, mm, dd: Word): TCnDate;
var
  CnMonth, CnMonthDays: array [0 .. 15] of Integer;
  CnBeginDay, LeapMonth: Integer;
  Bytes: array [0 .. 3] of Byte;
  I: Integer;
  CnMonthData: Word;
  ACnEnd: TCnDate;
  DaysCount, CnDaysCount, ResultMonth, ResultDay: Integer;
begin
if (yyyy < 1901) or (yyyy > 2050) then
  begin
  Result.Value := 0;
  Exit;
  end;
Bytes[0] := CnData[(yyyy - 1901) * 4];
Bytes[1] := CnData[(yyyy - 1901) * 4 + 1];
Bytes[2] := CnData[(yyyy - 1901) * 4 + 2];
Bytes[3] := CnData[(yyyy - 1901) * 4 + 3];
if (Bytes[0] and $80) <> 0 then
  CnMonth[0] := 12
else
  CnMonth[0] := 11;
CnBeginDay := (Bytes[0] and $7F);
CnMonthData := Bytes[1];
CnMonthData := CnMonthData shl 8;
CnMonthData := CnMonthData or Bytes[2];
LeapMonth := Bytes[3];
for I := 15 downto 0 do
  begin
  CnMonthDays[15 - I] := 29;
  if ((1 shl I) and CnMonthData) <> 0 then
    Inc(CnMonthDays[15 - I]);
  if CnMonth[15 - I] = LeapMonth then
    CnMonth[15 - I + 1] := -LeapMonth
  else
    begin
    if CnMonth[15 - I] < 0 then // 上月为闰月
      CnMonth[15 - I + 1] := -CnMonth[15 - I] + 1
    else
      CnMonth[15 - I + 1] := CnMonth[15 - I] + 1;
    if CnMonth[15 - I + 1] > 12 then
      CnMonth[15 - I + 1] := 1;
    end;
  end;
DaysCount := DaysNumberOfDate(yyyy, mm, dd) - 1;
if DaysCount <= (CnMonthDays[0] - CnBeginDay) then
  begin
  ACnEnd := ToCnDate(EncodeDate(yyyy - 1, 12, 31));
  if (yyyy > 1901) and (ACnEnd.Month < 0) then
    ResultMonth := -CnMonth[0]
  else
    ResultMonth := CnMonth[0];
  ResultDay := CnBeginDay + DaysCount;
  end
else
  begin
  CnDaysCount := CnMonthDays[0] - CnBeginDay;
  I := 1;
  while (CnDaysCount < DaysCount) and
    (CnDaysCount + CnMonthDays[I] < DaysCount) do
    begin
    Inc(CnDaysCount, CnMonthDays[I]);
    Inc(I);
    end;
  ResultMonth := CnMonth[I];
  ResultDay := DaysCount - CnDaysCount;
  end;
if (ResultMonth in [11, 12]) and (mm in [1, 2]) then
  Dec(yyyy);
Result.Year := yyyy;
Result.Month := ResultMonth;
Result.Day := ResultDay;
end;

function ToEnDate(ADate: TCnDate): TDateTime;
var
  tempDate: TDateTime;
  ADelta: Integer;
  ACnTemp: TCnDate;
begin
if ADate.Month > 11 then
  tempDate := EncodeDate(ADate.Year - 1, ADate.Month, ADate.Day)
else
  tempDate := EncodeDate(ADate.Year, abs(ADate.Month), ADate.Day);
Result := 0;
while Result = 0 do
  begin
  ACnTemp := ToCnDate(tempDate);
  if ACnTemp.Value = ADate.Value then
    begin
    Result := tempDate;
    Break;
    end
  else
    begin
    ADelta := 0;
    if ADate.Year <> ACnTemp.Year then
      ADelta := (abs(ADate.Month) + 11 - abs(ACnTemp.Month)) * 29
    else if ADate.Month <> ACnTemp.Month then
      begin
      if ADate.Month <> -ACnTemp.Month then
        ADelta := (abs(ADate.Month) - abs(ACnTemp.Month) - 1) * 29;
      end;
    if ADelta = 0 then
      ADelta := 1;
    tempDate := IncDay(tempDate, ADelta);
    end;
  end;
end;

function CnYearOf(ADate: TDateTime): Smallint;
begin
Result := ToCnDate(ADate).Year;
end;

function CnYearName(ADate: TCnDate): String;
begin
Result := CnSkyNames[(ADate.Year - BaseSkyStemDate) mod 10 + 1] + CnEarthNames
  [(ADate.Year - BaseAnimalDate) mod 12 + 1];
end;

function CnYearName(ADate: TDateTime): String;
begin
Result := CnYearName(ToCnDate(ADate));
end;

function CnMonthOf(ADate: TDateTime): Shortint;
begin
Result := ToCnDate(ADate).Month;
end;

function CnMonthName(ADate: TCnDate): String;
begin
if ADate.Month < 0 then
  Result := '闰' + CnMonthNames[-ADate.Month]
else
  Result := CnMonthNames[ADate.Month]
end;

function CnMonthName(ADate: TDateTime): String;
begin
Result := CnMonthName(ToCnDate(ADate));
end;

function CnDayOf(ADate: TDateTime): Shortint;
begin
Result := ToCnDate(ADate).Day;
end;

function CnDayName(ADate: TCnDate): String;
begin
Result := CnDayNames[ADate.Day];
end;

function CnDayName(ADate: TDateTime): String;
begin
Result := CnDayNames[ToCnDate(ADate).Day];
end;

function CnHourName(AHour: Byte): String;
begin
AHour := ((AHour + 1) shr 1) mod 12; //
Result := CnEarthNames[AHour + 1];
end;

function CnAnimalOf(ADate: TCnDate): String;
begin
Result := CnEarthNames[(ADate.Year - BaseAnimalDate) mod 12 + 1] +
  CnAnimals[(ADate.Year - BaseAnimalDate) mod 12 + 1];
end;

function CnAnimalOf(ADate: TDateTime): String;
begin
Result := CnAnimalOf(ToCnDate(ADate));
end;

function DateOfCnSolarTerm(AYear: Smallint; AName: String): TDateTime;
var
  AIndex: Integer;
  AFlags: Byte;
  ADay: Word;
  I: Integer;
begin
AIndex := (AYear - START_YEAR) * 12;
Result := 0;
for I := 1 to 12 do
  begin
  AFlags := gLunarHolDay[AIndex + I - 1];
  ADay := 15 - (AFlags shr 4) and $0F;
  if CnSolarTerms[((I - 1) shl 1) + 1] = AName then
    begin
    Result := EncodeDate(AYear, I, ADay);
    Break;
    end
  else
    begin
    ADay := 15 + (AFlags and $0F);
    if CnSolarTerms[I shl 1] = AName then
      begin
      Result := EncodeDate(AYear, I, ADay);
      Break;
      end
    end;
  end;
end;

function CnSolarTerm(ADate: TCnDate): Shortint;
begin
Result := CnSolarTerm(ToEnDate(ADate));
end;

function CnSolarTerm(ADate: TDateTime): Shortint;
var
  iYear, iMonth, iDay: Word;
begin
DecodeDate(ADate, iYear, iMonth, iDay);
Result := CnSolarTerm(iYear, iMonth, iDay);
end;

function CnSolarTermName(ADate: TCnDate): String;
begin
Result := CnSolarTerms[CnSolarTerm(ADate)];
end;

function CnSolarTermName(ADate: TDateTime): String;
begin
Result := CnSolarTerms[CnSolarTerm(ADate)];
end;

function CnSolarTerm(AYear, AMonth, ADay: Word): Shortint;
var
  Flag: Byte;
  Day: Word;
  AIndex: Integer;
begin
AIndex := (AYear - START_YEAR) * 12 + AMonth - 1;
Flag := gLunarHolDay[AIndex];
if ADay < 15 then
  Day := 15 - ((Flag shr 4) and $0F)
else
  Day := (Flag and $0F) + 15;
if ADay = Day then
  if ADay > 15 then
    Result := (AMonth - 1) * 2 + 2
  else
    Result := (AMonth - 1) * 2 + 1
else
  Result := 0;
end;

function CalcCnFirstDay(ADate: TDateTime): TDateTime;
var
  ATemp: TCnDate;
begin
ATemp.Year := CnYearOf(ADate);
ATemp.Month := 1;
ATemp.Day := 1;
Result := ToEnDate(ATemp);
end;

function CnWeeksInYear(const ADate: TDateTime): Byte;
var
  CnStartYearDate, CnEndYearDate: TDateTime;
begin
CnStartYearDate := CalcCnFirstDay(ADate);
CnEndYearDate := CalcCnFirstDay(IncYear(ADate));
Result := Trunc(CnEndYearDate - CnStartYearDate) div 7;
if DayOfTheWeek(CnStartYearDate) <> 1 then
  Inc(Result, 1);
if DayOfTheWeek(CnEndYearDate) <> 7 then
  Inc(Result, 1);
end;

function CnIncYear(ADate: TCnDate; ADelta: Integer): TCnDate;
var
  Days: Integer;
begin
Inc(ADate.Year, ADelta);
if (ADate.Year < 1901) or (ADate.Year > 2050) then
  raise Exception.Create('指定的年份范围越界，农历只支持 1901-2050年范围。');
Result.Year := ADate.Year;
if ADate.Month < 0 then
  Result.Month := -ADate.Month
else
  Result.Month := ADate.Month;
Days := CnMonthDays(Result.Year, Result.Month);
if ADate.Day <= Days then
  Result.Day := ADate.Day
else
  raise Exception.CreateFmt('编码日期时出错，无法获取 %d 年 %s 月的天数。',
    [Result.Year, CnMonthName(Result.Month)]);
end;

function CnIncDay(ADate: TCnDate; ADelta: Integer): TCnDate;
begin

end;

function CnIncMonth(ADate: TCnDate; ADelta: Integer): TCnDate;
var
  D: Byte;
begin
Result.Value := ADate.Value;
while ADelta > 0 do
  begin
  Result.Day := 1;
  Result := ToCnDate(IncDay(ToEnDate(Result), 31));
  D := CnMonthDays(Result.Year, Result.Month);
  if ADate.Day > D then
    Result.Day := D
  else
    Result.Day := ADate.Day;
  Dec(ADelta);
  end;
while ADelta < 0 do
  begin
  Result.Day := 1;
  Result := ToCnDate(IncDay(ToEnDate(Result), -2));
  D := CnMonthDays(Result.Year, Result.Month);
  if ADate.Day > D then
    Result.Day := D
  else
    Result.Day := ADate.Day;
  Inc(ADelta);
  end;
end;

end.

