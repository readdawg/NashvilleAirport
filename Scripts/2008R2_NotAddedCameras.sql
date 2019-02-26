USE Nashville2008R2

SELECT CameraID, CameraName, ServerID
FROM dbo.Cameras
--WHERE CameraID = (SELECT MIN(ncn.CameraID)
WHERE CameraID NOT IN (SELECT ncn.CameraID
FROM dbo.Cameras ncn

INNER JOIN Nashville2017.dbo.Cameras nco ON nco.CameraID = ncn.CameraID)