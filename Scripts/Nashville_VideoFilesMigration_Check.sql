--Create MergeStatus, mFileID, mCameraID, mServerID Columns in Gaining InsightEnt
USE Nashville2017
ALTER TABLE dbo.VideoFiles
ADD MergeStatus int,
mFileID int,
mCameraID int,
mServerID int;
GO

--Create MergeStatus, mFileID, mCameraID, mServerID Columns in Donor InsightEnt
USE Nashville2008R2
ALTER TABLE dbo.VideoFiles
ADD MergeStatus int,
mFileID int,
mCameraID int,
mServerID int;
GO

-- Set MergeStatus column to NULL
UPDATE Nashville2008R2.dbo.VideoFiles
SET MergeStatus = NULL
GO

-- Copy FileID, CameraID, ServerID to m columns
USE Nashville2008R2
DECLARE @count int = (SELECT min(FileID) FROM Nashville2008R2.dbo.VideoFiles)
DECLARE @maxID int 

SET @maxID = (SELECT max(FileID) FROM Nashville2008R2.dbo.VideoFiles)

WHILE @count <= @maxID

BEGIN

DECLARE @mFileID nvarchar(10) = (SELECT min(FileID) FROM Nashville2008R2.dbo.VideoFiles WHERE MergeStatus IS NULL)
DECLARE @mCameraID nvarchar(10) = (SELECT CameraID FROM Nashville2008R2.dbo.VideoFiles WHERE FileID = @mFileID)
DECLARE @mServerID nvarchar(10) = (SELECT ServerID FROM Nashville2008R2.dbo.VideoFiles WHERE FileID = @mFileID)

DECLARE @sql NVARCHAR(max) = '

				BEGIN

					UPDATE Nashville2008R2.dbo.VideoFiles
					SET mFileID = ' + @mFileID+ ',
					mServerID = ' + @mServerID + ',
					mCameraID = ' + @mCameraID + ' WHERE FileID = ' + @mFileID + ';

					UPDATE Nashville2008R2.dbo.VideoFiles
					SET MergeStatus = 1 WHERE FileID = ' + @mFileID + ';		

				END				
							
				'			
EXEC (@sql)

SET @count = @count + 1
SET @mFileID = ''
SET @mCameraID = ''
SET @mServerID = ''

END

GO




