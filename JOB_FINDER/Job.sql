
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/23/2023 21:50:47
-- Generated from EDMX file: D:\GIT_Clone\JOB_FINDER\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [JobFinderDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__APPLICATI__PostI__239E4DCF]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[APPLICATIONS] DROP CONSTRAINT [FK__APPLICATI__PostI__239E4DCF];
GO
IF OBJECT_ID(N'[dbo].[FK__APPLICATI__UserI__22AA2996]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[APPLICATIONS] DROP CONSTRAINT [FK__APPLICATI__UserI__22AA2996];
GO
IF OBJECT_ID(N'[dbo].[FK__POST__CompanyID__1DE57479]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[POST] DROP CONSTRAINT [FK__POST__CompanyID__1DE57479];
GO
IF OBJECT_ID(N'[dbo].[FK__RECOMMEND__Compa__164452B1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RECOMMENDATION] DROP CONSTRAINT [FK__RECOMMEND__Compa__164452B1];
GO
IF OBJECT_ID(N'[dbo].[FK__RECOMMEND__UserI__173876EA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RECOMMENDATION] DROP CONSTRAINT [FK__RECOMMEND__UserI__173876EA];
GO
IF OBJECT_ID(N'[dbo].[FK__REVIEW__CompanyI__1B0907CE]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[REVIEW] DROP CONSTRAINT [FK__REVIEW__CompanyI__1B0907CE];
GO
IF OBJECT_ID(N'[dbo].[FK__REVIEW__UserID__1A14E395]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[REVIEW] DROP CONSTRAINT [FK__REVIEW__UserID__1A14E395];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[APPLICATIONS]', 'U') IS NOT NULL
    DROP TABLE [dbo].[APPLICATIONS];
GO
IF OBJECT_ID(N'[dbo].[COMPANY]', 'U') IS NOT NULL
    DROP TABLE [dbo].[COMPANY];
GO
IF OBJECT_ID(N'[dbo].[POST]', 'U') IS NOT NULL
    DROP TABLE [dbo].[POST];
GO
IF OBJECT_ID(N'[dbo].[RECOMMENDATION]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RECOMMENDATION];
GO
IF OBJECT_ID(N'[dbo].[REVIEW]', 'U') IS NOT NULL
    DROP TABLE [dbo].[REVIEW];
GO
IF OBJECT_ID(N'[dbo].[USERS]', 'U') IS NOT NULL
    DROP TABLE [dbo].[USERS];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'APPLICATIONS'
CREATE TABLE [dbo].[APPLICATIONS] (
    [ApplicationID] int IDENTITY(1,1) NOT NULL,
    [UserID] int  NOT NULL,
    [PostID] int  NOT NULL,
    [ApplicationDate] datetime  NOT NULL
);
GO

-- Creating table 'COMPANies'
CREATE TABLE [dbo].[COMPANies] (
    [CompanyID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(20)  NOT NULL,
    [Description] varchar(50)  NOT NULL,
    [Address] varchar(40)  NOT NULL,
    [Phone] varchar(15)  NOT NULL,
    [Email] varchar(30)  NOT NULL,
    [Password] varchar(100)  NOT NULL
);
GO

-- Creating table 'POSTs'
CREATE TABLE [dbo].[POSTs] (
    [PostID] int IDENTITY(1,1) NOT NULL,
    [CompanyID] int  NOT NULL,
    [Salary] int  NOT NULL,
    [Location] varchar(50)  NOT NULL,
    [Experience] int  NOT NULL,
    [Description] varchar(255)  NOT NULL
);
GO

-- Creating table 'RECOMMENDATIONs'
CREATE TABLE [dbo].[RECOMMENDATIONs] (
    [RecommendationID] int IDENTITY(1,1) NOT NULL,
    [CompanyID] int  NOT NULL,
    [UserID] int  NOT NULL,
    [Description] varchar(50)  NOT NULL,
    [RecommendationDate] datetime  NOT NULL
);
GO

-- Creating table 'REVIEWs'
CREATE TABLE [dbo].[REVIEWs] (
    [ReviewID] int IDENTITY(1,1) NOT NULL,
    [UserID] int  NOT NULL,
    [CompanyID] int  NOT NULL,
    [ReviewDate] datetime  NOT NULL,
    [Description] varchar(200)  NOT NULL
);
GO

-- Creating table 'USERS'
CREATE TABLE [dbo].[USERS] (
    [UserID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [Email] varchar(50)  NOT NULL,
    [Phone] varchar(50)  NULL,
    [Address] varchar(100)  NULL,
    [Password] varchar(100)  NOT NULL,
    [University] varchar(50)  NULL,
    [Description] varchar(200)  NULL,
    [Skill] varchar(50)  NULL,
    [CV] varchar(100)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ApplicationID] in table 'APPLICATIONS'
ALTER TABLE [dbo].[APPLICATIONS]
ADD CONSTRAINT [PK_APPLICATIONS]
    PRIMARY KEY CLUSTERED ([ApplicationID] ASC);
GO

-- Creating primary key on [CompanyID] in table 'COMPANies'
ALTER TABLE [dbo].[COMPANies]
ADD CONSTRAINT [PK_COMPANies]
    PRIMARY KEY CLUSTERED ([CompanyID] ASC);
GO

-- Creating primary key on [PostID] in table 'POSTs'
ALTER TABLE [dbo].[POSTs]
ADD CONSTRAINT [PK_POSTs]
    PRIMARY KEY CLUSTERED ([PostID] ASC);
GO

-- Creating primary key on [RecommendationID] in table 'RECOMMENDATIONs'
ALTER TABLE [dbo].[RECOMMENDATIONs]
ADD CONSTRAINT [PK_RECOMMENDATIONs]
    PRIMARY KEY CLUSTERED ([RecommendationID] ASC);
GO

-- Creating primary key on [ReviewID] in table 'REVIEWs'
ALTER TABLE [dbo].[REVIEWs]
ADD CONSTRAINT [PK_REVIEWs]
    PRIMARY KEY CLUSTERED ([ReviewID] ASC);
GO

-- Creating primary key on [UserID] in table 'USERS'
ALTER TABLE [dbo].[USERS]
ADD CONSTRAINT [PK_USERS]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [PostID] in table 'APPLICATIONS'
ALTER TABLE [dbo].[APPLICATIONS]
ADD CONSTRAINT [FK__APPLICATI__PostI__239E4DCF]
    FOREIGN KEY ([PostID])
    REFERENCES [dbo].[POSTs]
        ([PostID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__APPLICATI__PostI__239E4DCF'
CREATE INDEX [IX_FK__APPLICATI__PostI__239E4DCF]
ON [dbo].[APPLICATIONS]
    ([PostID]);
GO

-- Creating foreign key on [UserID] in table 'APPLICATIONS'
ALTER TABLE [dbo].[APPLICATIONS]
ADD CONSTRAINT [FK__APPLICATI__UserI__22AA2996]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[USERS]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__APPLICATI__UserI__22AA2996'
CREATE INDEX [IX_FK__APPLICATI__UserI__22AA2996]
ON [dbo].[APPLICATIONS]
    ([UserID]);
GO

-- Creating foreign key on [CompanyID] in table 'POSTs'
ALTER TABLE [dbo].[POSTs]
ADD CONSTRAINT [FK__POST__CompanyID__1DE57479]
    FOREIGN KEY ([CompanyID])
    REFERENCES [dbo].[COMPANies]
        ([CompanyID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__POST__CompanyID__1DE57479'
CREATE INDEX [IX_FK__POST__CompanyID__1DE57479]
ON [dbo].[POSTs]
    ([CompanyID]);
GO

-- Creating foreign key on [CompanyID] in table 'RECOMMENDATIONs'
ALTER TABLE [dbo].[RECOMMENDATIONs]
ADD CONSTRAINT [FK__RECOMMEND__Compa__164452B1]
    FOREIGN KEY ([CompanyID])
    REFERENCES [dbo].[COMPANies]
        ([CompanyID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__RECOMMEND__Compa__164452B1'
CREATE INDEX [IX_FK__RECOMMEND__Compa__164452B1]
ON [dbo].[RECOMMENDATIONs]
    ([CompanyID]);
GO

-- Creating foreign key on [CompanyID] in table 'REVIEWs'
ALTER TABLE [dbo].[REVIEWs]
ADD CONSTRAINT [FK__REVIEW__CompanyI__1B0907CE]
    FOREIGN KEY ([CompanyID])
    REFERENCES [dbo].[COMPANies]
        ([CompanyID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__REVIEW__CompanyI__1B0907CE'
CREATE INDEX [IX_FK__REVIEW__CompanyI__1B0907CE]
ON [dbo].[REVIEWs]
    ([CompanyID]);
GO

-- Creating foreign key on [UserID] in table 'RECOMMENDATIONs'
ALTER TABLE [dbo].[RECOMMENDATIONs]
ADD CONSTRAINT [FK__RECOMMEND__UserI__173876EA]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[USERS]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__RECOMMEND__UserI__173876EA'
CREATE INDEX [IX_FK__RECOMMEND__UserI__173876EA]
ON [dbo].[RECOMMENDATIONs]
    ([UserID]);
GO

-- Creating foreign key on [UserID] in table 'REVIEWs'
ALTER TABLE [dbo].[REVIEWs]
ADD CONSTRAINT [FK__REVIEW__UserID__1A14E395]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[USERS]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__REVIEW__UserID__1A14E395'
CREATE INDEX [IX_FK__REVIEW__UserID__1A14E395]
ON [dbo].[REVIEWs]
    ([UserID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
-- Thêm dữ liệu vào bảng COMPANies
INSERT INTO [dbo].[COMPANies] ([Name], [Description], [Address], [Phone], [Email], [Password])
VALUES
    ('Company1', 'Description1', 'Address1', '123456789', 'company1@email.com', 'password1'),
    ('Company2', 'Description2', 'Address2', '987654321', 'company2@email.com', 'password2'),
    ('Company3', 'Description3', 'Address3', '555555555', 'company3@email.com', 'password3'),
    ('Company4', 'Description4', 'Address4', '888888888', 'company4@email.com', 'password4'),
    ('Company5', 'Description5', 'Address5', '999999999', 'company5@email.com', 'password5');

	-- Thêm dữ liệu vào bảng USERS
INSERT INTO [dbo].[USERS] ([Name], [Email], [Phone], [Address], [Password], [University], [Description], [Skill], [CV])
VALUES
    ('User1', 'user1@email.com', '1111111111', 'UserAddress1', 'userpassword1', 'University1', 'Description1', 'Skill1', 'CV1.pdf'),
    ('User2', 'user2@email.com', '2222222222', 'UserAddress2', 'userpassword2', 'University2', 'Description2', 'Skill2', 'CV2.pdf'),
    ('User3', 'user3@email.com', '3333333333', 'UserAddress3', 'userpassword3', 'University3', 'Description3', 'Skill3', 'CV3.pdf'),
    ('User4', 'user4@email.com', '4444444444', 'UserAddress4', 'userpassword4', 'University4', 'Description4', 'Skill4', 'CV4.pdf'),
    ('User5', 'user5@email.com', '5555555555', 'UserAddress5', 'userpassword5', 'University5', 'Description5', 'Skill5', 'CV5.pdf');

SELECT * FROM USERS
SELECT * FROM REVIEWs
	-- Thêm dữ liệu vào bảng POSTs
INSERT INTO [dbo].[POSTs] ([CompanyID], [Salary], [Location], [Experience], [Description])
VALUES
    (1, 50000, 'Location1', 2, 'Description1'),
    (2, 60000, 'Location2', 3, 'Description2'),
    (3, 70000, 'Location3', 4, 'Description3'),
    (4, 80000, 'Location4', 5, 'Description4'),
    (5, 90000, 'Location5', 6, 'Description5');

-- Thêm dữ liệu vào bảng RECOMMENDATIONs
INSERT INTO [dbo].[RECOMMENDATIONs] ([CompanyID], [UserID], [Description], [RecommendationDate])
VALUES
    (1, 1, 'Recommendation 1', '2023-09-23 10:00:00'),
    (2, 2, 'Recommendation 2', '2023-09-23 11:00:00'),
    (3, 3, 'Recommendation 3', '2023-09-23 12:00:00'),
    (4, 4, 'Recommendation 4', '2023-09-23 13:00:00'),
    (5, 5, 'Recommendation 5', '2023-09-23 14:00:00');

	-- Thêm dữ liệu vào bảng REVIEWs
INSERT INTO [dbo].[REVIEWs] ([UserID], [CompanyID], [ReviewDate], [Description])
VALUES
    (1, 1, '2023-09-23 10:00:00', 'Review 1'),
    (2, 2, '2023-09-23 11:00:00', 'Review 2'),
    (3, 3, '2023-09-23 12:00:00', 'Review 3'),
    (4, 4, '2023-09-23 13:00:00', 'Review 4'),
    (5, 5, '2023-09-23 14:00:00', 'Review 5');

	-- Thêm dữ liệu vào bảng APPLICATIONS
INSERT INTO [dbo].[APPLICATIONS] ([UserID], [PostID], [ApplicationDate])
VALUES
    (1, 1, '2023-09-23 10:00:00'),
    (2, 2, '2023-09-23 11:00:00'),
    (3, 3, '2023-09-23 12:00:00'),
    (4, 4, '2023-09-23 13:00:00'),
    (5, 5, '2023-09-23 14:00:00');