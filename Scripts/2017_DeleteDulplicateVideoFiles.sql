USE Nashville2017

DELETE FROM dbo.VideoFiles 

WHERE CameraID IN (SELECT ncn.CameraID
FROM dbo.Cameras ncn

INNER JOIN Nashville2017.dbo.Cameras nco ON nco.CameraID = ncn.CameraID)