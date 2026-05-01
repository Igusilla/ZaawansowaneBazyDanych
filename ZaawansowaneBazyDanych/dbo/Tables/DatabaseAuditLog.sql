CREATE TABLE [dbo].[DatabaseAuditLog] (
    [AuditID]     INT            IDENTITY (1, 1) NOT NULL,
    [EventTime]   DATETIME2 (7)  DEFAULT (sysdatetime()) NULL,
    [PostUser]    [sysname]      DEFAULT (suser_sname()) NOT NULL,
    [EventType]   NVARCHAR (100) NULL,
    [ObjectName]  NVARCHAR (255) NULL,
    [CommandText] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([AuditID] ASC)
);

