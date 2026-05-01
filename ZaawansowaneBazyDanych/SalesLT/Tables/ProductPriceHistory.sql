CREATE TABLE [SalesLT].[ProductPriceHistory] (
    [ChangeID]  INT             IDENTITY (1, 1) NOT NULL,
    [ProductID] INT             NULL,
    [OldPrice]  DECIMAL (12, 2) NULL,
    [NewPrice]  DECIMAL (12, 2) NULL,
    [ChangedBy] [sysname]       DEFAULT (suser_sname()) NOT NULL,
    [ChangedAt] DATETIME2 (7)   DEFAULT (sysdatetime()) NULL,
    PRIMARY KEY CLUSTERED ([ChangeID] ASC)
);

