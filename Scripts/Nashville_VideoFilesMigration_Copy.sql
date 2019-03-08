SET IDENTITY_INSERT dbo.VideoFiles ON

INSERT INTO Nashville2017.dbo.VideoFiles (
FileID,
FileName,
ServerID,
CameraID,
TotalFrames,
StartTime,
EndTime,
RecordingType,
Flag,
FileManipulationStatus,
MergeStatus,
mFileID,
mCameraID,
mServerID)

SELECT 

mFileID,
FileName,
ServerID,
CameraID,
TotalFrames,
StartTime,
EndTime,
RecordingType,
Flag,
FileManipulationStatus,
MergeStatus,
mFileID,
mCameraID,
mServerID

FROM Nashville2008R2.dbo.VideoFiles WHERE MergeStatus = 2

SET IDENTITY_INSERT dbo.VideoFiles OFF