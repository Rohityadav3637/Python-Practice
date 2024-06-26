-- Create the database
CREATE DATABASE IndianCuisine;
USE IndianCuisine;

-- Create tables
CREATE TABLE Dishes (
    DishID INT PRIMARY KEY,
    DishName NVARCHAR(100),
    Region NVARCHAR(50),
    Spiciness INT -- Scale of 1-5
);

CREATE TABLE Ingredients (
    IngredientID INT PRIMARY KEY,
    IngredientName NVARCHAR(100)
);

CREATE TABLE DishIngredients (
    DishID INT,
    IngredientID INT,
    Quantity NVARCHAR(50),
    PRIMARY KEY (DishID, IngredientID),
    FOREIGN KEY (DishID) REFERENCES Dishes(DishID),
    FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID)
);

-- Insert sample data

INSERT INTO Dishes VALUES(1, 'Butter Chicken', 'North India', 3);
INSERT INTO Dishes VALUES(2, 'Dosa', 'South India', 2);
INSERT INTO Dishes VALUES(3, 'Vindaloo', 'Goa', 5);
INSERT INTO Dishes VALUES(4, 'Biryani', 'Hyderabad', 4);

INSERT INTO Ingredients VALUES 
(1, 'Chicken'),
(2, 'Butter'),
(3, 'Rice'),
(4, 'Lentils'),
(5, 'Chili Peppers');

INSERT INTO DishIngredients VALUES 
(1, 1, '500g'),
(1, 2, '100g'),
(2, 4, '200g'),
(3, 1, '400g'),
(3, 5, '50g'),
(4, 3, '300g');


--Stored Procedure:
--Let's create a procedure to get dishes from a specific region:

CREATE FUNCTION GetSpicinessLevel
    (@Spiciness INT)
RETURNS NVARCHAR(20)
AS
BEGIN
    DECLARE @Level NVARCHAR(20)
    SET @Level = CASE
        WHEN @Spiciness = 1 THEN 'Mild'
        WHEN @Spiciness = 2 THEN 'Medium'
        WHEN @Spiciness = 3 THEN 'Spicy'
        WHEN @Spiciness = 4 THEN 'Very Spicy'
        WHEN @Spiciness = 5 THEN 'Extra Spicy'
        ELSE 'Unknown'
    END
    RETURN @Level
END

-- Use the function
SELECT DishName, dbo.GetSpicinessLevel(Spiciness) AS SpicinessLevel
FROM Dishes

--Functions:
--Let's create two functions - a scalar function to get the spiciness level in words, and a table-valued function to get ingredients for a dish:

CREATE FUNCTION GetSpicinessLevel
    (@Spiciness INT)
RETURNS NVARCHAR(20)
AS
BEGIN
    DECLARE @Level NVARCHAR(20)
    SET @Level = CASE
        WHEN @Spiciness = 1 THEN 'Mild'
        WHEN @Spiciness = 2 THEN 'Medium'
        WHEN @Spiciness = 3 THEN 'Spicy'
        WHEN @Spiciness = 4 THEN 'Very Spicy'
        WHEN @Spiciness = 5 THEN 'Extra Spicy'
        ELSE 'Unknown'
    END
    RETURN @Level
END

-- Use the function
SELECT DishName, dbo.GetSpicinessLevel(Spiciness) AS SpicinessLevel
FROM Dishes

--Cursor:
--Let's use a cursor to iterate through all dishes and print their names along with ingredients
DECLARE @DishID INT, @DishName NVARCHAR(100)
DECLARE @IngredientList NVARCHAR(MAX)

DECLARE dish_cursor CURSOR FOR
SELECT DishID, DishName FROM Dishes

OPEN dish_cursor

FETCH NEXT FROM dish_cursor INTO @DishID, @DishName

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @IngredientList = ''

    SELECT @IngredientList = @IngredientList + IngredientName + ' (' + Quantity + '), '
    FROM dbo.GetDishIngredients(@DishID)

    SET @IngredientList = LEFT(@IngredientList, LEN(@IngredientList) - 1)

    PRINT 'Dish: ' + @DishName + ' - Ingredients: ' + @IngredientList

    FETCH NEXT FROM dish_cursor INTO @DishID, @DishName
END

CLOSE dish_cursor
DEALLOCATE dish_cursor