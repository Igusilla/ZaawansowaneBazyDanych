CREATE TABLE [SalesLT].[ProductComments] (
    [CommentID]       INT            IDENTITY (1, 1) NOT NULL,
    [ProductID]       INT            NOT NULL,
    [ParentCommentID] INT            NULL,
    [Author]          NVARCHAR (100) NULL,
    [CommentText]     NVARCHAR (MAX) NULL,
    [CreatedAt]       DATETIME2 (7)  DEFAULT (sysdatetime()) NULL,
    PRIMARY KEY CLUSTERED ([CommentID] ASC),
    CONSTRAINT [FK_Comments_Product] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID]),
    CONSTRAINT [FK_Comments_Self] FOREIGN KEY ([ParentCommentID]) REFERENCES [SalesLT].[ProductComments] ([CommentID])
);

