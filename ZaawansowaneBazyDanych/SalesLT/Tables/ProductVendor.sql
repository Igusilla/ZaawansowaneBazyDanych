CREATE TABLE [SalesLT].[ProductVendor] (
    [ProductID]       INT   NOT NULL,
    [VendorID]        INT   NOT NULL,
    [StandardPrice]   MONEY NOT NULL,
    [AverageLeadTime] INT   NOT NULL
);


GO
CREATE UNIQUE CLUSTERED INDEX [CIX_ProductVendor_ProdVend]
    ON [SalesLT].[ProductVendor]([ProductID] ASC, [VendorID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ProductVendor_VendorID]
    ON [SalesLT].[ProductVendor]([VendorID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ProductVendor_StandPrice]
    ON [SalesLT].[ProductVendor]([ProductID] ASC)
    INCLUDE([StandardPrice]);

