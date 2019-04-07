############ Time Table #####################
CREATE TABLE [dbo].[menzclubsoftball_tblTimeValues](
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[Times] [nvarchar](15) not NULL
) ON [PRIMARY]


############ Team Table #####################
CREATE TABLE [dbo].[MenzClubSoftBall_tblTeam]
(
	[id] [int] IDENTITY(1,1) primary key not null,
	[TeamName] [nvarchar](50) not null,
	[Division] [nvarchar](10)not null
 
) ON [PRIMARY]

############ Schedule Table #####################

CREATE TABLE [dbo].[tblSchedule](
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[PlayingField] [nchar](30) NOT NULL,
	[HomeAway] [nchar](10) NOT NULL,
	[teamid] [int] NULL,
	[opponentid] [int] NULL,
	[Datetimes] [datetime] NULL,
	[timesvalue] [int] NULL,
 ) ON [PRIMARY]

############ Standing Table #####################

CREATE TABLE [dbo].[menzclubsoftball_tblStanding](
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[Record] [nvarchar](50) NOT NULL,
	[GMsBack] [float] NOT NULL,
	[Streak] [nvarchar](50) NOT NULL,
	[RunFor] [int] NOT NULL,
	[RunAgainst] [int] NOT NULL,
	[teamid] [int] NULL,
 
) ON [PRIMARY]

############ Score Table #####################

CREATE TABLE [dbo].[menzclubsoftball_tblScore](
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[OwnScore] [int] NOT NULL,
	[OpponentScore] [int] NOT NULL,
	[DateTimes] [datetime] NOT NULL,
	[teamid] [int] not NULL,
	[OpponentTeamId] [int] not NULL,
 
) ON [PRIMARY]

