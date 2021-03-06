USE [Gcpe.Hub]
GO
/****** Object:  Schema [calendar]    Script Date: 2018-12-14 11:13:23 AM ******/
CREATE SCHEMA [calendar] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [dashboard]    Script Date: 2018-12-14 11:13:23 AM ******/
CREATE SCHEMA [dashboard] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [media]    Script Date: 2018-12-14 11:13:23 AM ******/
CREATE SCHEMA [media] AUTHORIZATION [dbo]
GO
/****** Object:  UserDefinedFunction [calendar].[GetActivityCategories]    Script Date: 2018-12-14 11:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Nick Pouliot
-- Create date: 09/10/2011
-- Description:	Function to return ActivityCategories comma delimited string
-- =============================================
CREATE FUNCTION [calendar].[GetActivityCategories]
(@activityId int)
RETURNS @activityCategoryTable TABLE (activityId int, categories VARCHAR(4096))
AS
BEGIN
	DECLARE @commaDelimitedString varchar(4096)

	SELECT @commaDelimitedString = COALESCE(@commaDelimitedString+',' ,'') + CAST([CategoryId] AS VARCHAR(100))
	FROM ActivityCategories
	WHERE ActivityId = @activityId
	
	INSERT INTO @activityCategoryTable
	VALUES (@activityId,@commaDelimitedString)

	RETURN

END
GO
ALTER AUTHORIZATION ON [calendar].[GetActivityCategories] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [calendar].[GetActivityCommunicationMaterials]    Script Date: 2018-12-14 11:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Nick Pouliot
-- Create date: 09/10/2011
-- Description:	Function to return ActivityCommunicationMaterial comma delimited string
-- =============================================
CREATE FUNCTION [calendar].[GetActivityCommunicationMaterials]
(@activityId int)
RETURNS @activityCommunicationMaterialTable TABLE (activityId int, activityCommunicationMaterials VARCHAR(4096))
AS
BEGIN
	DECLARE @commaDelimitedString varchar(4096)

	SELECT @commaDelimitedString = COALESCE(@commaDelimitedString+',' ,'') + CAST([CommunicationMaterialId] AS VARCHAR(100))
	FROM ActivityCommunicationMaterials
	WHERE ActivityId = @activityId
	
	INSERT INTO @activityCommunicationMaterialTable
	VALUES (@activityId,@commaDelimitedString)

	RETURN

END
GO
ALTER AUTHORIZATION ON [calendar].[GetActivityCommunicationMaterials] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [calendar].[GetActivityKeywords]    Script Date: 2018-12-14 11:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [calendar].[GetActivityKeywords]
(@activityId int)
RETURNS @activityKeywordsTable TABLE (keywordId int, keywordName VARCHAR(50))
AS
BEGIN
	INSERT INTO @activityKeywordsTable
	SELECT Id, Name
	FROM ActivityKeywords
	INNER JOIN Keyword on ActivityKeywords.KeywordId = Keyword.Id
	WHERE ActivityId = @activityId

	RETURN

END
GO
ALTER AUTHORIZATION ON [calendar].[GetActivityKeywords] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [calendar].[GetActivityNewsReleaseOrigins]    Script Date: 2018-12-14 11:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Nick Pouliot
-- Create date: 09/10/2011
-- Description:	Function to return ActivityNewsReleaseOrigin comma delimited string
-- =============================================
CREATE FUNCTION [calendar].[GetActivityNewsReleaseOrigins]
(@activityId int)
RETURNS @activityNewsReleaseOriginsTable TABLE (activityId int, activityNewsReleaseOrigins VARCHAR(4096))
AS
BEGIN
	DECLARE @commaDelimitedString varchar(4096)

	SELECT @commaDelimitedString = COALESCE(@commaDelimitedString+',' ,'') + CAST([NROriginId] AS VARCHAR(100))
	FROM ActivityNROrigins
	WHERE ActivityId = @activityId
	
	INSERT INTO @activityNewsReleaseOriginsTable
	VALUES (@activityId,@commaDelimitedString)

	RETURN

END
GO
ALTER AUTHORIZATION ON [calendar].[GetActivityNewsReleaseOrigins] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [calendar].[GetActivitySectors]    Script Date: 2018-12-14 11:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Nick Pouliot
-- Create date: 09/10/2011
-- Description:	Function to return ActivitySector comma delimited string
-- =============================================
CREATE FUNCTION [calendar].[GetActivitySectors]
(@activityId int)
RETURNS @activitySectorsTable TABLE (activityId int, activitySectors VARCHAR(4096))
AS
BEGIN
	DECLARE @commaDelimitedString varchar(4096)

	SELECT @commaDelimitedString = COALESCE(@commaDelimitedString+',' ,'') + CAST([SectorId] AS VARCHAR(100))
	FROM ActivitySectors
	WHERE ActivityId = @activityId
	
	INSERT INTO @activitySectorsTable
	VALUES (@activityId,@commaDelimitedString)

	RETURN

END
GO
ALTER AUTHORIZATION ON [calendar].[GetActivitySectors] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [calendar].[GetActivitySharedWithMinistries]    Script Date: 2018-12-14 11:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Nick Pouliot
-- Create date: 09/10/2011
-- Description:	Function to return ActivitySharedWith comma delimited string
-- =============================================
CREATE FUNCTION [calendar].[GetActivitySharedWithMinistries]
(@activityId int)
RETURNS @activitySharedWithTable TABLE (activityId int, sharedWithMinistries VARCHAR(4096))
AS
BEGIN
	DECLARE @commaDelimitedString varchar(4096)

	SELECT @commaDelimitedString = COALESCE(@commaDelimitedString+',' ,'') + CAST([MinistryId] AS VARCHAR(50))
	FROM ActivitySharedWith
	WHERE ActivityId = @activityId
	
	INSERT INTO @activitySharedWithTable
	VALUES (@activityId,@commaDelimitedString)

	RETURN

END
GO
ALTER AUTHORIZATION ON [calendar].[GetActivitySharedWithMinistries] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [calendar].[GetActivityThemes]    Script Date: 2018-12-14 11:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [calendar].[GetActivityThemes]
(@activityId int)
RETURNS @activityThemesTable TABLE (activityId int, activityThemes VARCHAR(4096))
AS
BEGIN
	DECLARE @commaDelimitedString varchar(4096)

	SELECT @commaDelimitedString = COALESCE(@commaDelimitedString+',' ,'') + CAST([ThemeId] AS VARCHAR(100))
	FROM ActivityThemes
	WHERE ActivityId = @activityId
	
	INSERT INTO @activityThemesTable
	VALUES (@activityId,@commaDelimitedString)

	RETURN

END
GO
ALTER AUTHORIZATION ON [calendar].[GetActivityThemes] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [calendar].[sGetActivityCategoriesByName]    Script Date: 2018-12-14 11:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Nick Pouliot
-- Create date: 09/10/2011
-- Description:	Function to return ActivitySharedWith comma delimited string
-- =============================================
CREATE FUNCTION [calendar].[sGetActivityCategoriesByName] (@ActID as int)

returns varchar(1000)
AS
BEGIN
DECLARE @catnames varchar(1000)

SELECT @catnames= COALESCE(@catnames+',' ,'') + ' ' + c.Name --CAST([CategoryId] AS VARCHAR(100))
	FROM ActivityCategories ac
	inner join Category c on ac.CategoryId = c.Id
	WHERE ActivityId = @ActID
return @catnames	
end
GO
ALTER AUTHORIZATION ON [calendar].[sGetActivityCategoriesByName] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [calendar].[sGetActivityCommunicationMaterialsByName]    Script Date: 2018-12-14 11:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ali
-- Create date: 09/10/2011
-- Description:	Function to return ActivitySharedWith comma delimited string
-- =============================================
CREATE FUNCTION [calendar].[sGetActivityCommunicationMaterialsByName] (@ActID as int)

returns varchar(1000)
AS
BEGIN
DECLARE @catnames varchar(1000)

SELECT @catnames= COALESCE(@catnames+',' ,'') + ' ' + cm.Name
	FROM ActivityCommunicationMaterials ac
	INNER JOIN [calendar].CommunicationMaterial AS cm ON ac.CommunicationMaterialId = cm.Id
	WHERE ac.ActivityId = @ActID
	AND cm.IsActive = 1
return @catnames	
end
GO
ALTER AUTHORIZATION ON [calendar].[sGetActivityCommunicationMaterialsByName] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [calendar].[sGetActivityFavoriteSystemUsers]    Script Date: 2018-12-14 11:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Nick Pouliot
-- Create date: 09/10/2011
-- Description:	Function to return ActivitySharedWith comma delimited string
-- =============================================
CREATE FUNCTION [calendar].[sGetActivityFavoriteSystemUsers] (@ActID as int)

returns varchar(1000)
AS
BEGIN
DECLARE @sharedids varchar(1000)

SELECT @sharedids = COALESCE(@sharedids +',' ,'') + CAST([SystemUserId] AS VARCHAR(10))
	FROM FavoriteActivity
	WHERE ActivityId = @ActID
	
return @sharedids
end
GO
ALTER AUTHORIZATION ON [calendar].[sGetActivityFavoriteSystemUsers] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [calendar].[sGetActivityInitiatives]    Script Date: 2018-12-14 11:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [calendar].[sGetActivityInitiatives] (@ActivityId as int)

returns varchar(1000)
AS
BEGIN
DECLARE @commaDelimitedString varchar(1000)

SELECT @commaDelimitedString= COALESCE(@commaDelimitedString+',' ,'') + CAST([InitiativeId] AS VARCHAR(10)) 
	FROM ActivityInitiatives
	WHERE ActivityInitiatives.ActivityId = @ActivityId
return @commaDelimitedString	
end
GO
ALTER AUTHORIZATION ON [calendar].[sGetActivityInitiatives] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [calendar].[sGetActivityNROrigins]    Script Date: 2018-12-14 11:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [calendar].[sGetActivityNROrigins] (@ActivityId as int)

returns varchar(1000)
AS
BEGIN
DECLARE @names varchar(1000)

SELECT @names= COALESCE(@names+',' ,'') + ' ' + NROrigin.Name 
	FROM ActivityNROrigins 
	inner join NROrigin  on ActivityNROrigins.NROriginId = NROrigin.Id
	WHERE ActivityNROrigins.ActivityId = @ActivityId
return @names	
end
GO
ALTER AUTHORIZATION ON [calendar].[sGetActivityNROrigins] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [calendar].[sGetActivitySectorsByName]    Script Date: 2018-12-14 11:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Nick Pouliot
-- Create date: 09/10/2011
-- Description:	Function to return ActivitySharedWith comma delimited string
-- =============================================
CREATE FUNCTION [calendar].[sGetActivitySectorsByName] (@ActID as int)

returns varchar(1000)
AS
BEGIN
DECLARE @sectornames varchar(1000)

SELECT @sectornames = COALESCE(@sectornames +',' ,'') + ' ' + s.DisplayName 
	FROM ActivitySectors acs
	inner join [Sector] s on acs.SectorId = s.Id
	WHERE ActivityId = @ActID
return @sectornames	
end
GO
ALTER AUTHORIZATION ON [calendar].[sGetActivitySectorsByName] TO  SCHEMA OWNER 
GO
/****** Object:  UserDefinedFunction [calendar].[sGetActivitySharedWithMinistries]    Script Date: 2018-12-14 11:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Nick Pouliot
-- Create date: 09/10/2011
-- Description:	Function to return ActivitySharedWith comma delimited string
-- =============================================
CREATE FUNCTION [calendar].[sGetActivitySharedWithMinistries] (@ActID as int)

returns varchar(1500)
AS
BEGIN
DECLARE @sharedids varchar(1500)

SELECT @sharedids = COALESCE(@sharedids +',' ,'') + CAST([MinistryId] AS VARCHAR(50))
	FROM ActivitySharedWith
	WHERE ActivityId = @ActID
	
return @sharedids
end
GO
ALTER AUTHORIZATION ON [calendar].[sGetActivitySharedWithMinistries] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[Activity]    Script Date: 2018-12-14 11:13:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[Activity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[PotentialDates] [nvarchar](70) NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Details] [nvarchar](500) NOT NULL,
	[Schedule] [nvarchar](500) NOT NULL,
	[Significance] [nvarchar](500) NOT NULL,
	[Strategy] [nvarchar](500) NULL,
	[Comments] [nvarchar](4000) NULL,
	[HqComments] [nvarchar](2000) NULL,
	[LeadOrganization] [nvarchar](100) NULL,
	[Venue] [nvarchar](150) NULL,
	[StatusId] [int] NULL,
	[HqStatusId] [int] NULL,
	[HqSection] [int] NOT NULL,
	[NRDistributionId] [int] NULL,
	[PremierRequestedId] [int] NULL,
	[ContactMinistryId] [uniqueidentifier] NULL,
	[GovernmentRepresentativeId] [int] NULL,
	[CommunicationContactId] [int] NULL,
	[EventPlannerId] [int] NULL,
	[VideographerId] [int] NULL,
	[CityId] [int] NULL,
	[OtherCity] [nvarchar](150) NULL,
	[IsActive] [bit] NOT NULL,
	[IsConfirmed] [bit] NOT NULL,
	[IsIssue] [bit] NOT NULL,
	[IsAllDay] [bit] NOT NULL,
	[IsAtLegislature] [bit] NOT NULL,
	[IsConfidential] [bit] NOT NULL,
	[IsCrossGovernment] [bit] NOT NULL,
	[IsMilestone] [bit] NOT NULL,
	[IsTitleNeedsReview] [bit] NOT NULL,
	[IsDetailsNeedsReview] [bit] NOT NULL,
	[IsRepresentativeNeedsReview] [bit] NOT NULL,
	[IsCityNeedsReview] [bit] NOT NULL,
	[IsStartDateNeedsReview] [bit] NOT NULL,
	[IsEndDateNeedsReview] [bit] NOT NULL,
	[IsCategoriesNeedsReview] [bit] NOT NULL,
	[IsCommMaterialsNeedsReview] [bit] NOT NULL,
	[IsActiveNeedsReview] [bit] NOT NULL,
	[NRDateTime] [datetime] NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [int] NULL,
	[TimeStamp] [timestamp] NULL,
	[RowGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[Activity] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[ActivityCategories]    Script Date: 2018-12-14 11:13:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[ActivityCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastUpdatedDateTime] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ActivityCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[ActivityCategories] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[ActivityCommunicationMaterials]    Script Date: 2018-12-14 11:13:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[ActivityCommunicationMaterials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NOT NULL,
	[CommunicationMaterialId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastUpdatedDateTime] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ActivityCommunicationMaterials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[ActivityCommunicationMaterials] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[ActivityFiles]    Script Date: 2018-12-14 11:13:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[ActivityFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NOT NULL,
	[Data] [varbinary](max) NOT NULL,
	[FileName] [varchar](max) NOT NULL,
	[FileType] [varchar](max) NOT NULL,
	[FileLength] [int] NOT NULL,
	[Md5] [varchar](32) NOT NULL,
	[LastUpdatedDateTime] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NULL,
 CONSTRAINT [PK_ActivityFiless] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[ActivityFiles] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[ActivityFilter]    Script Date: 2018-12-14 11:13:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[ActivityFilter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QueryString] [nvarchar](300) NULL,
	[Name] [nvarchar](200) NULL,
	[SortOrder] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [int] NULL,
	[TimeStamp] [timestamp] NULL,
	[RowGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ActivityFilter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[ActivityFilter] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[ActivityInitiatives]    Script Date: 2018-12-14 11:13:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[ActivityInitiatives](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NOT NULL,
	[InitiativeId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastUpdatedDateTime] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ActivityInitiatives] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[ActivityInitiatives] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[ActivityKeywords]    Script Date: 2018-12-14 11:13:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[ActivityKeywords](
	[ActivityId] [int] NOT NULL,
	[KeywordId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LastUpdatedDateTime] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_ActivityKeyword] PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC,
	[KeywordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[ActivityKeywords] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[ActivityNROrigins]    Script Date: 2018-12-14 11:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[ActivityNROrigins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NOT NULL,
	[NROriginId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastUpdatedDateTime] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ActivityNROrigins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[ActivityNROrigins] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[ActivitySectors]    Script Date: 2018-12-14 11:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[ActivitySectors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NOT NULL,
	[SectorId] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastUpdatedDateTime] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ActivitySectors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[ActivitySectors] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[ActivityServices]    Script Date: 2018-12-14 11:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[ActivityServices](
	[ActivityId] [int] NOT NULL,
	[ServiceId] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastUpdatedDateTime] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_ActivityService] PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC,
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[ActivityServices] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[ActivitySharedWith]    Script Date: 2018-12-14 11:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[ActivitySharedWith](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NOT NULL,
	[MinistryId] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [int] NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ActivitySharedWith] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[ActivitySharedWith] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[ActivityThemes]    Script Date: 2018-12-14 11:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[ActivityThemes](
	[ActivityId] [int] NOT NULL,
	[ThemeId] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastUpdatedDateTime] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_ActivityTheme] PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC,
	[ThemeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[ActivityThemes] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[Category]    Script Date: 2018-12-14 11:13:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[SortOrder] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[Category] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[City]    Script Date: 2018-12-14 11:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NULL,
	[IsActive] [bit] NULL,
	[TimeStamp] [timestamp] NULL,
	[RowGuid] [uniqueidentifier] NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[City] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[CommunicationContact]    Script Date: 2018-12-14 11:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[CommunicationContact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[MinistryShortName] [varchar](50) NULL,
	[MinistryId] [uniqueidentifier] NULL,
	[SortOrder] [int] NULL,
	[IsActive] [bit] NULL,
	[TimeStamp] [timestamp] NULL,
	[RowGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_CommunicationContact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[CommunicationContact] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[CommunicationMaterial]    Script Date: 2018-12-14 11:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[CommunicationMaterial](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[SortOrder] [int] NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CommunicationMaterials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[CommunicationMaterial] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[EventPlanner]    Script Date: 2018-12-14 11:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[EventPlanner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[JobTitle] [nvarchar](150) NULL,
	[SortOrder] [int] NULL,
	[IsActive] [bit] NULL,
	[TimeStamp] [timestamp] NULL,
	[RowGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_EventPlanner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[EventPlanner] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[FavoriteActivity]    Script Date: 2018-12-14 11:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[FavoriteActivity](
	[SystemUserId] [int] NOT NULL,
	[ActivityId] [int] NOT NULL,
 CONSTRAINT [PK_FavoriteActivity] PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC,
	[SystemUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[FavoriteActivity] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[GovernmentRepresentative]    Script Date: 2018-12-14 11:13:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[GovernmentRepresentative](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[SortOrder] [int] NULL,
	[TimeStamp] [timestamp] NULL,
	[RowGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_GovernmentRepresentative] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[GovernmentRepresentative] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[Initiative]    Script Date: 2018-12-14 11:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[Initiative](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[SortOrder] [int] NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
	[ShortName] [nvarchar](30) NULL,
 CONSTRAINT [PK_Initiative] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[Initiative] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[Keyword]    Script Date: 2018-12-14 11:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[Keyword](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LastUpdatedDateTime] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Keyword] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[Keyword] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[Log]    Script Date: 2018-12-14 11:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NOT NULL,
	[LogType] [int] NOT NULL,
	[TableName] [nvarchar](50) NULL,
	[FieldName] [nvarchar](1000) NULL,
	[OldValue] [nvarchar](1000) NULL,
	[NewValue] [nvarchar](1000) NULL,
	[Operation] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastUpdatedDateTime] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[Log] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[NewsFeed]    Script Date: 2018-12-14 11:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[NewsFeed](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NULL,
	[MinistryId] [uniqueidentifier] NOT NULL,
	[Text] [nvarchar](1000) NULL,
	[Description] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [int] NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_NewsFeed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[NewsFeed] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[NRDistribution]    Script Date: 2018-12-14 11:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[NRDistribution](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[SortOrder] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_NRDistribution] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[NRDistribution] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[NROrigin]    Script Date: 2018-12-14 11:13:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[NROrigin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[SortOrder] [int] NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_NROrigin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[NROrigin] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[PremierRequested]    Script Date: 2018-12-14 11:13:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[PremierRequested](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[SortOrder] [int] NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PremierRequested] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[PremierRequested] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[Priority]    Script Date: 2018-12-14 11:13:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[Priority](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Priority] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[Priority] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[Role]    Script Date: 2018-12-14 11:13:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](150) NULL,
	[IsActive] [bit] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RoleTemp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[Role] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[Status]    Script Date: 2018-12-14 11:13:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[Status] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[SystemUser]    Script Date: 2018-12-14 11:13:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[SystemUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[DisplayName] [nvarchar](50) NULL,
	[JobTitle] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[MobileNumber] [nvarchar](15) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[FilterDisplayValue] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [int] NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
	[HiddenColumns] [nvarchar](50) NULL,
 CONSTRAINT [PK_SystemUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[SystemUser] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[SystemUserMinistry]    Script Date: 2018-12-14 11:13:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[SystemUserMinistry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SystemUserId] [int] NULL,
	[MinistryId] [uniqueidentifier] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [int] NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[RowGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_SystemUserMinistry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[SystemUserMinistry] TO  SCHEMA OWNER 
GO
/****** Object:  Table [calendar].[Videographer]    Script Date: 2018-12-14 11:13:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [calendar].[Videographer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[JobTitle] [nvarchar](150) NULL,
	[SortOrder] [int] NULL,
	[IsActive] [bit] NULL,
	[TimeStamp] [timestamp] NULL,
	[RowGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Videographer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [calendar].[Videographer] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dashboard].[Message]    Script Date: 2018-12-14 11:13:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dashboard].[Message](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[SortOrder] [int] NOT NULL,
	[IsHighlighted] [bit] NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dashboard].[Message] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dashboard].[SocialMediaPost]    Script Date: 2018-12-14 11:13:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dashboard].[SocialMediaPost](
	[Id] [uniqueidentifier] NOT NULL,
	[Url] [varchar](255) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dashboard].[SocialMediaPost] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[ApplicationSetting]    Script Date: 2018-12-14 11:13:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationSetting](
	[SettingName] [varchar](100) NOT NULL,
	[SettingValue] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[SettingName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[ApplicationSetting] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Blob]    Script Date: 2018-12-14 11:13:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blob](
	[Id] [uniqueidentifier] NOT NULL,
	[Data] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Blob] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Blob] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Carousel]    Script Date: 2018-12-14 11:13:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carousel](
	[Id] [uniqueidentifier] NOT NULL,
	[PublishDateTime] [datetimeoffset](7) NULL,
	[Timestamp] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Carousel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Carousel] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[CarouselSlide]    Script Date: 2018-12-14 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarouselSlide](
	[CarouselId] [uniqueidentifier] NOT NULL,
	[SlideId] [uniqueidentifier] NOT NULL,
	[SortIndex] [int] NOT NULL,
 CONSTRAINT [PK_CarouselSlide] PRIMARY KEY CLUSTERED 
(
	[CarouselId] ASC,
	[SlideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[CarouselSlide] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Language]    Script Date: 2018-12-14 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Language_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Language] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[MediaDistributionList]    Script Date: 2018-12-14 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaDistributionList](
	[Id] [uniqueidentifier] NOT NULL,
	[Key] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_MediaDistributionList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[MediaDistributionList] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[MediaRequestResolution]    Script Date: 2018-12-14 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaRequestResolution](
	[Id] [uniqueidentifier] NOT NULL,
	[DisplayAs] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MediaRequestResolution] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[MediaRequestResolution] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Ministry]    Script Date: 2018-12-14 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ministry](
	[Id] [uniqueidentifier] NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[DisplayName] [nvarchar](255) NOT NULL,
	[Abbreviation] [nvarchar](10) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[MinisterEmail] [nvarchar](255) NOT NULL,
	[MinisterPhotoUrl] [nvarchar](255) NULL,
	[MinisterPageHtml] [nvarchar](max) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[MiscHtml] [nvarchar](max) NOT NULL,
	[MiscRightHtml] [nvarchar](max) NOT NULL,
	[TwitterUsername] [nvarchar](255) NOT NULL,
	[FlickrUrl] [nvarchar](255) NOT NULL,
	[YoutubeUrl] [nvarchar](255) NOT NULL,
	[AudioUrl] [nvarchar](255) NOT NULL,
	[FacebookEmbedHtml] [nvarchar](max) NOT NULL,
	[YoutubeEmbedHtml] [nvarchar](max) NOT NULL,
	[AudioEmbedHtml] [nvarchar](max) NOT NULL,
	[TopReleaseId] [uniqueidentifier] NULL,
	[FeatureReleaseId] [uniqueidentifier] NULL,
	[MinisterAddress] [nvarchar](255) NOT NULL,
	[MinisterName] [nvarchar](255) NOT NULL,
	[MinisterSummary] [nvarchar](max) NOT NULL,
	[MinistryUrl] [nvarchar](255) NULL,
	[ParentId] [uniqueidentifier] NULL,
	[ContactUserId] [int] NULL,
	[SecondContactUserId] [int] NULL,
	[WeekendContactNumber] [varchar](20) NULL,
	[EodFinalizedDateTime] [datetimeoffset](7) NULL,
	[EodLastRunUserId] [int] NULL,
	[EodLastRunDateTime] [datetimeoffset](7) NULL,
	[DisplayAdditionalName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Ministry] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Ministry_Abbreviation] UNIQUE NONCLUSTERED 
(
	[Abbreviation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_MinistryLanguage_DisplayName] UNIQUE NONCLUSTERED 
(
	[DisplayName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Ministry] TO  SCHEMA OWNER 
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Ministry_Key]    Script Date: 2018-12-14 11:13:30 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_Ministry_Key] ON [dbo].[Ministry]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MinistryLanguage]    Script Date: 2018-12-14 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MinistryLanguage](
	[MinistryId] [uniqueidentifier] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_OrganizationLanguage] PRIMARY KEY CLUSTERED 
(
	[MinistryId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_MinistryLanguage_LanguageName] UNIQUE NONCLUSTERED 
(
	[LanguageId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[MinistryLanguage] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[MinistryNewsletter]    Script Date: 2018-12-14 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MinistryNewsletter](
	[MinistryId] [uniqueidentifier] NOT NULL,
	[NewsletterId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MinistryId] ASC,
	[NewsletterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[MinistryNewsletter] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[MinistrySector]    Script Date: 2018-12-14 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MinistrySector](
	[MinistryId] [uniqueidentifier] NOT NULL,
	[SectorId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MinistrySector] PRIMARY KEY CLUSTERED 
(
	[MinistryId] ASC,
	[SectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[MinistrySector] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[MinistryService]    Script Date: 2018-12-14 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MinistryService](
	[MinistryId] [uniqueidentifier] NOT NULL,
	[SortIndex] [int] NOT NULL,
	[LinkText] [nvarchar](max) NOT NULL,
	[LinkUrl] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MinistryId] ASC,
	[SortIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[MinistryService] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[MinistryTopic]    Script Date: 2018-12-14 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MinistryTopic](
	[MinistryId] [uniqueidentifier] NOT NULL,
	[SortIndex] [int] NOT NULL,
	[LinkText] [nvarchar](max) NOT NULL,
	[LinkUrl] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MinistryId] ASC,
	[SortIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[MinistryTopic] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsRelease]    Script Date: 2018-12-14 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsRelease](
	[Id] [uniqueidentifier] NOT NULL,
	[Timestamp] [datetimeoffset](7) NOT NULL,
	[ReleaseType] [int] NOT NULL,
	[Key] [varchar](255) NOT NULL,
	[CollectionId] [uniqueidentifier] NOT NULL,
	[Year] [int] NULL,
	[YearRelease] [int] NULL,
	[MinistryId] [uniqueidentifier] NULL,
	[MinistryRelease] [int] NULL,
	[Reference] [varchar](50) NOT NULL,
	[ActivityId] [int] NULL,
	[ReleaseDateTime] [datetime] NULL,
	[PublishDateTime] [datetimeoffset](7) NULL,
	[IsCommitted] [bit] NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[PublishOptions] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[HasMediaAssets] [bit] NOT NULL,
	[NodSubscribers] [int] NULL,
	[MediaSubscribers] [int] NULL,
	[AtomId] [varchar](255) NOT NULL,
	[Keywords] [nvarchar](max) NOT NULL,
	[AssetUrl] [varchar](max) NOT NULL,
	[RedirectUrl] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Releases] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsRelease] TO  SCHEMA OWNER 
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NewsRelease_Key]    Script Date: 2018-12-14 11:13:31 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_NewsRelease_Key] ON [dbo].[NewsRelease]
(
	[ReleaseType] ASC,
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsReleaseCollection]    Script Date: 2018-12-14 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseCollection](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_NewsCollection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_NewsCollection_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseCollection] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsReleaseDocument]    Script Date: 2018-12-14 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseDocument](
	[Id] [uniqueidentifier] NOT NULL,
	[ReleaseId] [uniqueidentifier] NOT NULL,
	[SortIndex] [int] NOT NULL,
	[PageLayout] [int] NOT NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseDocument] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsReleaseDocumentContact]    Script Date: 2018-12-14 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseDocumentContact](
	[DocumentId] [uniqueidentifier] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[SortIndex] [int] NOT NULL,
	[Information] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_DocumentLanguageContact] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC,
	[LanguageId] ASC,
	[SortIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseDocumentContact] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsReleaseDocumentLanguage]    Script Date: 2018-12-14 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseDocumentLanguage](
	[DocumentId] [uniqueidentifier] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[PageImageId] [uniqueidentifier] NULL,
	[PageTitle] [nvarchar](50) NOT NULL,
	[Organizations] [nvarchar](250) NOT NULL,
	[Headline] [nvarchar](255) NOT NULL,
	[Subheadline] [nvarchar](100) NOT NULL,
	[Byline] [nvarchar](250) NOT NULL,
	[BodyHtml] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DocumentLanguage] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseDocumentLanguage] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsReleaseHistory]    Script Date: 2018-12-14 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseHistory](
	[ReleaseId] [uniqueidentifier] NOT NULL,
	[PublishDateTime] [datetimeoffset](7) NOT NULL,
	[MimeType] [varchar](100) NOT NULL,
	[BlobId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_NewsReleaseHistory] PRIMARY KEY CLUSTERED 
(
	[ReleaseId] ASC,
	[PublishDateTime] ASC,
	[MimeType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseHistory] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsReleaseImage]    Script Date: 2018-12-14 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseImage](
	[Id] [uniqueidentifier] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[MimeType] [varchar](100) NOT NULL,
	[BlobId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_NewsReleaseImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_NewsReleaseImage_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseImage] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsReleaseImageLanguage]    Script Date: 2018-12-14 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseImageLanguage](
	[ImageId] [uniqueidentifier] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[AlternateName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_NewsReleaseImageLanguage_1] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseImageLanguage] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsReleaseLanguage]    Script Date: 2018-12-14 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseLanguage](
	[ReleaseId] [uniqueidentifier] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Summary] [nvarchar](max) NOT NULL,
	[SocialMediaHeadline] [nvarchar](max) NULL,
	[SocialMediaSummary] [nvarchar](max) NULL,
 CONSTRAINT [PK_ReleaseLanguage] PRIMARY KEY CLUSTERED 
(
	[ReleaseId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseLanguage] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsReleaseLog]    Script Date: 2018-12-14 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReleaseId] [uniqueidentifier] NOT NULL,
	[DateTime] [datetimeoffset](7) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[Description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_NewsReleaseLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseLog] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsReleaseMediaDistribution]    Script Date: 2018-12-14 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseMediaDistribution](
	[ReleaseId] [uniqueidentifier] NOT NULL,
	[MediaDistributionListId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_NewsReleaseMediaDistribution] PRIMARY KEY CLUSTERED 
(
	[ReleaseId] ASC,
	[MediaDistributionListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseMediaDistribution] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsReleaseMinistry]    Script Date: 2018-12-14 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseMinistry](
	[ReleaseId] [uniqueidentifier] NOT NULL,
	[MinistryId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_NewsReleaseMinistry] PRIMARY KEY CLUSTERED 
(
	[ReleaseId] ASC,
	[MinistryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseMinistry] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsReleaseSector]    Script Date: 2018-12-14 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseSector](
	[ReleaseId] [uniqueidentifier] NOT NULL,
	[SectorId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_NewsReleaseSector] PRIMARY KEY CLUSTERED 
(
	[ReleaseId] ASC,
	[SectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseSector] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsReleaseService]    Script Date: 2018-12-14 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseService](
	[ReleaseId] [uniqueidentifier] NOT NULL,
	[ServiceId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_NewsReleaseService] PRIMARY KEY CLUSTERED 
(
	[ReleaseId] ASC,
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseService] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsReleaseTag]    Script Date: 2018-12-14 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseTag](
	[ReleaseId] [uniqueidentifier] NOT NULL,
	[TagId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_NewsReleaseTag] PRIMARY KEY CLUSTERED 
(
	[ReleaseId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseTag] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsReleaseTheme]    Script Date: 2018-12-14 11:13:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseTheme](
	[ReleaseId] [uniqueidentifier] NOT NULL,
	[ThemeId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_NewsReleaseTheme] PRIMARY KEY CLUSTERED 
(
	[ReleaseId] ASC,
	[ThemeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseTheme] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[NewsReleaseType]    Script Date: 2018-12-14 11:13:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsReleaseType](
	[PageTitle] [nvarchar](50) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[ReleaseType] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[PageLayout] [int] NOT NULL,
	[PageImageId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_NewsReleaseType] PRIMARY KEY CLUSTERED 
(
	[PageTitle] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[NewsReleaseType] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[ResourceLink]    Script Date: 2018-12-14 11:13:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceLink](
	[SortIndex] [int] NOT NULL,
	[LinkText] [nvarchar](max) NOT NULL,
	[LinkUrl] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ResourceLink] PRIMARY KEY CLUSTERED 
(
	[SortIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[ResourceLink] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Sector]    Script Date: 2018-12-14 11:13:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sector](
	[Id] [uniqueidentifier] NOT NULL,
	[Key] [varchar](100) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayName] [varchar](255) NULL,
	[Timestamp] [datetime] NOT NULL,
	[MiscHtml] [nvarchar](max) NOT NULL,
	[MiscRightHtml] [nvarchar](max) NOT NULL,
	[TwitterUsername] [varchar](255) NOT NULL,
	[FlickrUrl] [varchar](255) NOT NULL,
	[YoutubeUrl] [varchar](255) NOT NULL,
	[AudioUrl] [varchar](255) NOT NULL,
	[FacebookEmbedHtml] [nvarchar](max) NOT NULL,
	[YoutubeEmbedHtml] [nvarchar](max) NOT NULL,
	[AudioEmbedHtml] [nvarchar](max) NOT NULL,
	[TopReleaseId] [uniqueidentifier] NULL,
	[FeatureReleaseId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Sector] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Sector] TO  SCHEMA OWNER 
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sector_Key]    Script Date: 2018-12-14 11:13:34 AM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_Sector_Key] ON [dbo].[Sector]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SectorLanguage]    Script Date: 2018-12-14 11:13:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectorLanguage](
	[SectorId] [uniqueidentifier] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SectorLanguage] PRIMARY KEY CLUSTERED 
(
	[SectorId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_SectorLanguage_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[SectorLanguage] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Service]    Script Date: 2018-12-14 11:13:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [uniqueidentifier] NOT NULL,
	[Key] [varchar](255) NOT NULL,
	[DisplayName] [varchar](255) NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Service] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 2018-12-14 11:13:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[Id] [uniqueidentifier] NOT NULL,
	[Headline] [nvarchar](255) NOT NULL,
	[Summary] [nvarchar](max) NOT NULL,
	[ActionUrl] [nvarchar](255) NOT NULL,
	[Image] [image] NOT NULL,
	[FacebookPostUrl] [nvarchar](255) NULL,
	[Justify] [int] NOT NULL,
	[Timestamp] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Slide] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 2018-12-14 11:13:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [uniqueidentifier] NOT NULL,
	[Key] [varchar](255) NOT NULL,
	[DisplayName] [varchar](255) NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Tag] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Theme]    Script Date: 2018-12-14 11:13:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theme](
	[Id] [uniqueidentifier] NOT NULL,
	[Key] [varchar](255) NOT NULL,
	[DisplayName] [varchar](255) NULL,
	[Timestamp] [datetime] NOT NULL,
	[TopReleaseId] [uniqueidentifier] NULL,
	[FeatureReleaseId] [uniqueidentifier] NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Theme] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Theme] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[User]    Script Date: 2018-12-14 11:13:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[DisplayName] [nvarchar](256) NOT NULL,
	[EmailAddress] [nvarchar](256) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_User_DisplayName] UNIQUE NONCLUSTERED 
(
	[DisplayName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_User_EmailAddress] UNIQUE NONCLUSTERED 
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[User] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[Beat]    Script Date: 2018-12-14 11:13:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[Beat](
	[Id] [uniqueidentifier] NOT NULL,
	[BeatName] [nvarchar](255) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_Beat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[Beat] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[Company]    Script Date: 2018-12-14 11:13:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[Company](
	[Id] [uniqueidentifier] NOT NULL,
	[ParentCompanyId] [uniqueidentifier] NULL,
	[CompanyName] [varchar](250) NOT NULL,
	[CompanyDescription] [varchar](2500) NOT NULL,
	[CirculationDescription] [varchar](500) NULL,
	[Deadlines] [varchar](500) NULL,
	[KeyPrograms] [varchar](500) NULL,
	[PrintCategoryId] [uniqueidentifier] NULL,
	[PublicationFrequencyId] [uniqueidentifier] NULL,
	[IsMajorMedia] [bit] NULL,
	[IsEthnicMedia] [bit] NULL,
	[IsLiveMedia] [bit] NULL,
	[IsOutlet] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[RecordEditedBy] [varchar](50) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[Company] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[CompanyAddress]    Script Date: 2018-12-14 11:13:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[CompanyAddress](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[StreetAddress] [varchar](250) NOT NULL,
	[CityId] [uniqueidentifier] NULL,
	[CityName] [varchar](150) NULL,
	[ProvStateId] [uniqueidentifier] NULL,
	[ProvStateName] [varchar](150) NULL,
	[PostalZipCode] [varchar](50) NOT NULL,
	[CountryId] [uniqueidentifier] NOT NULL,
	[AddressType] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[CompanyAddress] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[CompanyDistribution]    Script Date: 2018-12-14 11:13:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[CompanyDistribution](
	[CompanyId] [uniqueidentifier] NOT NULL,
	[DistributionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompanyDistribution] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC,
	[DistributionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[CompanyDistribution] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[CompanyElectoralDistrict]    Script Date: 2018-12-14 11:13:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[CompanyElectoralDistrict](
	[CompanyId] [uniqueidentifier] NOT NULL,
	[DistrictId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompanyElectoralDistrict] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC,
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[CompanyElectoralDistrict] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[CompanyEthnicity]    Script Date: 2018-12-14 11:13:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[CompanyEthnicity](
	[CompanyId] [uniqueidentifier] NOT NULL,
	[EthnicityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompanyEthnicity] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC,
	[EthnicityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[CompanyEthnicity] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[CompanyLanguage]    Script Date: 2018-12-14 11:13:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[CompanyLanguage](
	[CompanyId] [uniqueidentifier] NOT NULL,
	[LanguageId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompanyLanguage] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[CompanyLanguage] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[CompanyMediaDesk]    Script Date: 2018-12-14 11:13:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[CompanyMediaDesk](
	[CompanyId] [uniqueidentifier] NOT NULL,
	[MediaDeskId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompanyMediaDesk] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC,
	[MediaDeskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[CompanyMediaDesk] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[CompanyMediaPartner]    Script Date: 2018-12-14 11:13:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[CompanyMediaPartner](
	[CompanyId] [uniqueidentifier] NOT NULL,
	[MediaPartnerId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompanyMediaPartner] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC,
	[MediaPartnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[CompanyMediaPartner] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[CompanyMediaType]    Script Date: 2018-12-14 11:13:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[CompanyMediaType](
	[CompanyId] [uniqueidentifier] NOT NULL,
	[MediaTypeId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompanyMediaType] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC,
	[MediaTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[CompanyMediaType] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[CompanyPhoneNumber]    Script Date: 2018-12-14 11:13:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[CompanyPhoneNumber](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[PhoneTypeId] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[PhoneNumberExtension] [nvarchar](15) NULL,
 CONSTRAINT [PK_CompanyPhoneNumber] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[CompanyPhoneNumber] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[CompanyPublicationDays]    Script Date: 2018-12-14 11:13:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[CompanyPublicationDays](
	[CompanyId] [uniqueidentifier] NOT NULL,
	[PublicationDaysId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompanyPublicationDays] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC,
	[PublicationDaysId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[CompanyPublicationDays] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[CompanyRegion]    Script Date: 2018-12-14 11:13:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[CompanyRegion](
	[CompanyId] [uniqueidentifier] NOT NULL,
	[RegionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompanyRegion] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC,
	[RegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[CompanyRegion] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[CompanySector]    Script Date: 2018-12-14 11:13:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[CompanySector](
	[CompanyId] [uniqueidentifier] NOT NULL,
	[SectorId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompanySector] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC,
	[SectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[CompanySector] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[CompanySpecialtyPublication]    Script Date: 2018-12-14 11:13:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[CompanySpecialtyPublication](
	[CompanyId] [uniqueidentifier] NOT NULL,
	[SpecialtyPublicationId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompanySpecialtyPublication] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC,
	[SpecialtyPublicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[CompanySpecialtyPublication] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[CompanyWebAddress]    Script Date: 2018-12-14 11:13:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[CompanyWebAddress](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[WebAddress] [varchar](250) NOT NULL,
	[WebAddressTypeId] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CompanyWebAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[CompanyWebAddress] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[Contact]    Script Date: 2018-12-14 11:13:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[Contact](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](150) NOT NULL,
	[LastName] [nvarchar](150) NOT NULL,
	[MinistryId] [uniqueidentifier] NULL,
	[MinisterialJobTitleId] [uniqueidentifier] NULL,
	[MLAAssignmentId] [uniqueidentifier] NULL,
	[IsPressGallery] [bit] NOT NULL,
	[HasMinisterAssignment] [bit] NOT NULL,
	[IsPrimaryMediaContact] [bit] NOT NULL,
	[IsSecondaryMediaContact] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[RecordEditedBy] [nvarchar](50) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ShowNotes] [nvarchar](100) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[Contact] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[ContactAddress]    Script Date: 2018-12-14 11:13:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[ContactAddress](
	[Id] [uniqueidentifier] NOT NULL,
	[ContactId] [uniqueidentifier] NOT NULL,
	[StreetAddress] [varchar](250) NOT NULL,
	[CityId] [uniqueidentifier] NULL,
	[CityName] [varchar](150) NULL,
	[ProvStateId] [uniqueidentifier] NULL,
	[ProvStateName] [varchar](150) NULL,
	[PostalZipCode] [varchar](50) NOT NULL,
	[CountryId] [uniqueidentifier] NOT NULL,
	[AddressType] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ContactAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[ContactAddress] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[ContactBeat]    Script Date: 2018-12-14 11:13:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[ContactBeat](
	[Id] [uniqueidentifier] NOT NULL,
	[ContactId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[BeatId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ContactBeat_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[ContactBeat] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[ContactCity]    Script Date: 2018-12-14 11:13:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[ContactCity](
	[Id] [uniqueidentifier] NOT NULL,
	[CityName] [varchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[ContactCity] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[ContactElectoralDistrict]    Script Date: 2018-12-14 11:13:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[ContactElectoralDistrict](
	[ContactId] [uniqueidentifier] NOT NULL,
	[DistrictId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ContactElectoralDistrict] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC,
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[ContactElectoralDistrict] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[ContactMediaJobTitle]    Script Date: 2018-12-14 11:13:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[ContactMediaJobTitle](
	[Id] [uniqueidentifier] NOT NULL,
	[ContactId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[MediaJobTitleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ContactMediaJobTitle_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [FK_ContactMediaJobTitle_1JobPerOutlet] UNIQUE NONCLUSTERED 
(
	[ContactId] ASC,
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[ContactMediaJobTitle] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[ContactPhoneNumber]    Script Date: 2018-12-14 11:13:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[ContactPhoneNumber](
	[Id] [uniqueidentifier] NOT NULL,
	[ContactId] [uniqueidentifier] NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[PhoneTypeId] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[PhoneNumberExtension] [nvarchar](15) NULL,
 CONSTRAINT [PK_ContactPhoneNumber] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[ContactPhoneNumber] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[ContactRegion]    Script Date: 2018-12-14 11:13:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[ContactRegion](
	[ContactId] [uniqueidentifier] NOT NULL,
	[RegionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ContactRegion] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC,
	[RegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[ContactRegion] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[ContactSector]    Script Date: 2018-12-14 11:13:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[ContactSector](
	[ContactId] [uniqueidentifier] NOT NULL,
	[SectorId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ContactSector] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC,
	[SectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[ContactSector] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[ContactWebAddress]    Script Date: 2018-12-14 11:13:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[ContactWebAddress](
	[Id] [uniqueidentifier] NOT NULL,
	[ContactId] [uniqueidentifier] NOT NULL,
	[WebAddress] [varchar](250) NOT NULL,
	[WebAddressTypeId] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ContactWebAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[ContactWebAddress] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[Country]    Script Date: 2018-12-14 11:13:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[Country](
	[Id] [uniqueidentifier] NOT NULL,
	[CountryName] [varchar](250) NOT NULL,
	[CountryAbbrev] [varchar](15) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[Country] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[Distribution]    Script Date: 2018-12-14 11:13:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[Distribution](
	[Id] [uniqueidentifier] NOT NULL,
	[DistributionName] [varchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_Distribution] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[Distribution] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[ElectoralDistrict]    Script Date: 2018-12-14 11:13:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[ElectoralDistrict](
	[Id] [uniqueidentifier] NOT NULL,
	[DistrictName] [varchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_ElectoralDistrict] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[ElectoralDistrict] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[Ethnicity]    Script Date: 2018-12-14 11:13:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[Ethnicity](
	[Id] [uniqueidentifier] NOT NULL,
	[EthnicityName] [varchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_EthnicityLanguage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[Ethnicity] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[MediaDesk]    Script Date: 2018-12-14 11:13:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[MediaDesk](
	[Id] [uniqueidentifier] NOT NULL,
	[MediaDeskName] [varchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_MediaDesk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[MediaDesk] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[MediaJobTitle]    Script Date: 2018-12-14 11:13:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[MediaJobTitle](
	[Id] [uniqueidentifier] NOT NULL,
	[MediaJobTitleName] [varchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_MediaJobTitle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[MediaJobTitle] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[MediaLanguage]    Script Date: 2018-12-14 11:13:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[MediaLanguage](
	[Id] [uniqueidentifier] NOT NULL,
	[LanguageName] [varchar](150) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_Lang] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[MediaLanguage] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[MediaRequest]    Script Date: 2018-12-14 11:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[MediaRequest](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL,
	[CreatedById] [int] NOT NULL,
	[ModifiedAt] [datetimeoffset](7) NOT NULL,
	[ModifiedById] [int] NOT NULL,
	[LeadMinistryId] [uniqueidentifier] NOT NULL,
	[ResponsibleUserId] [int] NOT NULL,
	[DeadlineAt] [datetimeoffset](7) NULL,
	[RequestTopic] [nvarchar](250) NOT NULL,
	[RequestContent] [nvarchar](4000) NOT NULL,
	[Response] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[RequestedAt] [datetimeoffset](7) NOT NULL,
	[AcknowledgedAt] [datetimeoffset](7) NULL,
	[RespondedAt] [datetimeoffset](7) NULL,
	[RequestParentId] [uniqueidentifier] NULL,
	[EodReportWith] [int] NULL,
	[ResolutionId] [uniqueidentifier] NULL,
	[TakeOverRequestMinistryId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_MediaRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[MediaRequest] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[MediaRequestContact]    Script Date: 2018-12-14 11:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[MediaRequestContact](
	[MediaRequestId] [uniqueidentifier] NOT NULL,
	[ContactId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MediaRequestContact] PRIMARY KEY CLUSTERED 
(
	[MediaRequestId] ASC,
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[MediaRequestContact] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[MediaRequestSharedMinistry]    Script Date: 2018-12-14 11:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[MediaRequestSharedMinistry](
	[MediaRequestId] [uniqueidentifier] NOT NULL,
	[MinistryId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MediaRequestId] ASC,
	[MinistryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[MediaRequestSharedMinistry] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[MediaType]    Script Date: 2018-12-14 11:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[MediaType](
	[Id] [uniqueidentifier] NOT NULL,
	[MediaTypeName] [varchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_MediaType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[MediaType] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[MinisterialJobTitle]    Script Date: 2018-12-14 11:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[MinisterialJobTitle](
	[Id] [uniqueidentifier] NOT NULL,
	[MinisterialJobTitleName] [varchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_MinisterialJobTitle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[MinisterialJobTitle] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[NewsRegion]    Script Date: 2018-12-14 11:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[NewsRegion](
	[Id] [uniqueidentifier] NOT NULL,
	[RegionName] [varchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[NewsRegion] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[PhoneType]    Script Date: 2018-12-14 11:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[PhoneType](
	[Id] [uniqueidentifier] NOT NULL,
	[PhoneTypeName] [varchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_PhoneType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[PhoneType] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[PrintCategory]    Script Date: 2018-12-14 11:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[PrintCategory](
	[Id] [uniqueidentifier] NOT NULL,
	[PrintCategoryName] [varchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_PrintCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[PrintCategory] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[ProvState]    Script Date: 2018-12-14 11:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[ProvState](
	[Id] [uniqueidentifier] NOT NULL,
	[ProvStateName] [varchar](150) NOT NULL,
	[ProvStateAbbrev] [varchar](15) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_ProvState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[ProvState] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[PublicationDays]    Script Date: 2018-12-14 11:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[PublicationDays](
	[Id] [uniqueidentifier] NOT NULL,
	[PublicationDaysName] [varchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_PublicationDays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[PublicationDays] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[PublicationFrequency]    Script Date: 2018-12-14 11:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[PublicationFrequency](
	[Id] [uniqueidentifier] NOT NULL,
	[PublicationFrequencyName] [varchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_PublicationFrequency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[PublicationFrequency] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[Report]    Script Date: 2018-12-14 11:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[Report](
	[Id] [uniqueidentifier] NOT NULL,
	[ReportName] [varchar](150) NOT NULL,
	[ReportOwner] [varchar](150) NOT NULL,
	[ReportQueryString] [varchar](max) NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[Report] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[SpecialtyPublication]    Script Date: 2018-12-14 11:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[SpecialtyPublication](
	[Id] [uniqueidentifier] NOT NULL,
	[SpecialtyPublicationName] [varchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_SpecialtyPublication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[SpecialtyPublication] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[SysConfig]    Script Date: 2018-12-14 11:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[SysConfig](
	[ConfigKey] [varchar](250) NOT NULL,
	[ConfigValue] [varchar](250) NOT NULL,
	[ConfigDataType] [int] NOT NULL,
	[ConfigDescription] [varchar](500) NULL,
 CONSTRAINT [PK_SysConfig] PRIMARY KEY CLUSTERED 
(
	[ConfigKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[SysConfig] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[SysLog]    Script Date: 2018-12-14 11:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[SysLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[Action] [varchar](50) NOT NULL,
	[EntityType] [varchar](50) NOT NULL,
	[EntityId] [uniqueidentifier] NULL,
	[EntityData] [varchar](150) NOT NULL,
	[EventId] [uniqueidentifier] NULL,
	[EventData] [varchar](max) NULL,
	[EventUser] [varchar](150) NOT NULL,
	[EventDate] [datetime] NOT NULL,
 CONSTRAINT [PK_sys_log] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[SysLog] TO  SCHEMA OWNER 
GO
/****** Object:  Table [media].[WebAddressType]    Script Date: 2018-12-14 11:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [media].[WebAddressType](
	[Id] [uniqueidentifier] NOT NULL,
	[WebAddressTypeName] [varchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_WebAddressType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [media].[WebAddressType] TO  SCHEMA OWNER 
GO
/****** Object:  View [calendar].[ActiveActivities]    Script Date: 2018-12-14 11:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [calendar].[ActiveActivities]
AS
SELECT         calendar.Activity.Id, calendar.Activity.StatusId, calendar.Activity.HqStatusId, calendar.Activity.StartDateTime, calendar.Activity.EndDateTime, calendar.Activity.IsConfirmed, 
                         calendar.Activity.PotentialDates, calendar.Activity.Title, calendar.Activity.Details, calendar.Activity.Comments, calendar.Activity.HqComments, calendar.Activity.HqSection, calendar.Activity.PremierRequestedId, 
                         calendar.Activity.ContactMinistryId, dbo.Ministry.Abbreviation AS Ministry, calendar.Activity.LeadOrganization, calendar.Activity.CityId, calendar.Activity.Venue, calendar.Activity.GovernmentRepresentativeId, 
                         calendar.Activity.IsAllDay, calendar.Activity.IsAtLegislature, calendar.Activity.IsConfidential, calendar.Activity.IsCrossGovernment, calendar.Activity.IsActive, calendar.Activity.Schedule, 
                         calendar.Activity.Significance, calendar.Activity.IsIssue, calendar.Activity.IsMilestone, calendar.Activity.Strategy, calendar.Activity.NRDateTime, calendar.Activity.CreatedDateTime, calendar.Activity.CreatedBy, 
                         calendar.Activity.LastUpdatedDateTime, calendar.Activity.LastUpdatedBy, calendar.Activity.CommunicationContactId, calendar.Status.Name AS Status, HqStatus.Name AS HqStatus, calendar.City.Name AS City, 
                         calendar.Activity.NRDistributionId, calendar.sGetActivitySharedWithMinistries(calendar.Activity.Id) AS SharedWithMinistryIds, calendar.sGetActivityFavoriteSystemUsers(calendar.Activity.Id) 
                         AS FavoriteSystemUsers, calendar.sGetActivityCategoriesByName(calendar.Activity.Id) AS Categories, calendar.sGetActivitySectorsByName(calendar.Activity.Id) AS Sectors, 
                         calendar.sGetActivityNROrigins(calendar.Activity.Id) AS NROrigins, 
                         STUFF((Select ', '+ keywordName FROM [calendar].GetActivityKeywords([calendar].Activity.Id) FOR XML PATH('')), 1, 1, '') AS Keywords,
				 		 calendar.NRDistribution.Name AS NRDistributions, calendar.GovernmentRepresentative.Name AS GovernmentRepresentative, 
                         calendar.Activity.OtherCity, calendar.PremierRequested.Name AS PremierRequested, calendar.CommunicationContact.Name AS ContactName, calendar.SystemUser.PhoneNumber AS ContactNumber, 
                         calendar.Activity.EventPlannerId, calendar.Activity.VideographerId, calendar.sGetActivityCommunicationMaterialsByName(calendar.Activity.Id) AS CommunicationsMaterials, calendar.Activity.IsTitleNeedsReview, 
                         calendar.Activity.IsDetailsNeedsReview, calendar.Activity.IsRepresentativeNeedsReview, calendar.Activity.IsCityNeedsReview, calendar.Activity.IsStartDateNeedsReview, 
                         calendar.Activity.IsEndDateNeedsReview, calendar.Activity.IsCategoriesNeedsReview, calendar.Activity.IsActiveNeedsReview, calendar.Activity.IsCommMaterialsNeedsReview
FROM            calendar.Activity LEFT OUTER JOIN
                         calendar.Status ON calendar.Activity.StatusId = calendar.Status.Id LEFT OUTER JOIN
                         calendar.Status AS HqStatus ON calendar.Activity.HqStatusId = HqStatus.Id LEFT OUTER JOIN
                         calendar.City ON calendar.Activity.CityId = calendar.City.Id LEFT OUTER JOIN
                         calendar.PremierRequested ON calendar.Activity.PremierRequestedId = calendar.PremierRequested.Id LEFT OUTER JOIN
                         calendar.GovernmentRepresentative ON calendar.Activity.GovernmentRepresentativeId = calendar.GovernmentRepresentative.Id LEFT OUTER JOIN
                         calendar.NRDistribution ON calendar.Activity.NRDistributionId = calendar.NRDistribution.Id LEFT OUTER JOIN
                         calendar.CommunicationContact ON calendar.Activity.CommunicationContactId = calendar.CommunicationContact.Id INNER JOIN
                         calendar.SystemUser ON calendar.SystemUser.Id = calendar.CommunicationContact.SystemUserId LEFT OUTER JOIN
                         calendar.EventPlanner AS EventPlanner ON calendar.Activity.EventPlannerId = EventPlanner.Id LEFT OUTER JOIN
                         calendar.Videographer AS Videographer ON calendar.Activity.VideographerId = Videographer.Id INNER JOIN
                         dbo.Ministry ON calendar.Activity.ContactMinistryId = dbo.Ministry.Id

GO
ALTER AUTHORIZATION ON [calendar].[ActiveActivities] TO  SCHEMA OWNER 
GO
/****** Object:  View [calendar].[ActiveCommunicationContacts]    Script Date: 2018-12-14 11:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [calendar].[ActiveCommunicationContacts]
AS
SELECT 
	TOP (100) PERCENT 
	cc.Id, cc.SystemUserId, 
	cc.Name COLLATE DATABASE_DEFAULT + ' ' + [calendar].SystemUser.PhoneNumber COLLATE DATABASE_DEFAULT AS NameAndNumber, 
	cc.MinistryShortName, 
	cc.Name, 
	[dbo].[Ministry].Id AS MinistryId, 
	cc.MinistryId AS Expr1,
	cc.SortOrder
FROM [calendar].CommunicationContact AS cc 
INNER JOIN [dbo].[Ministry] ON cc.MinistryShortName COLLATE DATABASE_DEFAULT = [dbo].[Ministry].Abbreviation COLLATE DATABASE_DEFAULT OR  cc.MinistryId = [dbo].[Ministry].Id 
INNER JOIN [calendar].SystemUser ON cc.SystemUserId = [calendar].SystemUser.Id

WHERE (cc.IsActive = 1) 
AND ([calendar].SystemUser.IsActive = 1)
AND [dbo].[Ministry].IsActive = 1
ORDER BY cc.SortOrder
GO
ALTER AUTHORIZATION ON [calendar].[ActiveCommunicationContacts] TO  SCHEMA OWNER 
GO
/****** Object:  View [calendar].[ActiveDistinctCommunicationContacts]    Script Date: 2018-12-14 11:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [calendar].[ActiveDistinctCommunicationContacts]
AS
SELECT 
	DISTINCT
	au.Id as SystemUserId,
	au.FullName COLLATE DATABASE_DEFAULT 
		+ ' ' + au.PhoneNumber COLLATE DATABASE_DEFAULT 
		as NameAndNumber
	,au.FullName as Name
	,cc.SortOrder
FROM [calendar].SystemUser au 
INNER JOIN [calendar].CommunicationContact AS cc ON cc.SystemUserId = au.Id 
WHERE (au.IsActive = 1)
AND (cc.IsActive = 1)
GO
ALTER AUTHORIZATION ON [calendar].[ActiveDistinctCommunicationContacts] TO  SCHEMA OWNER 
GO
/****** Object:  Index [IX_EndDateTime]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_EndDateTime] ON [calendar].[Activity]
(
	[EndDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StartDateTime]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_StartDateTime] ON [calendar].[Activity]
(
	[StartDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivityId]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityId] ON [calendar].[ActivityCategories]
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivityId]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityId] ON [calendar].[ActivityCommunicationMaterials]
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivityId]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityId] ON [calendar].[ActivityInitiatives]
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivityId]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityId] ON [calendar].[ActivityNROrigins]
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivityId]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityId] ON [calendar].[ActivitySectors]
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ActivityId]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_ActivityId] ON [calendar].[ActivitySharedWith]
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FavoriteActivity]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_FavoriteActivity] ON [calendar].[FavoriteActivity]
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UX_SystemUser_RowGuid]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_SystemUser_RowGuid] ON [calendar].[SystemUser]
(
	[RowGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UX_CarouselSlide_SortIndex]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_CarouselSlide_SortIndex] ON [dbo].[CarouselSlide]
(
	[CarouselId] ASC,
	[SlideId] ASC,
	[SortIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MinistryNewsletter_MinistryNewsletter]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MinistryNewsletter_MinistryNewsletter] ON [dbo].[MinistryNewsletter]
(
	[MinistryId] ASC,
	[NewsletterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NewsRelease_Reference]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_NewsRelease_Reference] ON [dbo].[NewsRelease]
(
	[Reference] ASC
)
WHERE ([Reference]<>'')
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NewsRelease_YearRelease]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_NewsRelease_YearRelease] ON [dbo].[NewsRelease]
(
	[Year] ASC,
	[YearRelease] ASC
)
WHERE ([Year] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_Company_UniqueActiveOutletName]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [FK_Company_UniqueActiveOutletName] ON [media].[Company]
(
	[CompanyName] ASC
)
WHERE ([IsActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AddressType]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_AddressType] ON [media].[CompanyAddress]
(
	[AddressType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_Contact_UniqueActiveName]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [FK_Contact_UniqueActiveName] ON [media].[Contact]
(
	[FirstName] ASC,
	[LastName] ASC
)
WHERE ([IsActive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AddressType]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_AddressType] ON [media].[ContactAddress]
(
	[AddressType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_sys_config]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_sys_config] ON [media].[SysConfig]
(
	[ConfigKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_sys_config_1]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_sys_config_1] ON [media].[SysConfig]
(
	[ConfigValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_sys_config_2]    Script Date: 2018-12-14 11:13:43 AM ******/
