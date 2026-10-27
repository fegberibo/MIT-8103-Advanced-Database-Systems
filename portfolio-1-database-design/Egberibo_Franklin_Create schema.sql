-- Table to store customer profiles
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Shipping_Address TEXT
);

-- Table to store product inventory details
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(150) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock_Quantity INT NOT NULL
);

-- Table to record customer orders
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Order_Date DATE NOT NULL,
    Quantity_Ordered INT NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);