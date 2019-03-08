
-- Change doror table LogID where EXISTS in gaining table
USE Nashville2008R2
DECLARE @count int = (SELECT min(LogID) FROM Nashville2008R2.dbo.VideoFilesLog)
DECLARE @maxID int
DECLARE @iLogID int = 50000 --(SELECT max(LogID) FROM Nashville2017.dbo.VideoFilesLog) + 1

SET @maxID = (SELECT max(LogID) FROM Nashville2008R2.dbo.VideoFilesLog)

WHILE @count <= @maxID

BEGIN

DECLARE @LogID nvarchar(20) = 370520874 --(SELECT min(LogID) FROM Nashville2008R2.dbo.VideoFilesLog WHERE LogMergeStatus = 2) -- changed from 1 to 2
DECLARE @cLogID nvarchar(20) = @iLogID

DECLARE @oFileID nvarchar (20) = (SELECT FileID FROM Nashville2008R2.dbo.VideoFilesLog WHERE LogID = @LogID)
DECLARE @nFileID nvarchar (20) = (SELECT mFileID FROM Nashville2008R2.dbo.VideoFiles WHERE FileID = @oFileID)

DECLARE @sql NVARCHAR(max) = '

				BEGIN

					UPDATE Nashville2008R2.dbo.VideoFilesLog
					SET lLogID = ' + @cLogID + ',
					FileID = ' + @nFileID + ',
					LogMergeStatus = 2 WHERE LogID = ' + @LogID + ';							

				END				
							
				'			
PRINT (@sql)

SET @count = @count + 1
SET @iLogID = @iLogID + 1

END

GO