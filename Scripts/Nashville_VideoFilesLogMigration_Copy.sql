SET IDENTITY_INSERT dbo.VideoFilesLog ON

INSERT INTO Nashville2017.dbo.VideoFilesLog (
LogID,
LogTypeID,
FileID,
StartFrame,
StartTime,
KeyFrame,
KeyTime,
EndFrame,
EndTime,
HighestMotionPercent,
ZoneIDs,
Thumbnail,
Notes,
ReservedINT,
ReservedSTR,
ReservedINT1,
ReservedSTR1,
UID_INT,
UID_STR,
oServerID,
oCameraID,
LogMergeStatus,
lLogID,
lFileID,
lCameraID,
lServerID)

SELECT 

lLogID,
LogTypeID,
FileID,
StartFrame,
StartTime,
KeyFrame,
KeyTime,
EndFrame,
EndTime,
HighestMotionPercent,
ZoneIDs,
Thumbnail,
Notes,
ReservedINT,
ReservedSTR,
ReservedINT1,
ReservedSTR1,
UID_INT,
UID_STR,
oServerID,
oCameraID,
LogMergeStatus,
lLogID,
lFileID,
lCameraID,
lServerID

FROM Nashville2008R2.dbo.VideoFilesLog WHERE LogMergeStatus = 2

SET IDENTITY_INSERT dbo.VideoFilesLog OFF