
CREATE   TRIGGER trg_Audit_TableChanges
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @data XML
    SET @data = EVENTDATA()

    INSERT INTO dbo.DatabaseAuditLog (EventType, ObjectName, CommandText)
    VALUES (
        @data.value('(/EVENT_INSTANCE/EventType)[1]', 'NVARCHAR(100)'),
        @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'NVARCHAR(255)'),
        @data.value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'NVARCHAR(MAX)')
    )
END