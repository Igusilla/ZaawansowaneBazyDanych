CREATE TABLE [SalesLT].[ProductAttribute] (
    [ProductID] INT                                  NOT NULL,
    [Attribute] XML(CONTENT [dbo].[AttributeSchema]) NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_SPA] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID])
);

