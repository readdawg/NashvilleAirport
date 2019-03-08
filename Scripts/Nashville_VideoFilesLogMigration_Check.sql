--Create MergeStatus, mFileID, mCameraID, mServerID Columns in Gaining Nashville2017
USE Nashville2017
ALTER TABLE dbo.VideoFilesLog
ADD LogMergeStatus int,
lLogID int,
lFileID int,
lCameraID int,
lServerID int;
GO

--Create MergeStatus, mFileID, mCameraID, mServerID Columns in Donor Nashville2017
USE Nashville2008R2
ALTER TABLE dbo.VideoFilesLog
ADD LogMergeStatus int,
lLogID int,
lFileID int,
lCameraID int,
lServerID int;
GO

-- Set MergeStatus column to NULL
UPDATE Nashville2008R2.dbo.VideoFilesLog
SET LogMergeStatus = NULL
GO

-- Copy FileID, CameraID, ServerID to m columns
USE Nashville2008R2
DECLARE @count int = (SELECT min(LogID) FROM Nashville2008R2.dbo.VideoFilesLog)
DECLARE @maxID int 

SET @maxID = (SELECT max(LogID) FROM Nashville2008R2.dbo.VideoFilesLog)

WHILE @count <= @maxID

BEGIN

DECLARE @lLogID nvarchar(10) = (SELECT min(LogID) FROM Nashville2008R2.dbo.VideoFilesLog WHERE LogMergeStatus IS NULL)
DECLARE @lCameraID nvarchar(10) = (SELECT oCameraID FROM Nashville2008R2.dbo.VideoFilesLog WHERE LogID = @lLogID)
DECLARE @lServerID nvarchar(10) = (SELECT oServerID FROM Nashville2008R2.dbo.VideoFilesLog WHERE LogID = @lLogID)
DECLARE @lFileID nvarchar(10) = (SELECT FileID FROM Nashville2008R2.dbo.VideoFilesLog WHERE LogID = @lLogID)

DECLARE @sql NVARCHAR(max) = '

				BEGIN

					UPDATE Nashville2008R2.dbo.VideoFilesLog
					SET lLogID = ' + @lLogID + ',
					lFileID = ' + @lFileID+ ',
					lServerID = ' + @lServerID + ',
					lCameraID = ' + @lCameraID + ' WHERE LogID = ' + @lLogID + ';

					UPDATE Nashville2008R2.dbo.VideoFilesLog
					SET LogMergeStatus = 1 WHERE LogID = ' + @lLogID + ';		

				END				
							
				'			
EXEC (@sql)

SET @count = @count + 1
SET @lLogID = ''
SET @lFileID = ''
SET @lCameraID = ''
SET @lServerID = ''

END

GO