CREATE NONCLUSTERED INDEX [IX_sys_config_2] ON [media].[SysConfig]
(
	[ConfigDataType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_Title]  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_Details]  DEFAULT ('') FOR [Details]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_Schedule]  DEFAULT ('') FOR [Schedule]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_Significance]  DEFAULT ('') FOR [Significance]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_HqSection]  DEFAULT ((2)) FOR [HqSection]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsConfirmed]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsIssue]  DEFAULT ((0)) FOR [IsIssue]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsAllDay]  DEFAULT ((0)) FOR [IsAllDay]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsAtLegislature]  DEFAULT ((0)) FOR [IsAtLegislature]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsConfidential]  DEFAULT ((0)) FOR [IsConfidential]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsCrossGovernment]  DEFAULT ((0)) FOR [IsCrossGovernment]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsMilestone]  DEFAULT ((0)) FOR [IsMilestone]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsTitleNeedsReview]  DEFAULT ((0)) FOR [IsTitleNeedsReview]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsDetailsNeedsReview]  DEFAULT ((0)) FOR [IsDetailsNeedsReview]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsRepresentativeNeedsReview]  DEFAULT ((0)) FOR [IsRepresentativeNeedsReview]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsCityNeedsReview]  DEFAULT ((0)) FOR [IsCityNeedsReview]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsStartDateNeedsReview]  DEFAULT ((0)) FOR [IsStartDateNeedsReview]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsEndDateNeedsReview]  DEFAULT ((0)) FOR [IsEndDateNeedsReview]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsCategoriesNeedsReview]  DEFAULT ((0)) FOR [IsCategoriesNeedsReview]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsCommMaterialsNeedsReview]  DEFAULT ((0)) FOR [IsCommMaterialsNeedsReview]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_IsStatusNeedsReview]  DEFAULT ((0)) FOR [IsActiveNeedsReview]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[Activity] ADD  CONSTRAINT [DF_Activity_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[ActivityCategories] ADD  CONSTRAINT [DF_ActivityCategories_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[ActivityCategories] ADD  CONSTRAINT [DF_ActivityCategories_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [calendar].[ActivityCategories] ADD  CONSTRAINT [DF_ActivityCategories_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[ActivityCategories] ADD  CONSTRAINT [DF_ActivityCategories_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[ActivityCommunicationMaterials] ADD  CONSTRAINT [DF_ActivityCommunicationMaterials_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[ActivityCommunicationMaterials] ADD  CONSTRAINT [DF_ActivityCommunicationMaterials_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [calendar].[ActivityCommunicationMaterials] ADD  CONSTRAINT [DF_ActivityCommunicationMaterials_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[ActivityCommunicationMaterials] ADD  CONSTRAINT [DF_ActivityCommunicationMaterials_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[ActivityFiles] ADD  CONSTRAINT [DF_ActivityFiles_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[ActivityFilter] ADD  CONSTRAINT [DF_ActivityFilter_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[ActivityFilter] ADD  CONSTRAINT [DF_ActivityFilter_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [calendar].[ActivityFilter] ADD  CONSTRAINT [DF_ActivityFilter_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[ActivityFilter] ADD  CONSTRAINT [DF_ActivityFilter_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[ActivityInitiatives] ADD  CONSTRAINT [DF_ActivityInitiatives_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[ActivityInitiatives] ADD  CONSTRAINT [DF_ActivityInitiatives_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [calendar].[ActivityInitiatives] ADD  CONSTRAINT [DF_ActivityInitiatives_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[ActivityInitiatives] ADD  CONSTRAINT [DF_ActivityInitiatives_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[ActivityKeywords] ADD  CONSTRAINT [DF_ActivityKeywords_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[ActivityKeywords] ADD  CONSTRAINT [DF_ActivityKeywords_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[ActivityNROrigins] ADD  CONSTRAINT [DF_ActivityNewsReleaseOrigins_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[ActivityNROrigins] ADD  CONSTRAINT [DF_ActivityNewsReleaseOrigins_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [calendar].[ActivityNROrigins] ADD  CONSTRAINT [DF_ActivityNewsReleaseOrigins_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[ActivityNROrigins] ADD  CONSTRAINT [DF_ActivityNewsReleaseOrigins_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[ActivitySectors] ADD  CONSTRAINT [DF_ActivitySectors_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[ActivitySectors] ADD  CONSTRAINT [DF_ActivitySectors_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [calendar].[ActivitySectors] ADD  CONSTRAINT [DF_ActivitySectors_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[ActivitySectors] ADD  CONSTRAINT [DF_ActivitySectors_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[ActivityServices] ADD  CONSTRAINT [DF_ActivityServices_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[ActivityServices] ADD  CONSTRAINT [DF_ActivityServices_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [calendar].[ActivityServices] ADD  CONSTRAINT [DF_ActivityServices_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[ActivitySharedWith] ADD  CONSTRAINT [DF_ActivitySharedWith_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[ActivitySharedWith] ADD  CONSTRAINT [DF_ActivitySharedWith_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [calendar].[ActivitySharedWith] ADD  CONSTRAINT [DF_ActivitySharedWith_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[ActivitySharedWith] ADD  CONSTRAINT [DF_ActivitySharedWith_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[ActivityThemes] ADD  CONSTRAINT [DF_ActivityThemes_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[ActivityThemes] ADD  CONSTRAINT [DF_ActivityThemes_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [calendar].[ActivityThemes] ADD  CONSTRAINT [DF_ActivityThemes_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[Category] ADD  CONSTRAINT [DF_Category_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[Category] ADD  CONSTRAINT [DF_Category_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[City] ADD  CONSTRAINT [DF_Location_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[City] ADD  CONSTRAINT [DF_Location_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[City] ADD  CONSTRAINT [DF_Location_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [calendar].[CommunicationContact] ADD  CONSTRAINT [DF_CommunicationContact_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[CommunicationContact] ADD  CONSTRAINT [DF_CommunicationContact_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[CommunicationMaterial] ADD  CONSTRAINT [DF_CommunicationMaterials_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[CommunicationMaterial] ADD  CONSTRAINT [DF_CommunicationMaterials_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[EventPlanner] ADD  CONSTRAINT [DF_EventPlanner_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[EventPlanner] ADD  CONSTRAINT [DF_EventPlanner_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[GovernmentRepresentative] ADD  CONSTRAINT [DF_GovernmentRepresentative_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[GovernmentRepresentative] ADD  CONSTRAINT [DF_GovernmentRepresentative_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[Initiative] ADD  CONSTRAINT [DF_Initiative_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[Initiative] ADD  CONSTRAINT [DF_Initiative_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[Keyword] ADD  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [calendar].[Keyword] ADD  CONSTRAINT [DF_Keyword_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[Keyword] ADD  CONSTRAINT [DF_Keyword_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[Log] ADD  CONSTRAINT [DF_Log_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[Log] ADD  CONSTRAINT [DF_Log_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [calendar].[Log] ADD  CONSTRAINT [DF_Log_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[Log] ADD  CONSTRAINT [DF_Log_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[NewsFeed] ADD  CONSTRAINT [DF_NewsFeed_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[NewsFeed] ADD  CONSTRAINT [DF_NewsFeed_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [calendar].[NewsFeed] ADD  CONSTRAINT [DF_NewsFeed_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[NewsFeed] ADD  CONSTRAINT [DF_NewsFeed_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[NRDistribution] ADD  CONSTRAINT [DF_NRDistribution_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
ALTER TABLE [calendar].[NRDistribution] ADD  CONSTRAINT [DF_NRDistribution_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[NRDistribution] ADD  CONSTRAINT [DF_NRDistribution_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[NROrigin] ADD  CONSTRAINT [DF_NROrigin_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[NROrigin] ADD  CONSTRAINT [DF_NROrigin_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[PremierRequested] ADD  CONSTRAINT [DF_PremierRequested_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[PremierRequested] ADD  CONSTRAINT [DF_PremierRequested_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[Priority] ADD  CONSTRAINT [DF_Priority_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[Priority] ADD  CONSTRAINT [DF_Priority_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[Role] ADD  CONSTRAINT [DF_RoleTemp_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[Role] ADD  CONSTRAINT [DF_RoleTemp_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[Status] ADD  CONSTRAINT [DF_Status_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[Status] ADD  CONSTRAINT [DF_Status_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[SystemUser] ADD  CONSTRAINT [DF_SystemUser_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[SystemUser] ADD  CONSTRAINT [DF_SystemUser_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [calendar].[SystemUser] ADD  CONSTRAINT [DF_SystemUser_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[SystemUser] ADD  CONSTRAINT [DF_SystemUser_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[SystemUserMinistry] ADD  CONSTRAINT [DF_SystemUserMinistry_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[SystemUserMinistry] ADD  CONSTRAINT [DF_SystemUserMinistry_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [calendar].[SystemUserMinistry] ADD  CONSTRAINT [DF_SystemUserMinistry_LastUpdatedDateTime]  DEFAULT (getdate()) FOR [LastUpdatedDateTime]
GO
ALTER TABLE [calendar].[SystemUserMinistry] ADD  CONSTRAINT [DF_SystemUserMinistry_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [calendar].[Videographer] ADD  CONSTRAINT [DF_Videographer_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [calendar].[Videographer] ADD  CONSTRAINT [DF_Videographer_RowGuid]  DEFAULT (newid()) FOR [RowGuid]
GO
ALTER TABLE [dashboard].[Message] ADD  CONSTRAINT [DF_Message_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dashboard].[Message] ADD  CONSTRAINT [DF_Message_IsHighlighted]  DEFAULT ((0)) FOR [IsHighlighted]
GO
ALTER TABLE [dashboard].[Message] ADD  CONSTRAINT [DF_Message_IsPublished]  DEFAULT ((0)) FOR [IsPublished]
GO
ALTER TABLE [dashboard].[Message] ADD  CONSTRAINT [DF_Message_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dashboard].[SocialMediaPost] ADD  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dashboard].[SocialMediaPost] ADD  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[Language] ADD  CONSTRAINT [DF_Language_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[MediaDistributionList] ADD  CONSTRAINT [DF_MediaDistributionList_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[MediaDistributionList] ADD  CONSTRAINT [DF_MediaDistributionList_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[MediaRequestResolution] ADD  CONSTRAINT [DF_MediaRequestResolution_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Ministry] ADD  CONSTRAINT [DF_Ministry_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[NewsRelease] ADD  CONSTRAINT [DF_NewsRelease_Timestamp]  DEFAULT ('1900-01-01') FOR [Timestamp]
GO
ALTER TABLE [dbo].[NewsRelease] ADD  DEFAULT ('') FOR [RedirectUrl]
GO
ALTER TABLE [dbo].[Sector] ADD  CONSTRAINT [DF_Sector_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Sector] ADD  CONSTRAINT [DF_Sector_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[Tag] ADD  CONSTRAINT [DF_Tag_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Tag] ADD  CONSTRAINT [DF_Tag_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[Theme] ADD  CONSTRAINT [DF_Theme_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Theme] ADD  CONSTRAINT [DF_Theme_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_DisplayName]  DEFAULT ('') FOR [DisplayName]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_EmailAddress]  DEFAULT ('') FOR [EmailAddress]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [media].[Beat] ADD  CONSTRAINT [DF_Beat_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[Company] ADD  CONSTRAINT [DF_Company_IsOutlet]  DEFAULT ((0)) FOR [IsOutlet]
GO
ALTER TABLE [media].[Company] ADD  CONSTRAINT [DF_Company_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [media].[Contact] ADD  CONSTRAINT [DF_Contact_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [media].[ContactCity] ADD  CONSTRAINT [DF_City_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[ContactMediaJobTitle] ADD  CONSTRAINT [DF_ContactMediaJobTitle_ContactMediaJobTitleId]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [media].[Country] ADD  CONSTRAINT [DF_Country_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[Distribution] ADD  CONSTRAINT [DF_Distribution_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[ElectoralDistrict] ADD  CONSTRAINT [DF_ElectoralDistrict_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[Ethnicity] ADD  CONSTRAINT [DF_Ethnicity_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[MediaDesk] ADD  CONSTRAINT [DF_MediaDesk_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[MediaJobTitle] ADD  CONSTRAINT [DF_MediaJobTitle_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[MediaLanguage] ADD  CONSTRAINT [DF_Language_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[MediaRequest] ADD  CONSTRAINT [DF_MediaRequest_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [media].[MediaRequest] ADD  CONSTRAINT [DF_MediaRequest_Subject]  DEFAULT ('') FOR [RequestTopic]
GO
ALTER TABLE [media].[MediaRequest] ADD  CONSTRAINT [DF_MediaRequest_Content]  DEFAULT ('') FOR [RequestContent]
GO
ALTER TABLE [media].[MediaRequest] ADD  CONSTRAINT [DF_MediaRequest_Response]  DEFAULT ('') FOR [Response]
GO
ALTER TABLE [media].[MediaRequest] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [media].[MediaType] ADD  CONSTRAINT [DF_MediaType_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[MinisterialJobTitle] ADD  CONSTRAINT [DF_MinisterialJobTitle_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[NewsRegion] ADD  CONSTRAINT [DF_Region_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[PhoneType] ADD  CONSTRAINT [DF_PhoneType_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[PrintCategory] ADD  CONSTRAINT [DF_PrintCategory_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[ProvState] ADD  CONSTRAINT [DF_ProvState_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[PublicationDays] ADD  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[PublicationFrequency] ADD  CONSTRAINT [DF_PublicationFrequency_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[Report] ADD  CONSTRAINT [DF_Report_IsPublic]  DEFAULT ((0)) FOR [IsPublic]
GO
ALTER TABLE [media].[Report] ADD  CONSTRAINT [DF_Report_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[SpecialtyPublication] ADD  CONSTRAINT [DF_SpecialtyPublication_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [media].[WebAddressType] ADD  CONSTRAINT [DF_WebAddressType_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [calendar].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_City] FOREIGN KEY([CityId])
REFERENCES [calendar].[City] ([Id])
GO
ALTER TABLE [calendar].[Activity] CHECK CONSTRAINT [FK_Activity_City]
GO
ALTER TABLE [calendar].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_CommunicationContact] FOREIGN KEY([CommunicationContactId])
REFERENCES [calendar].[CommunicationContact] ([Id])
GO
ALTER TABLE [calendar].[Activity] CHECK CONSTRAINT [FK_Activity_CommunicationContact]
GO
ALTER TABLE [calendar].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_EventPlanner] FOREIGN KEY([EventPlannerId])
REFERENCES [calendar].[EventPlanner] ([Id])
GO
ALTER TABLE [calendar].[Activity] CHECK CONSTRAINT [FK_Activity_EventPlanner]
GO
ALTER TABLE [calendar].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_GovernmentRepresentative] FOREIGN KEY([GovernmentRepresentativeId])
REFERENCES [calendar].[GovernmentRepresentative] ([Id])
GO
ALTER TABLE [calendar].[Activity] CHECK CONSTRAINT [FK_Activity_GovernmentRepresentative]
GO
ALTER TABLE [calendar].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_HqStatus] FOREIGN KEY([HqStatusId])
REFERENCES [calendar].[Status] ([Id])
GO
ALTER TABLE [calendar].[Activity] CHECK CONSTRAINT [FK_Activity_HqStatus]
GO
ALTER TABLE [calendar].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Ministry] FOREIGN KEY([ContactMinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [calendar].[Activity] CHECK CONSTRAINT [FK_Activity_Ministry]
GO
ALTER TABLE [calendar].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_NRDistribution] FOREIGN KEY([NRDistributionId])
REFERENCES [calendar].[NRDistribution] ([Id])
GO
ALTER TABLE [calendar].[Activity] CHECK CONSTRAINT [FK_Activity_NRDistribution]
GO
ALTER TABLE [calendar].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_PremierRequested] FOREIGN KEY([PremierRequestedId])
REFERENCES [calendar].[PremierRequested] ([Id])
GO
ALTER TABLE [calendar].[Activity] CHECK CONSTRAINT [FK_Activity_PremierRequested]
GO
ALTER TABLE [calendar].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Status] FOREIGN KEY([StatusId])
REFERENCES [calendar].[Status] ([Id])
GO
ALTER TABLE [calendar].[Activity] CHECK CONSTRAINT [FK_Activity_Status]
GO
ALTER TABLE [calendar].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_SystemUser_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[Activity] CHECK CONSTRAINT [FK_Activity_SystemUser_CreatedBy]
GO
ALTER TABLE [calendar].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_SystemUser_UpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[Activity] CHECK CONSTRAINT [FK_Activity_SystemUser_UpdatedBy]
GO
ALTER TABLE [calendar].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Videographer] FOREIGN KEY([VideographerId])
REFERENCES [calendar].[Videographer] ([Id])
GO
ALTER TABLE [calendar].[Activity] CHECK CONSTRAINT [FK_Activity_Videographer]
GO
ALTER TABLE [calendar].[ActivityCategories]  WITH CHECK ADD  CONSTRAINT [FK_ActivityCategories_Activity] FOREIGN KEY([ActivityId])
REFERENCES [calendar].[Activity] ([Id])
GO
ALTER TABLE [calendar].[ActivityCategories] CHECK CONSTRAINT [FK_ActivityCategories_Activity]
GO
ALTER TABLE [calendar].[ActivityCategories]  WITH CHECK ADD  CONSTRAINT [FK_ActivityCategories_Category] FOREIGN KEY([CategoryId])
REFERENCES [calendar].[Category] ([Id])
GO
ALTER TABLE [calendar].[ActivityCategories] CHECK CONSTRAINT [FK_ActivityCategories_Category]
GO
ALTER TABLE [calendar].[ActivityCategories]  WITH CHECK ADD  CONSTRAINT [FK_ActivityCategories_SystemUser_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[ActivityCategories] CHECK CONSTRAINT [FK_ActivityCategories_SystemUser_CreatedBy]
GO
ALTER TABLE [calendar].[ActivityCategories]  WITH CHECK ADD  CONSTRAINT [FK_ActivityCategories_SystemUser_UpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[ActivityCategories] CHECK CONSTRAINT [FK_ActivityCategories_SystemUser_UpdatedBy]
GO
ALTER TABLE [calendar].[ActivityCommunicationMaterials]  WITH CHECK ADD  CONSTRAINT [FK_ActivityCommunicationMaterials_Activity] FOREIGN KEY([ActivityId])
REFERENCES [calendar].[Activity] ([Id])
GO
ALTER TABLE [calendar].[ActivityCommunicationMaterials] CHECK CONSTRAINT [FK_ActivityCommunicationMaterials_Activity]
GO
ALTER TABLE [calendar].[ActivityCommunicationMaterials]  WITH CHECK ADD  CONSTRAINT [FK_ActivityCommunicationMaterials_CommunicationMaterial] FOREIGN KEY([CommunicationMaterialId])
REFERENCES [calendar].[CommunicationMaterial] ([Id])
GO
ALTER TABLE [calendar].[ActivityCommunicationMaterials] CHECK CONSTRAINT [FK_ActivityCommunicationMaterials_CommunicationMaterial]
GO
ALTER TABLE [calendar].[ActivityCommunicationMaterials]  WITH CHECK ADD  CONSTRAINT [FK_ActivityCommunicationMaterials_SystemUser_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[ActivityCommunicationMaterials] CHECK CONSTRAINT [FK_ActivityCommunicationMaterials_SystemUser_CreatedBy]
GO
ALTER TABLE [calendar].[ActivityCommunicationMaterials]  WITH CHECK ADD  CONSTRAINT [FK_ActivityCommunicationMaterials_SystemUser_UpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[ActivityCommunicationMaterials] CHECK CONSTRAINT [FK_ActivityCommunicationMaterials_SystemUser_UpdatedBy]
GO
ALTER TABLE [calendar].[ActivityFiles]  WITH CHECK ADD  CONSTRAINT [FK_ActivityFiles_Activity] FOREIGN KEY([ActivityId])
REFERENCES [calendar].[Activity] ([Id])
GO
ALTER TABLE [calendar].[ActivityFiles] CHECK CONSTRAINT [FK_ActivityFiles_Activity]
GO
ALTER TABLE [calendar].[ActivityFilter]  WITH CHECK ADD  CONSTRAINT [FK_ActivityFilter_SystemUser_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[ActivityFilter] CHECK CONSTRAINT [FK_ActivityFilter_SystemUser_CreatedBy]
GO
ALTER TABLE [calendar].[ActivityFilter]  WITH CHECK ADD  CONSTRAINT [FK_ActivityFilter_SystemUser_UpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[ActivityFilter] CHECK CONSTRAINT [FK_ActivityFilter_SystemUser_UpdatedBy]
GO
ALTER TABLE [calendar].[ActivityInitiatives]  WITH CHECK ADD  CONSTRAINT [FK_ActivityInitiatives_Activity] FOREIGN KEY([ActivityId])
REFERENCES [calendar].[Activity] ([Id])
GO
ALTER TABLE [calendar].[ActivityInitiatives] CHECK CONSTRAINT [FK_ActivityInitiatives_Activity]
GO
ALTER TABLE [calendar].[ActivityInitiatives]  WITH CHECK ADD  CONSTRAINT [FK_ActivityInitiatives_Initiative] FOREIGN KEY([InitiativeId])
REFERENCES [calendar].[Initiative] ([Id])
GO
ALTER TABLE [calendar].[ActivityInitiatives] CHECK CONSTRAINT [FK_ActivityInitiatives_Initiative]
GO
ALTER TABLE [calendar].[ActivityInitiatives]  WITH CHECK ADD  CONSTRAINT [FK_ActivityInitiatives_SystemUser_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[ActivityInitiatives] CHECK CONSTRAINT [FK_ActivityInitiatives_SystemUser_CreatedBy]
GO
ALTER TABLE [calendar].[ActivityInitiatives]  WITH CHECK ADD  CONSTRAINT [FK_ActivityInitiatives_SystemUser_UpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[ActivityInitiatives] CHECK CONSTRAINT [FK_ActivityInitiatives_SystemUser_UpdatedBy]
GO
ALTER TABLE [calendar].[ActivityKeywords]  WITH CHECK ADD  CONSTRAINT [FK_ActivityKeywords_Activity] FOREIGN KEY([ActivityId])
REFERENCES [calendar].[Activity] ([Id])
GO
ALTER TABLE [calendar].[ActivityKeywords] CHECK CONSTRAINT [FK_ActivityKeywords_Activity]
GO
ALTER TABLE [calendar].[ActivityKeywords]  WITH NOCHECK ADD  CONSTRAINT [FK_ActivityKeywords_Keyword] FOREIGN KEY([KeywordId])
REFERENCES [calendar].[Keyword] ([Id])
GO
ALTER TABLE [calendar].[ActivityKeywords] CHECK CONSTRAINT [FK_ActivityKeywords_Keyword]
GO
ALTER TABLE [calendar].[ActivityNROrigins]  WITH CHECK ADD  CONSTRAINT [FK_ActivityNROrigins_Activity] FOREIGN KEY([ActivityId])
REFERENCES [calendar].[Activity] ([Id])
GO
ALTER TABLE [calendar].[ActivityNROrigins] CHECK CONSTRAINT [FK_ActivityNROrigins_Activity]
GO
ALTER TABLE [calendar].[ActivityNROrigins]  WITH CHECK ADD  CONSTRAINT [FK_ActivityNROrigins_NROrigin] FOREIGN KEY([NROriginId])
REFERENCES [calendar].[NROrigin] ([Id])
GO
ALTER TABLE [calendar].[ActivityNROrigins] CHECK CONSTRAINT [FK_ActivityNROrigins_NROrigin]
GO
ALTER TABLE [calendar].[ActivityNROrigins]  WITH CHECK ADD  CONSTRAINT [FK_ActivityNROrigins_SystemUser_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[ActivityNROrigins] CHECK CONSTRAINT [FK_ActivityNROrigins_SystemUser_CreatedBy]
GO
ALTER TABLE [calendar].[ActivityNROrigins]  WITH CHECK ADD  CONSTRAINT [FK_ActivityNROrigins_SystemUser_UpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[ActivityNROrigins] CHECK CONSTRAINT [FK_ActivityNROrigins_SystemUser_UpdatedBy]
GO
ALTER TABLE [calendar].[ActivitySectors]  WITH CHECK ADD  CONSTRAINT [FK_ActivitySectors_Activity] FOREIGN KEY([ActivityId])
REFERENCES [calendar].[Activity] ([Id])
GO
ALTER TABLE [calendar].[ActivitySectors] CHECK CONSTRAINT [FK_ActivitySectors_Activity]
GO
ALTER TABLE [calendar].[ActivitySectors]  WITH CHECK ADD  CONSTRAINT [FK_ActivitySectors_Sector] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([Id])
GO
ALTER TABLE [calendar].[ActivitySectors] CHECK CONSTRAINT [FK_ActivitySectors_Sector]
GO
ALTER TABLE [calendar].[ActivitySectors]  WITH CHECK ADD  CONSTRAINT [FK_ActivitySectors_SystemUser_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[ActivitySectors] CHECK CONSTRAINT [FK_ActivitySectors_SystemUser_CreatedBy]
GO
ALTER TABLE [calendar].[ActivitySectors]  WITH CHECK ADD  CONSTRAINT [FK_ActivitySectors_SystemUser_UpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[ActivitySectors] CHECK CONSTRAINT [FK_ActivitySectors_SystemUser_UpdatedBy]
GO
ALTER TABLE [calendar].[ActivityServices]  WITH CHECK ADD  CONSTRAINT [FK_ActivityServices_Activity] FOREIGN KEY([ActivityId])
REFERENCES [calendar].[Activity] ([Id])
GO
ALTER TABLE [calendar].[ActivityServices] CHECK CONSTRAINT [FK_ActivityServices_Activity]
GO
ALTER TABLE [calendar].[ActivityServices]  WITH CHECK ADD  CONSTRAINT [FK_ActivityServices_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [calendar].[ActivityServices] CHECK CONSTRAINT [FK_ActivityServices_Service]
GO
ALTER TABLE [calendar].[ActivitySharedWith]  WITH CHECK ADD  CONSTRAINT [FK_ActivitySharedWith_Activity] FOREIGN KEY([ActivityId])
REFERENCES [calendar].[Activity] ([Id])
GO
ALTER TABLE [calendar].[ActivitySharedWith] CHECK CONSTRAINT [FK_ActivitySharedWith_Activity]
GO
ALTER TABLE [calendar].[ActivitySharedWith]  WITH CHECK ADD  CONSTRAINT [FK_ActivitySharedWith_Ministry] FOREIGN KEY([MinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [calendar].[ActivitySharedWith] CHECK CONSTRAINT [FK_ActivitySharedWith_Ministry]
GO
ALTER TABLE [calendar].[ActivitySharedWith]  WITH CHECK ADD  CONSTRAINT [FK_ActivitySharedWith_SystemUser_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[ActivitySharedWith] CHECK CONSTRAINT [FK_ActivitySharedWith_SystemUser_CreatedBy]
GO
ALTER TABLE [calendar].[ActivitySharedWith]  WITH CHECK ADD  CONSTRAINT [FK_ActivitySharedWith_SystemUser_UpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[ActivitySharedWith] CHECK CONSTRAINT [FK_ActivitySharedWith_SystemUser_UpdatedBy]
GO
ALTER TABLE [calendar].[ActivityThemes]  WITH CHECK ADD  CONSTRAINT [FK_ActivityThemes_Activity] FOREIGN KEY([ActivityId])
REFERENCES [calendar].[Activity] ([Id])
GO
ALTER TABLE [calendar].[ActivityThemes] CHECK CONSTRAINT [FK_ActivityThemes_Activity]
GO
ALTER TABLE [calendar].[ActivityThemes]  WITH CHECK ADD  CONSTRAINT [FK_ActivityThemes_Theme] FOREIGN KEY([ThemeId])
REFERENCES [dbo].[Theme] ([Id])
GO
ALTER TABLE [calendar].[ActivityThemes] CHECK CONSTRAINT [FK_ActivityThemes_Theme]
GO
ALTER TABLE [calendar].[CommunicationContact]  WITH CHECK ADD  CONSTRAINT [FK_CommunicationContact_Ministry] FOREIGN KEY([MinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [calendar].[CommunicationContact] CHECK CONSTRAINT [FK_CommunicationContact_Ministry]
GO
ALTER TABLE [calendar].[CommunicationContact]  WITH CHECK ADD  CONSTRAINT [FK_CommunicationContact_SystemUser_SystemUser] FOREIGN KEY([SystemUserId])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[CommunicationContact] CHECK CONSTRAINT [FK_CommunicationContact_SystemUser_SystemUser]
GO
ALTER TABLE [calendar].[FavoriteActivity]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteActivity_Activity] FOREIGN KEY([ActivityId])
REFERENCES [calendar].[Activity] ([Id])
GO
ALTER TABLE [calendar].[FavoriteActivity] CHECK CONSTRAINT [FK_FavoriteActivity_Activity]
GO
ALTER TABLE [calendar].[FavoriteActivity]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteActivity_SystemUser] FOREIGN KEY([SystemUserId])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[FavoriteActivity] CHECK CONSTRAINT [FK_FavoriteActivity_SystemUser]
GO
ALTER TABLE [calendar].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_Activity] FOREIGN KEY([ActivityId])
REFERENCES [calendar].[Activity] ([Id])
GO
ALTER TABLE [calendar].[Log] CHECK CONSTRAINT [FK_Log_Activity]
GO
ALTER TABLE [calendar].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_SystemUser_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[Log] CHECK CONSTRAINT [FK_Log_SystemUser_CreatedBy]
GO
ALTER TABLE [calendar].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_SystemUser_UpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[Log] CHECK CONSTRAINT [FK_Log_SystemUser_UpdatedBy]
GO
ALTER TABLE [calendar].[NewsFeed]  WITH CHECK ADD  CONSTRAINT [FK_NewsFeed_Activity] FOREIGN KEY([ActivityId])
REFERENCES [calendar].[Activity] ([Id])
GO
ALTER TABLE [calendar].[NewsFeed] CHECK CONSTRAINT [FK_NewsFeed_Activity]
GO
ALTER TABLE [calendar].[NewsFeed]  WITH CHECK ADD  CONSTRAINT [FK_NewsFeed_Ministry] FOREIGN KEY([MinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [calendar].[NewsFeed] CHECK CONSTRAINT [FK_NewsFeed_Ministry]
GO
ALTER TABLE [calendar].[NewsFeed]  WITH CHECK ADD  CONSTRAINT [FK_NewsFeed_SystemUser_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[NewsFeed] CHECK CONSTRAINT [FK_NewsFeed_SystemUser_CreatedBy]
GO
ALTER TABLE [calendar].[NewsFeed]  WITH CHECK ADD  CONSTRAINT [FK_NewsFeed_SystemUser_UpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[NewsFeed] CHECK CONSTRAINT [FK_NewsFeed_SystemUser_UpdatedBy]
GO
ALTER TABLE [calendar].[SystemUser]  WITH CHECK ADD  CONSTRAINT [FK_SystemUser_SystemUser_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[SystemUser] CHECK CONSTRAINT [FK_SystemUser_SystemUser_CreatedBy]
GO
ALTER TABLE [calendar].[SystemUser]  WITH CHECK ADD  CONSTRAINT [FK_SystemUser_SystemUser_Role] FOREIGN KEY([RoleId])
REFERENCES [calendar].[Role] ([Id])
GO
ALTER TABLE [calendar].[SystemUser] CHECK CONSTRAINT [FK_SystemUser_SystemUser_Role]
GO
ALTER TABLE [calendar].[SystemUser]  WITH CHECK ADD  CONSTRAINT [FK_SystemUser_SystemUser_UpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[SystemUser] CHECK CONSTRAINT [FK_SystemUser_SystemUser_UpdatedBy]
GO
ALTER TABLE [calendar].[SystemUserMinistry]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserMinistry_Ministry] FOREIGN KEY([MinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [calendar].[SystemUserMinistry] CHECK CONSTRAINT [FK_SystemUserMinistry_Ministry]
GO
ALTER TABLE [calendar].[SystemUserMinistry]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserMinistry_SystemUser_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[SystemUserMinistry] CHECK CONSTRAINT [FK_SystemUserMinistry_SystemUser_CreatedBy]
GO
ALTER TABLE [calendar].[SystemUserMinistry]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserMinistry_SystemUser_UpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[SystemUserMinistry] CHECK CONSTRAINT [FK_SystemUserMinistry_SystemUser_UpdatedBy]
GO
ALTER TABLE [calendar].[SystemUserMinistry]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserMinistry_SystemUserId] FOREIGN KEY([SystemUserId])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [calendar].[SystemUserMinistry] CHECK CONSTRAINT [FK_SystemUserMinistry_SystemUserId]
GO
ALTER TABLE [dbo].[CarouselSlide]  WITH CHECK ADD  CONSTRAINT [FK_CarouselSlide_Carousel] FOREIGN KEY([CarouselId])
REFERENCES [dbo].[Carousel] ([Id])
GO
ALTER TABLE [dbo].[CarouselSlide] CHECK CONSTRAINT [FK_CarouselSlide_Carousel]
GO
ALTER TABLE [dbo].[CarouselSlide]  WITH CHECK ADD  CONSTRAINT [FK_CarouselSlide_Slide] FOREIGN KEY([SlideId])
REFERENCES [dbo].[Slide] ([Id])
GO
ALTER TABLE [dbo].[CarouselSlide] CHECK CONSTRAINT [FK_CarouselSlide_Slide]
GO
ALTER TABLE [dbo].[Ministry]  WITH CHECK ADD  CONSTRAINT [FK_Ministry_ContactSystemUser] FOREIGN KEY([ContactUserId])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [dbo].[Ministry] CHECK CONSTRAINT [FK_Ministry_ContactSystemUser]
GO
ALTER TABLE [dbo].[Ministry]  WITH CHECK ADD  CONSTRAINT [FK_Ministry_EodLastRunSystemUser] FOREIGN KEY([EodLastRunUserId])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [dbo].[Ministry] CHECK CONSTRAINT [FK_Ministry_EodLastRunSystemUser]
GO
ALTER TABLE [dbo].[Ministry]  WITH CHECK ADD  CONSTRAINT [FK_Ministry_FeatureRelease] FOREIGN KEY([FeatureReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
GO
ALTER TABLE [dbo].[Ministry] CHECK CONSTRAINT [FK_Ministry_FeatureRelease]
GO
ALTER TABLE [dbo].[Ministry]  WITH CHECK ADD  CONSTRAINT [FK_Ministry_Parent] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [dbo].[Ministry] CHECK CONSTRAINT [FK_Ministry_Parent]
GO
ALTER TABLE [dbo].[Ministry]  WITH CHECK ADD  CONSTRAINT [FK_Ministry_SecondContactSystemUser] FOREIGN KEY([SecondContactUserId])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [dbo].[Ministry] CHECK CONSTRAINT [FK_Ministry_SecondContactSystemUser]
GO
ALTER TABLE [dbo].[Ministry]  WITH CHECK ADD  CONSTRAINT [FK_Ministry_TopRelease] FOREIGN KEY([TopReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
GO
ALTER TABLE [dbo].[Ministry] CHECK CONSTRAINT [FK_Ministry_TopRelease]
GO
ALTER TABLE [dbo].[MinistryLanguage]  WITH CHECK ADD  CONSTRAINT [FK_MinistryLanguage_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[MinistryLanguage] CHECK CONSTRAINT [FK_MinistryLanguage_Language]
GO
ALTER TABLE [dbo].[MinistryLanguage]  WITH CHECK ADD  CONSTRAINT [FK_MinistryLanguage_Ministry] FOREIGN KEY([MinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [dbo].[MinistryLanguage] CHECK CONSTRAINT [FK_MinistryLanguage_Ministry]
GO
ALTER TABLE [dbo].[MinistryNewsletter]  WITH CHECK ADD  CONSTRAINT [FK_MinistryNewsletter_Ministry] FOREIGN KEY([MinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [dbo].[MinistryNewsletter] CHECK CONSTRAINT [FK_MinistryNewsletter_Ministry]
GO
ALTER TABLE [dbo].[MinistrySector]  WITH CHECK ADD  CONSTRAINT [FK_MinistrySector_Ministry] FOREIGN KEY([MinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [dbo].[MinistrySector] CHECK CONSTRAINT [FK_MinistrySector_Ministry]
GO
ALTER TABLE [dbo].[MinistrySector]  WITH CHECK ADD  CONSTRAINT [FK_MinistrySector_Sector] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([Id])
GO
ALTER TABLE [dbo].[MinistrySector] CHECK CONSTRAINT [FK_MinistrySector_Sector]
GO
ALTER TABLE [dbo].[MinistryService]  WITH CHECK ADD  CONSTRAINT [FK_MinistryService_Ministry] FOREIGN KEY([MinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [dbo].[MinistryService] CHECK CONSTRAINT [FK_MinistryService_Ministry]
GO
ALTER TABLE [dbo].[MinistryTopic]  WITH CHECK ADD  CONSTRAINT [FK_MinistryTopic_Ministry] FOREIGN KEY([MinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [dbo].[MinistryTopic] CHECK CONSTRAINT [FK_MinistryTopic_Ministry]
GO
ALTER TABLE [dbo].[NewsRelease]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelease_Ministry] FOREIGN KEY([MinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [dbo].[NewsRelease] CHECK CONSTRAINT [FK_NewsRelease_Ministry]
GO
ALTER TABLE [dbo].[NewsRelease]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelease_NewsCollection] FOREIGN KEY([CollectionId])
REFERENCES [dbo].[NewsReleaseCollection] ([Id])
GO
ALTER TABLE [dbo].[NewsRelease] CHECK CONSTRAINT [FK_NewsRelease_NewsCollection]
GO
ALTER TABLE [dbo].[NewsReleaseDocument]  WITH CHECK ADD  CONSTRAINT [FK_Document_Release] FOREIGN KEY([ReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsReleaseDocument] CHECK CONSTRAINT [FK_Document_Release]
GO
ALTER TABLE [dbo].[NewsReleaseDocumentContact]  WITH CHECK ADD  CONSTRAINT [FK_DocumentLanguageContact_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[NewsReleaseDocument] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseDocumentContact] CHECK CONSTRAINT [FK_DocumentLanguageContact_Document]
GO
ALTER TABLE [dbo].[NewsReleaseDocumentContact]  WITH CHECK ADD  CONSTRAINT [FK_DocumentLanguageContact_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseDocumentContact] CHECK CONSTRAINT [FK_DocumentLanguageContact_Language]
GO
ALTER TABLE [dbo].[NewsReleaseDocumentContact]  WITH CHECK ADD  CONSTRAINT [FK_NewsDocumentLanguageContact_NewsDocumentLanguage] FOREIGN KEY([DocumentId], [LanguageId])
REFERENCES [dbo].[NewsReleaseDocumentLanguage] ([DocumentId], [LanguageId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsReleaseDocumentContact] CHECK CONSTRAINT [FK_NewsDocumentLanguageContact_NewsDocumentLanguage]
GO
ALTER TABLE [dbo].[NewsReleaseDocumentLanguage]  WITH CHECK ADD  CONSTRAINT [FK_DocumentLanguage_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[NewsReleaseDocument] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsReleaseDocumentLanguage] CHECK CONSTRAINT [FK_DocumentLanguage_Document]
GO
ALTER TABLE [dbo].[NewsReleaseDocumentLanguage]  WITH CHECK ADD  CONSTRAINT [FK_DocumentLanguage_Image] FOREIGN KEY([PageImageId], [LanguageId])
REFERENCES [dbo].[NewsReleaseImageLanguage] ([ImageId], [LanguageId])
GO
ALTER TABLE [dbo].[NewsReleaseDocumentLanguage] CHECK CONSTRAINT [FK_DocumentLanguage_Image]
GO
ALTER TABLE [dbo].[NewsReleaseDocumentLanguage]  WITH CHECK ADD  CONSTRAINT [FK_DocumentLanguage_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseDocumentLanguage] CHECK CONSTRAINT [FK_DocumentLanguage_Language]
GO
ALTER TABLE [dbo].[NewsReleaseHistory]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseHistory_Blob] FOREIGN KEY([BlobId])
REFERENCES [dbo].[Blob] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseHistory] CHECK CONSTRAINT [FK_NewsReleaseHistory_Blob]
GO
ALTER TABLE [dbo].[NewsReleaseHistory]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseHistory_NewsRelease] FOREIGN KEY([ReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsReleaseHistory] CHECK CONSTRAINT [FK_NewsReleaseHistory_NewsRelease]
GO
ALTER TABLE [dbo].[NewsReleaseImage]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseImage_Blob] FOREIGN KEY([BlobId])
REFERENCES [dbo].[Blob] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseImage] CHECK CONSTRAINT [FK_NewsReleaseImage_Blob]
GO
ALTER TABLE [dbo].[NewsReleaseImageLanguage]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseImageLanguage_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseImageLanguage] CHECK CONSTRAINT [FK_NewsReleaseImageLanguage_Language]
GO
ALTER TABLE [dbo].[NewsReleaseImageLanguage]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseImageLanguage_NewsReleaseImage] FOREIGN KEY([ImageId])
REFERENCES [dbo].[NewsReleaseImage] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseImageLanguage] CHECK CONSTRAINT [FK_NewsReleaseImageLanguage_NewsReleaseImage]
GO
ALTER TABLE [dbo].[NewsReleaseLanguage]  WITH CHECK ADD  CONSTRAINT [FK_ReleaseLanguage_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseLanguage] CHECK CONSTRAINT [FK_ReleaseLanguage_Language]
GO
ALTER TABLE [dbo].[NewsReleaseLanguage]  WITH CHECK ADD  CONSTRAINT [FK_ReleaseLanguage_Release] FOREIGN KEY([ReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsReleaseLanguage] CHECK CONSTRAINT [FK_ReleaseLanguage_Release]
GO
ALTER TABLE [dbo].[NewsReleaseLog]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseLog_NewsRelease] FOREIGN KEY([ReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsReleaseLog] CHECK CONSTRAINT [FK_NewsReleaseLog_NewsRelease]
GO
ALTER TABLE [dbo].[NewsReleaseLog]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseLog_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseLog] CHECK CONSTRAINT [FK_NewsReleaseLog_User]
GO
ALTER TABLE [dbo].[NewsReleaseMediaDistribution]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseMediaDistribution_List] FOREIGN KEY([MediaDistributionListId])
REFERENCES [dbo].[MediaDistributionList] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseMediaDistribution] CHECK CONSTRAINT [FK_NewsReleaseMediaDistribution_List]
GO
ALTER TABLE [dbo].[NewsReleaseMediaDistribution]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseMediaDistribution_NewsRelease] FOREIGN KEY([ReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsReleaseMediaDistribution] CHECK CONSTRAINT [FK_NewsReleaseMediaDistribution_NewsRelease]
GO
ALTER TABLE [dbo].[NewsReleaseMinistry]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseMinistry_Ministry] FOREIGN KEY([MinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseMinistry] CHECK CONSTRAINT [FK_NewsReleaseMinistry_Ministry]
GO
ALTER TABLE [dbo].[NewsReleaseMinistry]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseMinistry_NewsRelease] FOREIGN KEY([ReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsReleaseMinistry] CHECK CONSTRAINT [FK_NewsReleaseMinistry_NewsRelease]
GO
ALTER TABLE [dbo].[NewsReleaseSector]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseSector_NewsRelease] FOREIGN KEY([ReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsReleaseSector] CHECK CONSTRAINT [FK_NewsReleaseSector_NewsRelease]
GO
ALTER TABLE [dbo].[NewsReleaseSector]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseSector_Sector] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseSector] CHECK CONSTRAINT [FK_NewsReleaseSector_Sector]
GO
ALTER TABLE [dbo].[NewsReleaseService]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseService_NewsRelease] FOREIGN KEY([ReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsReleaseService] CHECK CONSTRAINT [FK_NewsReleaseService_NewsRelease]
GO
ALTER TABLE [dbo].[NewsReleaseService]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseService_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseService] CHECK CONSTRAINT [FK_NewsReleaseService_Service]
GO
ALTER TABLE [dbo].[NewsReleaseTag]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseTag_NewsRelease] FOREIGN KEY([ReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsReleaseTag] CHECK CONSTRAINT [FK_NewsReleaseTag_NewsRelease]
GO
ALTER TABLE [dbo].[NewsReleaseTag]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseTag_Tag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseTag] CHECK CONSTRAINT [FK_NewsReleaseTag_Tag]
GO
ALTER TABLE [dbo].[NewsReleaseTheme]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseTheme_NewsRelease] FOREIGN KEY([ReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsReleaseTheme] CHECK CONSTRAINT [FK_NewsReleaseTheme_NewsRelease]
GO
ALTER TABLE [dbo].[NewsReleaseTheme]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseTheme_Theme] FOREIGN KEY([ThemeId])
REFERENCES [dbo].[Theme] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseTheme] CHECK CONSTRAINT [FK_NewsReleaseTheme_Theme]
GO
ALTER TABLE [dbo].[NewsReleaseType]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseType_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseType] CHECK CONSTRAINT [FK_NewsReleaseType_Language]
GO
ALTER TABLE [dbo].[NewsReleaseType]  WITH CHECK ADD  CONSTRAINT [FK_NewsReleaseType_NewsReleaseImage] FOREIGN KEY([PageImageId])
REFERENCES [dbo].[NewsReleaseImage] ([Id])
GO
ALTER TABLE [dbo].[NewsReleaseType] CHECK CONSTRAINT [FK_NewsReleaseType_NewsReleaseImage]
GO
ALTER TABLE [dbo].[Sector]  WITH CHECK ADD  CONSTRAINT [FK_Sector_FeatureRelease] FOREIGN KEY([FeatureReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
GO
ALTER TABLE [dbo].[Sector] CHECK CONSTRAINT [FK_Sector_FeatureRelease]
GO
ALTER TABLE [dbo].[Sector]  WITH CHECK ADD  CONSTRAINT [FK_Sector_TopRelease] FOREIGN KEY([TopReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
GO
ALTER TABLE [dbo].[Sector] CHECK CONSTRAINT [FK_Sector_TopRelease]
GO
ALTER TABLE [dbo].[SectorLanguage]  WITH CHECK ADD  CONSTRAINT [FK_SectorLanguage_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[SectorLanguage] CHECK CONSTRAINT [FK_SectorLanguage_Language]
GO
ALTER TABLE [dbo].[SectorLanguage]  WITH CHECK ADD  CONSTRAINT [FK_SectorLanguage_Sector] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([Id])
GO
ALTER TABLE [dbo].[SectorLanguage] CHECK CONSTRAINT [FK_SectorLanguage_Sector]
GO
ALTER TABLE [dbo].[Theme]  WITH CHECK ADD  CONSTRAINT [FK_Theme_FeatureRelease] FOREIGN KEY([FeatureReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
GO
ALTER TABLE [dbo].[Theme] CHECK CONSTRAINT [FK_Theme_FeatureRelease]
GO
ALTER TABLE [dbo].[Theme]  WITH CHECK ADD  CONSTRAINT [FK_Theme_TopRelease] FOREIGN KEY([TopReleaseId])
REFERENCES [dbo].[NewsRelease] ([Id])
GO
ALTER TABLE [dbo].[Theme] CHECK CONSTRAINT [FK_Theme_TopRelease]
GO
ALTER TABLE [media].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Company] FOREIGN KEY([ParentCompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[Company] CHECK CONSTRAINT [FK_Company_Company]
GO
ALTER TABLE [media].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_PrintCategory] FOREIGN KEY([PrintCategoryId])
REFERENCES [media].[PrintCategory] ([Id])
GO
ALTER TABLE [media].[Company] CHECK CONSTRAINT [FK_Company_PrintCategory]
GO
ALTER TABLE [media].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_PublicationFrequency] FOREIGN KEY([PublicationFrequencyId])
REFERENCES [media].[PublicationFrequency] ([Id])
GO
ALTER TABLE [media].[Company] CHECK CONSTRAINT [FK_Company_PublicationFrequency]
GO
ALTER TABLE [media].[CompanyAddress]  WITH CHECK ADD  CONSTRAINT [FK_Address_City] FOREIGN KEY([CityId])
REFERENCES [media].[ContactCity] ([Id])
GO
ALTER TABLE [media].[CompanyAddress] CHECK CONSTRAINT [FK_Address_City]
GO
ALTER TABLE [media].[CompanyAddress]  WITH CHECK ADD  CONSTRAINT [FK_Address_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[CompanyAddress] CHECK CONSTRAINT [FK_Address_Company]
GO
ALTER TABLE [media].[CompanyAddress]  WITH CHECK ADD  CONSTRAINT [FK_Address_Country] FOREIGN KEY([CountryId])
REFERENCES [media].[Country] ([Id])
GO
ALTER TABLE [media].[CompanyAddress] CHECK CONSTRAINT [FK_Address_Country]
GO
ALTER TABLE [media].[CompanyAddress]  WITH CHECK ADD  CONSTRAINT [FK_Address_ProvState] FOREIGN KEY([ProvStateId])
REFERENCES [media].[ProvState] ([Id])
GO
ALTER TABLE [media].[CompanyAddress] CHECK CONSTRAINT [FK_Address_ProvState]
GO
ALTER TABLE [media].[CompanyDistribution]  WITH CHECK ADD  CONSTRAINT [FK_CompanyDistribution_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[CompanyDistribution] CHECK CONSTRAINT [FK_CompanyDistribution_Company]
GO
ALTER TABLE [media].[CompanyDistribution]  WITH CHECK ADD  CONSTRAINT [FK_CompanyDistribution_Distribution] FOREIGN KEY([DistributionId])
REFERENCES [media].[Distribution] ([Id])
GO
ALTER TABLE [media].[CompanyDistribution] CHECK CONSTRAINT [FK_CompanyDistribution_Distribution]
GO
ALTER TABLE [media].[CompanyElectoralDistrict]  WITH CHECK ADD  CONSTRAINT [FK_CompanyElectoralDistrict_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[CompanyElectoralDistrict] CHECK CONSTRAINT [FK_CompanyElectoralDistrict_Company]
GO
ALTER TABLE [media].[CompanyElectoralDistrict]  WITH CHECK ADD  CONSTRAINT [FK_CompanyElectoralDistrict_ElectoralDistrict] FOREIGN KEY([DistrictId])
REFERENCES [media].[ElectoralDistrict] ([Id])
GO
ALTER TABLE [media].[CompanyElectoralDistrict] CHECK CONSTRAINT [FK_CompanyElectoralDistrict_ElectoralDistrict]
GO
ALTER TABLE [media].[CompanyEthnicity]  WITH CHECK ADD  CONSTRAINT [FK_CompanyEthnicity_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[CompanyEthnicity] CHECK CONSTRAINT [FK_CompanyEthnicity_Company]
GO
ALTER TABLE [media].[CompanyEthnicity]  WITH CHECK ADD  CONSTRAINT [FK_CompanyEthnicity_Ethnicity] FOREIGN KEY([EthnicityId])
REFERENCES [media].[Ethnicity] ([Id])
GO
ALTER TABLE [media].[CompanyEthnicity] CHECK CONSTRAINT [FK_CompanyEthnicity_Ethnicity]
GO
ALTER TABLE [media].[CompanyLanguage]  WITH CHECK ADD  CONSTRAINT [FK_CompanyLanguage_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[CompanyLanguage] CHECK CONSTRAINT [FK_CompanyLanguage_Company]
GO
ALTER TABLE [media].[CompanyLanguage]  WITH CHECK ADD  CONSTRAINT [FK_CompanyLanguage_Language] FOREIGN KEY([LanguageId])
REFERENCES [media].[MediaLanguage] ([Id])
GO
ALTER TABLE [media].[CompanyLanguage] CHECK CONSTRAINT [FK_CompanyLanguage_Language]
GO
ALTER TABLE [media].[CompanyMediaDesk]  WITH CHECK ADD  CONSTRAINT [FK_CompanyMediaDesk_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[CompanyMediaDesk] CHECK CONSTRAINT [FK_CompanyMediaDesk_Company]
GO
ALTER TABLE [media].[CompanyMediaDesk]  WITH CHECK ADD  CONSTRAINT [FK_CompanyMediaDesk_MediaDesk] FOREIGN KEY([MediaDeskId])
REFERENCES [media].[MediaDesk] ([Id])
GO
ALTER TABLE [media].[CompanyMediaDesk] CHECK CONSTRAINT [FK_CompanyMediaDesk_MediaDesk]
GO
ALTER TABLE [media].[CompanyMediaPartner]  WITH CHECK ADD  CONSTRAINT [FK_CompanyMediaPartner_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[CompanyMediaPartner] CHECK CONSTRAINT [FK_CompanyMediaPartner_Company]
GO
ALTER TABLE [media].[CompanyMediaPartner]  WITH CHECK ADD  CONSTRAINT [FK_CompanyMediaPartner_MediaPartner] FOREIGN KEY([MediaPartnerId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[CompanyMediaPartner] CHECK CONSTRAINT [FK_CompanyMediaPartner_MediaPartner]
GO
ALTER TABLE [media].[CompanyMediaType]  WITH CHECK ADD  CONSTRAINT [FK_CompanyMediaType_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[CompanyMediaType] CHECK CONSTRAINT [FK_CompanyMediaType_Company]
GO
ALTER TABLE [media].[CompanyMediaType]  WITH CHECK ADD  CONSTRAINT [FK_CompanyMediaType_MediaType] FOREIGN KEY([MediaTypeId])
REFERENCES [media].[MediaType] ([Id])
GO
ALTER TABLE [media].[CompanyMediaType] CHECK CONSTRAINT [FK_CompanyMediaType_MediaType]
GO
ALTER TABLE [media].[CompanyPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_CompanyPhoneNumber_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[CompanyPhoneNumber] CHECK CONSTRAINT [FK_CompanyPhoneNumber_Company]
GO
ALTER TABLE [media].[CompanyPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_CompanyPhoneNumber_PhoneType] FOREIGN KEY([PhoneTypeId])
REFERENCES [media].[PhoneType] ([Id])
GO
ALTER TABLE [media].[CompanyPhoneNumber] CHECK CONSTRAINT [FK_CompanyPhoneNumber_PhoneType]
GO
ALTER TABLE [media].[CompanyPublicationDays]  WITH CHECK ADD  CONSTRAINT [FK_CompanyPublicationDays_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[CompanyPublicationDays] CHECK CONSTRAINT [FK_CompanyPublicationDays_Company]
GO
ALTER TABLE [media].[CompanyPublicationDays]  WITH CHECK ADD  CONSTRAINT [FK_CompanyPublicationDays_PublicationDays] FOREIGN KEY([PublicationDaysId])
REFERENCES [media].[PublicationDays] ([Id])
GO
ALTER TABLE [media].[CompanyPublicationDays] CHECK CONSTRAINT [FK_CompanyPublicationDays_PublicationDays]
GO
ALTER TABLE [media].[CompanyRegion]  WITH CHECK ADD  CONSTRAINT [FK_CompanyRegion_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[CompanyRegion] CHECK CONSTRAINT [FK_CompanyRegion_Company]
GO
ALTER TABLE [media].[CompanyRegion]  WITH CHECK ADD  CONSTRAINT [FK_CompanyRegion_Region] FOREIGN KEY([RegionId])
REFERENCES [media].[NewsRegion] ([Id])
GO
ALTER TABLE [media].[CompanyRegion] CHECK CONSTRAINT [FK_CompanyRegion_Region]
GO
ALTER TABLE [media].[CompanySector]  WITH CHECK ADD  CONSTRAINT [FK_CompanySector_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[CompanySector] CHECK CONSTRAINT [FK_CompanySector_Company]
GO
ALTER TABLE [media].[CompanySector]  WITH CHECK ADD  CONSTRAINT [FK_CompanySector_Sector] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([Id])
GO
ALTER TABLE [media].[CompanySector] CHECK CONSTRAINT [FK_CompanySector_Sector]
GO
ALTER TABLE [media].[CompanySpecialtyPublication]  WITH CHECK ADD  CONSTRAINT [FK_CompanySpecialtyPublication_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[CompanySpecialtyPublication] CHECK CONSTRAINT [FK_CompanySpecialtyPublication_Company]
GO
ALTER TABLE [media].[CompanySpecialtyPublication]  WITH CHECK ADD  CONSTRAINT [FK_CompanySpecialtyPublication_SpecialtyPublication] FOREIGN KEY([SpecialtyPublicationId])
REFERENCES [media].[SpecialtyPublication] ([Id])
GO
ALTER TABLE [media].[CompanySpecialtyPublication] CHECK CONSTRAINT [FK_CompanySpecialtyPublication_SpecialtyPublication]
GO
ALTER TABLE [media].[CompanyWebAddress]  WITH CHECK ADD  CONSTRAINT [FK_CompanyWebAddress_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[CompanyWebAddress] CHECK CONSTRAINT [FK_CompanyWebAddress_Company]
GO
ALTER TABLE [media].[CompanyWebAddress]  WITH CHECK ADD  CONSTRAINT [FK_CompanyWebAddress_WebAddressType] FOREIGN KEY([WebAddressTypeId])
REFERENCES [media].[WebAddressType] ([Id])
GO
ALTER TABLE [media].[CompanyWebAddress] CHECK CONSTRAINT [FK_CompanyWebAddress_WebAddressType]
GO
ALTER TABLE [media].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_ElectoralDistrict] FOREIGN KEY([MLAAssignmentId])
REFERENCES [media].[ElectoralDistrict] ([Id])
GO
ALTER TABLE [media].[Contact] CHECK CONSTRAINT [FK_Contact_ElectoralDistrict]
GO
ALTER TABLE [media].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_MinisterialJobTitle] FOREIGN KEY([MinisterialJobTitleId])
REFERENCES [media].[MinisterialJobTitle] ([Id])
GO
ALTER TABLE [media].[Contact] CHECK CONSTRAINT [FK_Contact_MinisterialJobTitle]
GO
ALTER TABLE [media].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Ministry] FOREIGN KEY([MinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [media].[Contact] CHECK CONSTRAINT [FK_Contact_Ministry]
GO
ALTER TABLE [media].[ContactAddress]  WITH CHECK ADD  CONSTRAINT [FK_Address_Contact] FOREIGN KEY([ContactId])
REFERENCES [media].[Contact] ([Id])
GO
ALTER TABLE [media].[ContactAddress] CHECK CONSTRAINT [FK_Address_Contact]
GO
ALTER TABLE [media].[ContactAddress]  WITH CHECK ADD  CONSTRAINT [FK_ContactAddress_City] FOREIGN KEY([CityId])
REFERENCES [media].[ContactCity] ([Id])
GO
ALTER TABLE [media].[ContactAddress] CHECK CONSTRAINT [FK_ContactAddress_City]
GO
ALTER TABLE [media].[ContactAddress]  WITH CHECK ADD  CONSTRAINT [FK_ContactAddress_Country] FOREIGN KEY([CountryId])
REFERENCES [media].[Country] ([Id])
GO
ALTER TABLE [media].[ContactAddress] CHECK CONSTRAINT [FK_ContactAddress_Country]
GO
ALTER TABLE [media].[ContactAddress]  WITH CHECK ADD  CONSTRAINT [FK_ContactAddress_ProvState] FOREIGN KEY([ProvStateId])
REFERENCES [media].[ProvState] ([Id])
GO
ALTER TABLE [media].[ContactAddress] CHECK CONSTRAINT [FK_ContactAddress_ProvState]
GO
ALTER TABLE [media].[ContactBeat]  WITH CHECK ADD  CONSTRAINT [FK_ContactBeat_Beat] FOREIGN KEY([BeatId])
REFERENCES [media].[Beat] ([Id])
GO
ALTER TABLE [media].[ContactBeat] CHECK CONSTRAINT [FK_ContactBeat_Beat]
GO
ALTER TABLE [media].[ContactBeat]  WITH CHECK ADD  CONSTRAINT [FK_ContactBeat_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[ContactBeat] CHECK CONSTRAINT [FK_ContactBeat_Company]
GO
ALTER TABLE [media].[ContactBeat]  WITH CHECK ADD  CONSTRAINT [FK_ContactBeat_ContactBeat] FOREIGN KEY([ContactId])
REFERENCES [media].[Contact] ([Id])
GO
ALTER TABLE [media].[ContactBeat] CHECK CONSTRAINT [FK_ContactBeat_ContactBeat]
GO
ALTER TABLE [media].[ContactElectoralDistrict]  WITH CHECK ADD  CONSTRAINT [FK_ContactElectoralDistrict_Contact] FOREIGN KEY([ContactId])
REFERENCES [media].[Contact] ([Id])
GO
ALTER TABLE [media].[ContactElectoralDistrict] CHECK CONSTRAINT [FK_ContactElectoralDistrict_Contact]
GO
ALTER TABLE [media].[ContactElectoralDistrict]  WITH CHECK ADD  CONSTRAINT [FK_ContactElectoralDistrict_ElectoralDistrict] FOREIGN KEY([DistrictId])
REFERENCES [media].[ElectoralDistrict] ([Id])
GO
ALTER TABLE [media].[ContactElectoralDistrict] CHECK CONSTRAINT [FK_ContactElectoralDistrict_ElectoralDistrict]
GO
ALTER TABLE [media].[ContactMediaJobTitle]  WITH CHECK ADD  CONSTRAINT [FK_ContactMediaJobTitle_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[ContactMediaJobTitle] CHECK CONSTRAINT [FK_ContactMediaJobTitle_Company]
GO
ALTER TABLE [media].[ContactMediaJobTitle]  WITH CHECK ADD  CONSTRAINT [FK_ContactMediaJobTitle_Contact] FOREIGN KEY([ContactId])
REFERENCES [media].[Contact] ([Id])
GO
ALTER TABLE [media].[ContactMediaJobTitle] CHECK CONSTRAINT [FK_ContactMediaJobTitle_Contact]
GO
ALTER TABLE [media].[ContactMediaJobTitle]  WITH CHECK ADD  CONSTRAINT [FK_ContactMediaJobTitle_MediaJobTitle] FOREIGN KEY([MediaJobTitleId])
REFERENCES [media].[MediaJobTitle] ([Id])
GO
ALTER TABLE [media].[ContactMediaJobTitle] CHECK CONSTRAINT [FK_ContactMediaJobTitle_MediaJobTitle]
GO
ALTER TABLE [media].[ContactPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_ContactPhoneNumber_Contact] FOREIGN KEY([ContactId])
REFERENCES [media].[Contact] ([Id])
GO
ALTER TABLE [media].[ContactPhoneNumber] CHECK CONSTRAINT [FK_ContactPhoneNumber_Contact]
GO
ALTER TABLE [media].[ContactPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_ContactPhoneNumber_PhoneType] FOREIGN KEY([PhoneTypeId])
REFERENCES [media].[PhoneType] ([Id])
GO
ALTER TABLE [media].[ContactPhoneNumber] CHECK CONSTRAINT [FK_ContactPhoneNumber_PhoneType]
GO
ALTER TABLE [media].[ContactRegion]  WITH CHECK ADD  CONSTRAINT [FK_ContactRegion_Contact] FOREIGN KEY([ContactId])
REFERENCES [media].[Contact] ([Id])
GO
ALTER TABLE [media].[ContactRegion] CHECK CONSTRAINT [FK_ContactRegion_Contact]
GO
ALTER TABLE [media].[ContactRegion]  WITH CHECK ADD  CONSTRAINT [FK_ContactRegion_Region] FOREIGN KEY([RegionId])
REFERENCES [media].[NewsRegion] ([Id])
GO
ALTER TABLE [media].[ContactRegion] CHECK CONSTRAINT [FK_ContactRegion_Region]
GO
ALTER TABLE [media].[ContactSector]  WITH CHECK ADD  CONSTRAINT [FK_ContactSector_Contact] FOREIGN KEY([ContactId])
REFERENCES [media].[Contact] ([Id])
GO
ALTER TABLE [media].[ContactSector] CHECK CONSTRAINT [FK_ContactSector_Contact]
GO
ALTER TABLE [media].[ContactSector]  WITH CHECK ADD  CONSTRAINT [FK_ContactSector_Sector] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([Id])
GO
ALTER TABLE [media].[ContactSector] CHECK CONSTRAINT [FK_ContactSector_Sector]
GO
ALTER TABLE [media].[ContactWebAddress]  WITH CHECK ADD  CONSTRAINT [FK_ContactWebAddress_Contact] FOREIGN KEY([ContactId])
REFERENCES [media].[Contact] ([Id])
GO
ALTER TABLE [media].[ContactWebAddress] CHECK CONSTRAINT [FK_ContactWebAddress_Contact]
GO
ALTER TABLE [media].[ContactWebAddress]  WITH CHECK ADD  CONSTRAINT [FK_ContactWebAddress_WebAddressType] FOREIGN KEY([WebAddressTypeId])
REFERENCES [media].[WebAddressType] ([Id])
GO
ALTER TABLE [media].[ContactWebAddress] CHECK CONSTRAINT [FK_ContactWebAddress_WebAddressType]
GO
ALTER TABLE [media].[MediaRequest]  WITH CHECK ADD  CONSTRAINT [FK_MediaRequest_MediaRequestResolution] FOREIGN KEY([ResolutionId])
REFERENCES [dbo].[MediaRequestResolution] ([Id])
GO
ALTER TABLE [media].[MediaRequest] CHECK CONSTRAINT [FK_MediaRequest_MediaRequestResolution]
GO
ALTER TABLE [media].[MediaRequest]  WITH CHECK ADD  CONSTRAINT [FK_MediaRequest_Ministry] FOREIGN KEY([LeadMinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [media].[MediaRequest] CHECK CONSTRAINT [FK_MediaRequest_Ministry]
GO
ALTER TABLE [media].[MediaRequest]  WITH CHECK ADD  CONSTRAINT [FK_MediaRequest_Parent] FOREIGN KEY([RequestParentId])
REFERENCES [media].[MediaRequest] ([Id])
GO
ALTER TABLE [media].[MediaRequest] CHECK CONSTRAINT [FK_MediaRequest_Parent]
GO
ALTER TABLE [media].[MediaRequest]  WITH CHECK ADD  CONSTRAINT [FK_MediaRequest_SystemUser] FOREIGN KEY([ResponsibleUserId])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [media].[MediaRequest] CHECK CONSTRAINT [FK_MediaRequest_SystemUser]
GO
ALTER TABLE [media].[MediaRequest]  WITH CHECK ADD  CONSTRAINT [FK_MediaRequest_SystemUser_Created] FOREIGN KEY([CreatedById])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [media].[MediaRequest] CHECK CONSTRAINT [FK_MediaRequest_SystemUser_Created]
GO
ALTER TABLE [media].[MediaRequest]  WITH CHECK ADD  CONSTRAINT [FK_MediaRequest_SystemUser_Modified] FOREIGN KEY([ModifiedById])
REFERENCES [calendar].[SystemUser] ([Id])
GO
ALTER TABLE [media].[MediaRequest] CHECK CONSTRAINT [FK_MediaRequest_SystemUser_Modified]
GO
ALTER TABLE [media].[MediaRequest]  WITH CHECK ADD  CONSTRAINT [FK_MediaRequest_TakeOverRequestMinistry] FOREIGN KEY([TakeOverRequestMinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [media].[MediaRequest] CHECK CONSTRAINT [FK_MediaRequest_TakeOverRequestMinistry]
GO
ALTER TABLE [media].[MediaRequestContact]  WITH CHECK ADD  CONSTRAINT [FK_MediaRequestContact_Company] FOREIGN KEY([CompanyId])
REFERENCES [media].[Company] ([Id])
GO
ALTER TABLE [media].[MediaRequestContact] CHECK CONSTRAINT [FK_MediaRequestContact_Company]
GO
ALTER TABLE [media].[MediaRequestContact]  WITH CHECK ADD  CONSTRAINT [FK_MediaRequestContact_Contact] FOREIGN KEY([ContactId])
REFERENCES [media].[Contact] ([Id])
GO
ALTER TABLE [media].[MediaRequestContact] CHECK CONSTRAINT [FK_MediaRequestContact_Contact]
GO
ALTER TABLE [media].[MediaRequestContact]  WITH CHECK ADD  CONSTRAINT [FK_MediaRequestContact_MediaRequest] FOREIGN KEY([MediaRequestId])
REFERENCES [media].[MediaRequest] ([Id])
GO
ALTER TABLE [media].[MediaRequestContact] CHECK CONSTRAINT [FK_MediaRequestContact_MediaRequest]
GO
ALTER TABLE [media].[MediaRequestSharedMinistry]  WITH CHECK ADD  CONSTRAINT [FK_MediaRequestSharedMinistry_MediaRequest] FOREIGN KEY([MediaRequestId])
REFERENCES [media].[MediaRequest] ([Id])
GO
ALTER TABLE [media].[MediaRequestSharedMinistry] CHECK CONSTRAINT [FK_MediaRequestSharedMinistry_MediaRequest]
GO
ALTER TABLE [media].[MediaRequestSharedMinistry]  WITH CHECK ADD  CONSTRAINT [FK_MediaRequestSharedMinistry_Ministry] FOREIGN KEY([MinistryId])
REFERENCES [dbo].[Ministry] ([Id])
GO
ALTER TABLE [media].[MediaRequestSharedMinistry] CHECK CONSTRAINT [FK_MediaRequestSharedMinistry_Ministry]
GO
ALTER TABLE [calendar].[SystemUser]  WITH CHECK ADD  CONSTRAINT [DF_SystemUser_MobileNumber] CHECK  ((len([MobileNumber])=(0) OR [MobileNumber] like replicate('[0-9-]',(12))))
GO
ALTER TABLE [calendar].[SystemUser] CHECK CONSTRAINT [DF_SystemUser_MobileNumber]
GO
ALTER TABLE [dbo].[NewsRelease]  WITH CHECK ADD  CONSTRAINT [CK_NewsRelease_CommittedPublishDateTime] CHECK  (([IsCommitted]=(0) OR [IsCommitted]=(1) AND [PublishDateTime] IS NOT NULL))
GO
ALTER TABLE [dbo].[NewsRelease] CHECK CONSTRAINT [CK_NewsRelease_CommittedPublishDateTime]
GO
ALTER TABLE [dbo].[NewsRelease]  WITH CHECK ADD  CONSTRAINT [CK_NewsRelease_ReleaseDateTime] CHECK  (([IsPublished]=(0) OR [IsPublished]=(1) AND [ReleaseDateTime] IS NOT NULL))
GO
ALTER TABLE [dbo].[NewsRelease] CHECK CONSTRAINT [CK_NewsRelease_ReleaseDateTime]
GO
ALTER TABLE [dbo].[NewsRelease]  WITH CHECK ADD  CONSTRAINT [CK_NewsRelease_ReleaseType] CHECK  (([ReleaseType]<=(5) AND [ReleaseType]>=(1)))
GO
ALTER TABLE [dbo].[NewsRelease] CHECK CONSTRAINT [CK_NewsRelease_ReleaseType]
GO
ALTER TABLE [dbo].[NewsReleaseType]  WITH CHECK ADD  CONSTRAINT [CK_NewsReleaseType_ReleaseType] CHECK  (([ReleaseType]<=(5) AND [ReleaseType]>=(1)))
GO
ALTER TABLE [dbo].[NewsReleaseType] CHECK CONSTRAINT [CK_NewsReleaseType_ReleaseType]
GO
ALTER TABLE [media].[MediaRequest]  WITH CHECK ADD  CONSTRAINT [Response] CHECK  (([Response]='' AND [RespondedAt] IS NULL OR NOT ([Response]='' OR [RespondedAt] IS NULL)))
GO
ALTER TABLE [media].[MediaRequest] CHECK CONSTRAINT [Response]
GO
/****** Object:  StoredProcedure [calendar].[GetCorpCalendarUpdates]    Script Date: 2018-12-14 11:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [calendar].[GetCorpCalendarUpdates]
    @UserID int = 0,
    @IsInAppOwnerList bit=0
AS
BEGIN
    SET NOCOUNT ON;

BEGIN TRY

    DECLARE @UserMinistryID TABLE
    ( MinistryId UNIQUEIDENTIFIER )
    INSERT INTO @UserMinistryID
    SELECT MinistryId FROM SystemUserMinistry WHERE SystemUserId=@UserID AND IsActive=1
    
    DECLARE @AccessibleSharedWithActivities TABLE
    ( ActivityId int)
    INSERT INTO @AccessibleSharedWithActivities
    SELECT ActivityId 
    FROM ActivitySharedWith
    WHERE MinistryId IN (SELECT MinistryId FROM @UserMinistryID)

    IF @IsInAppOwnerList = 1
      BEGIN 
         SELECT TOP 5 nf.*
         FROM NewsFeed nf
              INNER JOIN Activity a on nf.ActivityId = a.Id
         ORDER BY nf.CreatedDateTime DESC
      END
    ELSE
      BEGIN
        SELECT TOP 5 nf.*
         FROM NewsFeed nf
              INNER JOIN Activity a on nf.ActivityId = a.Id
         WHERE (a.ContactMinistryId in (Select MinistryId FROM @UserMinistryID) 
                     OR a.Id in (Select ActivityId FROM @AccessibleSharedWithActivities))
         ORDER BY nf.CreatedDateTime DESC
      END

END TRY


BEGIN CATCH

    -- Raise an error with the details of the exception   
      DECLARE @ErrMsg nvarchar(4000),
              @ErrSeverity int 

      SELECT @ErrMsg = ERROR_MESSAGE(), 
             @ErrSeverity = ERROR_SEVERITY() 

      RAISERROR(@ErrMsg, @ErrSeverity, 1) 


END CATCH

END
GO
ALTER AUTHORIZATION ON [calendar].[GetCorpCalendarUpdates] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [calendar].[GetCorpCalendarUpdatesBetweenDates]    Script Date: 2018-12-14 11:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [calendar].[GetCorpCalendarUpdatesBetweenDates]
    @UserID int = 0,
    @IsInAppOwnerList bit = 0,
    @ActivityID int = null,
    @FromDate datetime = null, 
    @ToDate datetime = null,
    @UpdateType nvarchar(50) = null

AS
BEGIN
    SET NOCOUNT ON;

BEGIN TRY

    DECLARE @UserMinistryID TABLE
    ( MinistryId UNIQUEIDENTIFIER )
    INSERT INTO @UserMinistryID
    SELECT MinistryId FROM SystemUserMinistry WHERE SystemUserId=@UserID AND IsActive=1
    
    DECLARE @AccessibleSharedWithActivities TABLE
    ( ActivityId int)
    INSERT INTO @AccessibleSharedWithActivities
    SELECT ActivityId 
    FROM ActivitySharedWith
    WHERE MinistryId IN (SELECT MinistryId FROM @UserMinistryID)

    IF @IsInAppOwnerList = 1
      BEGIN 
         SELECT nf.*
         FROM NewsFeed nf
              INNER JOIN Activity a on nf.ActivityId = a.Id
         WHERE (@FromDate IS NULL OR DATEDIFF(day, nf.CreatedDateTime, @FromDate) <= 0) -- where CreatedDateTime is on the same day or after FromDate
             AND (@ToDate IS NULL OR DATEDIFF(day, nf.CreatedDateTime, @ToDate) >= 0)   -- where CreatedDateTime is on the same day or before ToDate
             AND (@ActivityID IS NULL OR a.Id = @ActivityID)
             AND (@UpdateType IS NULL OR nf.Description = @UpdateType)
         ORDER BY nf.CreatedDateTime DESC
      END
    ELSE
      BEGIN
        SELECT nf.*
         FROM NewsFeed nf
              INNER JOIN Activity a on nf.ActivityId = a.Id
         WHERE (a.ContactMinistryId in (Select MinistryId FROM @UserMinistryID) 
                     OR a.Id in (Select ActivityId FROM @AccessibleSharedWithActivities))
             AND (@FromDate IS NULL OR DATEDIFF(day, nf.CreatedDateTime, @FromDate) <= 0) -- where CreatedDateTime is on the same day or after FromDate
             AND (@ToDate IS NULL OR DATEDIFF(day, nf.CreatedDateTime, @ToDate) >= 0)   -- where CreatedDateTime is on the same day or before ToDate
             AND (@ActivityID IS NULL OR a.Id = @ActivityID)
             AND (@UpdateType IS NULL OR nf.Description = @UpdateType)
         ORDER BY nf.CreatedDateTime DESC
      END

END TRY


BEGIN CATCH

    -- Raise an error with the details of the exception
      DECLARE @ErrMsg nvarchar(4000),
              @ErrSeverity int 

      SELECT @ErrMsg = ERROR_MESSAGE(), 
             @ErrSeverity = ERROR_SEVERITY() 
     
      RAISERROR(@ErrMsg, @ErrSeverity, 1) 


END CATCH

END
GO
ALTER AUTHORIZATION ON [calendar].[GetCorpCalendarUpdatesBetweenDates] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [calendar].[GetCorpCalendarUpdatesToday]    Script Date: 2018-12-14 11:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [calendar].[GetCorpCalendarUpdatesToday]
    @UserID int = 0,
    @IsInAppOwnerList bit=0
AS
BEGIN
    SET NOCOUNT ON;

BEGIN TRY

    DECLARE @UserMinistryID TABLE
    ( MinistryId UNIQUEIDENTIFIER )
    INSERT INTO @UserMinistryID
    SELECT MinistryId FROM SystemUserMinistry WHERE SystemUserId=@UserID AND IsActive=1
    
    DECLARE @AccessibleSharedWithActivities TABLE
    ( ActivityId int)
    INSERT INTO @AccessibleSharedWithActivities
    SELECT ActivityId 
    FROM ActivitySharedWith
    WHERE MinistryId IN (SELECT MinistryId FROM @UserMinistryID)

    IF @IsInAppOwnerList = 1
      BEGIN 
         SELECT nf.*
         FROM NewsFeed nf
              INNER JOIN Activity a on nf.ActivityId = a.Id
         WHERE datediff(day,nf.CreatedDateTime,getdate())= 0
         ORDER BY nf.CreatedDateTime DESC
      END
    ELSE
      BEGIN
        SELECT nf.*
         FROM NewsFeed nf
              INNER JOIN Activity a on nf.ActivityId = a.Id
         WHERE (a.ContactMinistryId in (Select MinistryId FROM @UserMinistryID) 
                     OR a.Id in (Select ActivityId FROM @AccessibleSharedWithActivities))
                AND datediff(day,nf.CreatedDateTime,getdate())= 0
         ORDER BY nf.CreatedDateTime DESC
      END

END TRY


BEGIN CATCH

    -- Raise an error with the details of the exception   
      DECLARE @ErrMsg nvarchar(4000),
              @ErrSeverity int 

      SELECT @ErrMsg = ERROR_MESSAGE(), 
             @ErrSeverity = ERROR_SEVERITY() 

      RAISERROR(@ErrMsg, @ErrSeverity, 1) 

END CATCH

END
GO
ALTER AUTHORIZATION ON [calendar].[GetCorpCalendarUpdatesToday] TO  SCHEMA OWNER 
GO
