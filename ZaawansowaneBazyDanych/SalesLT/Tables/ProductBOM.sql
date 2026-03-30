CREATE TABLE [SalesLT].[ProductBOM] (
    [BOMID]              INT             NULL,
    [ParentProductID]    INT             NOT NULL,
    [ComponentProductID] INT             NOT NULL,
    [Quantity]           DECIMAL (18, 2) DEFAULT ((1.0)) NULL,
    [InstructionStep]    INT             NULL,
    CONSTRAINT [FK_BOM_Component] FOREIGN KEY ([ComponentProductID]) REFERENCES [SalesLT].[Product] ([ProductID]),
    CONSTRAINT [FK_BOM_Parent] FOREIGN KEY ([ParentProductID]) REFERENCES [SalesLT].[Product] ([ProductID])
);


GO
CREATE CLUSTERED INDEX [CIX_ProductBOM_ParentProduct]
    ON [SalesLT].[ProductBOM]([ParentProductID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UIX_ProductBOM_BOMID]
    ON [SalesLT].[ProductBOM]([BOMID] ASC) WHERE ([BOMID] IS NOT NULL);


GO
CREATE NONCLUSTERED INDEX [IX_ProductBOM_ComponentProductID]
    ON [SalesLT].[ProductBOM]([ComponentProductID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ProductBOM_DefQuantity]
    ON [SalesLT].[ProductBOM]([ComponentProductID] ASC, [ParentProductID] ASC) WHERE ([Quantity]=(1));

