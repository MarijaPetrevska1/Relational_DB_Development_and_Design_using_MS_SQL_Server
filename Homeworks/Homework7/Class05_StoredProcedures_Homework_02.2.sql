

-- Homework 7
-- Class05 - Stored Procedures

-- HOMEWORK 02.2

	USE SEDC_ACADEMY_HOMEWORK
	GO
-- Homework requirements:
-- => Create new procedure called CreateGradeDetail;

-- => Procedure should add details for specific Grade (new record for new
--    AchievementTypeID, Points, MaxPoints, Date for specific Grade);

-- => Output from this procedure should be resultset with SUM of
--    GradePoints calculated with formula
--    AchievementPoints/AchievementMaxPoints*ParticipationRate for
--    specific Grade

	CREATE PROCEDURE CreateGradeDetail
		@GradeID INT,
		@AchievementTypeID INT,
		@AchievementPoints SMALLINT,
		@AchievementMaxPoints SMALLINT,
		@AchievementDate DATE
	AS
	BEGIN

		IF @AchievementMaxPoints = 0
			RETURN;

		INSERT INTO GradeDetails (
			GradeID,
			AchievementTypeID,
			AchievementPoints,
			AchievementMaxPoints,
			AchievementDate
		)
		VALUES (
			@GradeID,
			@AchievementTypeID,
			@AchievementPoints,
			@AchievementMaxPoints,
			@AchievementDate
		);

		SELECT 
			SUM(
				CAST(AchievementPoints AS FLOAT) / AchievementMaxPoints * ParticipationRate
			) AS TotalGradePoints
		FROM GradeDetails
		JOIN AchievementType ON GradeDetails.AchievementTypeID = AchievementType.Id
		WHERE GradeDetails.GradeID = @GradeID;
	END
	GO

	SELECT 
    gd.Id,
    gd.GradeID,
    gd.AchievementTypeID,
    gd.AchievementPoints,
    gd.AchievementMaxPoints,
    gd.AchievementDate,
    at.ParticipationRate,
    CAST(gd.AchievementPoints AS FLOAT) / gd.AchievementMaxPoints * at.ParticipationRate AS CalculatedPoints
	FROM GradeDetails gd
	JOIN AchievementType at ON gd.AchievementTypeID = at.Id;

	SELECT * FROM GradeDetails;
	SELECT * FROM Grade;
	SELECT * FROM AchievementType;
