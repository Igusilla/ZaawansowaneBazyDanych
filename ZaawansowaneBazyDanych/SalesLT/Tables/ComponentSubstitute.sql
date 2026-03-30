CREATE TABLE [SalesLT].[ComponentSubstitute] (
    [OGComponentID]         INT NOT NULL,
    [SubstituteComponentID] INT NOT NULL,
    [VendorID]              INT NOT NULL,
    [SubstitutePriority]    INT NOT NULL,
    [IsApproved]            BIT DEFAULT ((0)) NULL,
    CONSTRAINT [PK_ComponentSubstitute] PRIMARY KEY CLUSTERED ([OGComponentID] ASC, [SubstituteComponentID] ASC),
    CONSTRAINT [FK_CompSub_Original] FOREIGN KEY ([OGComponentID]) REFERENCES [SalesLT].[Product] ([ProductID]),
    CONSTRAINT [FK_CompSub_Substitute] FOREIGN KEY ([SubstituteComponentID]) REFERENCES [SalesLT].[Product] ([ProductID]),
    CONSTRAINT [FK_CompSub_Vendor] FOREIGN KEY ([VendorID]) REFERENCES [SalesLT].[Vendor] ([VendorID])
);


GO
CREATE NONCLUSTERED INDEX [IX_ComponentSubstitute_Approved]
    ON [SalesLT].[ComponentSubstitute]([OGComponentID] ASC) WHERE ([IsApproved]=(1));


GO
CREATE NONCLUSTERED INDEX [IX_ComponentSubstitute_VendorSubComp]
    ON [SalesLT].[ComponentSubstitute]([VendorID] ASC)
    INCLUDE([SubstituteComponentID], [SubstitutePriority]);


GO
CREATE NONCLUSTERED INDEX [IX_ComponentSubstitute_SubstituteID]
    ON [SalesLT].[ComponentSubstitute]([SubstituteComponentID] ASC);

