USE Nashville2017

SELECT ncn.CameraID, ncn.CameraName AS '2017', ncn.ServerID AS '2017_ServerID', nco.CameraName AS '2008R2', nco.ServerID AS '2008R2_ServerID'
FROM dbo.Cameras ncn

INNER JOIN Nashville2008R2.dbo.Cameras nco ON nco.CameraID = ncn.CameraID