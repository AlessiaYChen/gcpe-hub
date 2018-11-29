﻿CREATE TABLE [dbo].[Tag] (
    [Id]        UNIQUEIDENTIFIER CONSTRAINT [DF_Tag_Id] DEFAULT (newid()) NOT NULL,	
	[Key] VARCHAR (255)	 NOT NULL ,
    [DisplayName] VARCHAR(255) NULL,     
    [SortOrder] INT CONSTRAINT [DF_Tag_SortOrder] DEFAULT (0) NOT NULL, 
    [IsActive] BIT  NOT NULL, 
    CONSTRAINT [PK_Tag] PRIMARY KEY NONCLUSTERED ([Id] ASC)
);