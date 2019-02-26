
DELETE FROM dbo.VideoFilesLog

WHERE oCameraID IN (SELECT ncn.CameraID
FROM dbo.Cameras ncn

INNER JOIN Nashville2017.dbo.Cameras nco ON nco.CameraID = ncn.CameraID)
GO