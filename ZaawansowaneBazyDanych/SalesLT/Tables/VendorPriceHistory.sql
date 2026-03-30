CREATE TABLE [SalesLT].[VendorPriceHistory] (
    [QuoteID]   BIGINT   NULL,
    [VendorID]  INT      NOT NULL,
    [ProductID] INT      NOT NULL,
    [Price]     MONEY    NOT NULL,
    [QuoteDate] DATETIME NOT NULL
);


GO
CREATE CLUSTERED INDEX [CIX_VendorPriceHistory_ProductDate]
    ON [SalesLT].[VendorPriceHistory]([ProductID] ASC, [QuoteDate] ASC) WITH (FILLFACTOR = 25);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UIX_VendorPriceHistory_QuoteID]
    ON [SalesLT].[VendorPriceHistory]([QuoteID] ASC) WHERE ([QuoteID] IS NOT NULL);


GO
CREATE NONCLUSTERED INDEX [IX_VendorPriceHistory_VendorID]
    ON [SalesLT].[VendorPriceHistory]([VendorID] ASC)
    INCLUDE([ProductID], [Price], [QuoteDate]);

