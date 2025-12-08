SELECT *
FROM Visit
WHERE PatientCategoryID=3

SELECT *
FROM Visit v
INNER JOIN
PatientCategory PC
ON v.PatientCategoryID=PC.PatientCategoryID

SELECT v.*, v.VisitId, VisitDate,
PC.Name AS PatientCategory, P.FirstName + ' '+ P.LastName AS patientName,
D.FirstName + ' ' + D.LastName AS DoctorName,
u.Name AS UnitName
FROM Visit v
INNER JOIN PatientCategory PC
ON v.PatientCategoryID = PC.PatientCategoryID
INNER JOIN Patient p
ON v.PatientId = p.PatientID
INNER JOIN Doctor d
ON v.DoctorID=D.DoctorID
INNER JOIN Unit U
ON v.UnitId=U.UnitID
INNER JOIN Department dp
D.departmentid=dp.DepartmentID

--Qustion 1
--Patient visited at hospital
Select VisitDate , OPDNumber, PC.Name AS PatientCategory, P.FirstName + ' '+ P.LastName AS PatientName, D.FirstName + ' ' + D.LastName AS DoctorName,
U.Name AS UnitName
FROM Visit V
INNER JOIN PatientCategory PC
ON V.PatientCategoryID=PC.PatientCategoryID
INNER JOIN Patient P
ON V.PatientId=P.PatientID
INNER JOIN Doctor D
ON V.DoctorID=D.DoctorID
INNER JOIN Unit u
ON V.UnitId=U.UnitID

-- Question 2
-- Patient addmited in Hospital

SELECT A.AdmissionDate, A.IPDNumber, 
PC.Name AS PatientCategory, P.FirstName, + ' '+ P.LastName, D.FirstName + ' ' + D.LastName AS DoctorName,
U.Name as UnitName, DS.DischargeDate
FROM Admission A
INNER JOIN PatientCategory PC
ON A.PatientCategoryID=PC.PatientCategoryID
INNER JOIN Patient P
ON A.PatientId=P.PatientID
INNER JOIN Doctor D
ON A.DoctorId=D.DoctorID
INNER JOIN Unit U
ON A.UnitId=U.UnitID
INNER JOIN Discharge DS
ON A.AdmissionId=DS.AdmissionId


----Question 3

---Number of Patient visited to Medicine Dept in June 2022 

SELECT Count(1) AS NumberOfPatients 
FROM Visit V
INNER JOIN Doctor D
ON v.DoctorID=D.DoctorID
LEFT JOIN Department dp
ON d.DepartmentID=dp.DepartmentID
WHERE Year(VisitDate) = 2022 AND Month(VisitDate)=06
AND dp.Name='Medicine'

---Question 4

---List the Patient who visited as well as Admitted in Cardiology Dept for Year 2022

SELECT V.PatientId, A.PatientId
FROM Visit V
INNER JOIN Admission A
ON V.PatientId=A.PatientId
INNER JOIN Doctor d
ON v.DoctorID=D.DoctorID
INNER JOIN Department dp
ON d.DepartmentID=dp.DepartmentID
INNER JOIN Doctor d1
ON A.DoctorId=d1.DoctorID
INNER JOIN Department dp1
ON d1.DepartmentID=dp1.DepartmentID
WHERE Year(VisitDate)=2022 
AND dp.Name='Cardiology' AND
Year(AdmissionDate)=2022 
AND dp1.Name='Cardiology'

----Question 5

----Yearwise & Departmentwise visited Patient

SELECT Year(VisitDate) AS Year__, dp.Name AS Department, 
Count(PatientId) AS PatientCount
FROM Visit V
INNER JOIN Doctor d
ON v.DoctorID=D.DoctorID
INNER JOIN Department dp
ON d.DepartmentID=dp.DepartmentID
WHERE Year(VisitDate)=2022
GROUP BY Year(VisitDate), dp.Name
