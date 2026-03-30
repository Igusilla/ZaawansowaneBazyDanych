CREATE TABLE [SalesLT].[Vendor] (
    [VendorID]      INT            IDENTITY (1, 1) NOT NULL,
    [Name]          NVARCHAR (100) NOT NULL,
    [AccountNumber] NVARCHAR (20)  NOT NULL,
    [CreditRating]  TINYINT        NOT NULL,
    [ActiveFlag]    BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([VendorID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UIX_Vendor_AccountNumber]
    ON [SalesLT].[Vendor]([AccountNumber] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Vendor_Name]
    ON [SalesLT].[Vendor]([Name] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Vendor_Active_Name_Account]
    ON [SalesLT].[Vendor]([Name] ASC)
    INCLUDE([AccountNumber]) WHERE ([ActiveFlag]=(1));


GO
CREATE NONCLUSTERED INDEX [IX_Vendor_TopCredit]
    ON [SalesLT].[Vendor]([Name] ASC) WHERE ([CreditRating]=(5));

