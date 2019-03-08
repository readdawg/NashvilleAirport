
-- Change doror table FileID where EXISTS in gaining table
USE Nashville2008R2
DECLARE @count int = (SELECT min(FileID) FROM Nashville2008R2.dbo.VideoFiles)
DECLARE @maxID int
DECLARE @iFileID int = (SELECT max(FILEID) FROM Nashville2017.dbo.VideoFiles) + 1

SET @maxID = (SELECT max(FileID) FROM Nashville2008R2.dbo.VideoFiles)

WHILE @count <= @maxID

BEGIN

DECLARE @FileID nvarchar(10) = (SELECT min(FileID) FROM Nashville2008R2.dbo.VideoFiles WHERE MergeStatus = 1)
DECLARE @cFileID nvarchar(10) = @iFileID

DECLARE @sql NVARCHAR(max) = '

				BEGIN

					

					UPDATE Nashville2008R2.dbo.VideoFiles
					SET mFileID = ' + @cFileID + ',
					MergeStatus = 2 WHERE FileID = ' + @FileID + ';	
					
										

				END				
							
				'			
EXEC (@sql)

SET @count = @count + 1
SET @iFileID = @iFileID + 1

END

GO