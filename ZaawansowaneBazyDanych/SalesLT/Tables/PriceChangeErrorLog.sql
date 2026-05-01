CREATE TABLE [SalesLT].[PriceChangeErrorLog] (
    [AuditID]          INT             IDENTITY (1, 1) NOT NULL,
    [ProductID]        INT             NULL,
    [Price]            DECIMAL (12, 2) NULL,
    [AttemptedPrice]   DECIMAL (12, 2) NULL,
    [AttemptedBy]      [sysname]       DEFAULT (suser_sname()) NOT NULL,
    [AttemptedAt]      DATETIME2 (7)   DEFAULT (sysdatetime()) NULL,
    [ErrorDescription] NVARCHAR (100)  NULL,
    PRIMARY KEY CLUSTERED ([AuditID] ASC)
);

