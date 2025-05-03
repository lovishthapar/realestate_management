-- Create Builder table
CREATE TABLE Builder (
    Builder_id INT PRIMARY KEY,
    Builder_name VARCHAR2(50),
    Builder_mobile VARCHAR2(15),
    Builder_email VARCHAR2(50),
    Builder_username VARCHAR2(20),
    Builder_password VARCHAR2(20),
    Builder_address VARCHAR2(100)
);

-- Create Property_type table
CREATE TABLE Property_type (
    Property_type_id INT PRIMARY KEY,
    Property_type_name VARCHAR2(50),
    Property_type_description VARCHAR2(100)
);

-- Create Seller table
CREATE TABLE Seller (
    Seller_id INT PRIMARY KEY,
    Seller_name VARCHAR2(50),
    Seller_mobile VARCHAR2(15),
    Seller_email VARCHAR2(50),
    Seller_username VARCHAR2(20),
    Seller_password VARCHAR2(20),
    Seller_address VARCHAR2(100)
);

-- Create Agent table
CREATE TABLE Agent (
    Agent_id INT PRIMARY KEY,
    Agent_name VARCHAR2(50),
    Agent_mobile VARCHAR2(15),
    Agent_email VARCHAR2(50),
    Agent_username VARCHAR2(20),
    Agent_password VARCHAR2(20),
    Agent_address VARCHAR2(100)
);

-- Create Buyer table
CREATE TABLE Buyer (
    Buyer_id INT PRIMARY KEY,
    Buyer_name VARCHAR2(50),
    Buyer_mobile VARCHAR2(15),
    Buyer_email VARCHAR2(50),
    Buyer_username VARCHAR2(20),
    Buyer_password VARCHAR2(20),
    Buyer_address VARCHAR2(100)
);

-- Create Property table
CREATE TABLE Property (
    Property_id INT PRIMARY KEY,
    Property_name VARCHAR2(50),
    Property_type_id INT,
    Property_description VARCHAR2(100),
    Property_builder_id INT,
    Property_seller_id INT,
    Property_buyer_id INT,
    FOREIGN KEY (Property_builder_id) REFERENCES Builder(Builder_id),
    FOREIGN KEY (Property_seller_id) REFERENCES Seller(Seller_id),
    FOREIGN KEY (Property_buyer_id) REFERENCES Buyer(Buyer_id),
    FOREIGN KEY (Property_type_id) REFERENCES Property_type(Property_type_id)
);

-- Create Approval table
CREATE TABLE Approval (
    Approval_id INT PRIMARY KEY,
    Approval_name VARCHAR2(50),
    Approval_type VARCHAR2(50)
);

-- Create Property_approval table to resolve M:N relationship between Property and Approval
CREATE TABLE Property_approval (
    Property_id INT,
    Approval_id INT,
    PRIMARY KEY (Property_id, Approval_id),
    FOREIGN KEY (Property_id) REFERENCES Property(Property_id),
    FOREIGN KEY (Approval_id) REFERENCES Approval(Approval_id)
);

-- Create Registration table
CREATE TABLE Registration (
    Registration_id INT PRIMARY KEY,
    Registration_name VARCHAR2(50),
    Registration_type VARCHAR2(50),
    Registration_number VARCHAR2(20),
    Registration_date DATE,
    Registration_description VARCHAR2(100),
    Registration_buyer_id INT,
    Registration_seller_id INT,
    FOREIGN KEY (Registration_buyer_id) REFERENCES Buyer(Buyer_id),
    FOREIGN KEY (Registration_seller_id) REFERENCES Seller(Seller_id)
);