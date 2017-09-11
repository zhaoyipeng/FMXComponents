unit iOSapi.AVFoundation.Helper;

interface

uses
  iOSapi.Foundation, iOSapi.AVFoundation;

function AVEncoderAudioQualityKey: NSString;
function AVAudioSessionCategoryPlayAndRecord: NSString;

implementation

function AVEncoderAudioQualityKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVEncoderAudioQualityKey');
end;

function AVAudioSessionCategoryPlayAndRecord: NSString;
begin
  result := CocoaNSStringConst( libAVFoundation, 'AVAudioSessionCategoryPlayAndRecord' );
end;

end.
