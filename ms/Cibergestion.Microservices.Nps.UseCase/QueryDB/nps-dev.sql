USE [nps-dev]
GO
/****** Object:  Schema [Nps]    Script Date: 11/10/2025 6:37:01 PM ******/
CREATE SCHEMA [Nps]
GO
/****** Object:  Table [Nps].[Roles]    Script Date: 11/10/2025 6:37:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Nps].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Nps].[UserRoles]    Script Date: 11/10/2025 6:37:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Nps].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Nps].[Users]    Script Date: 11/10/2025 6:37:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Nps].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](256) NOT NULL,
	[FailedLoginAttempts] [int] NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Nps].[UserSessions]    Script Date: 11/10/2025 6:37:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Nps].[UserSessions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RefreshToken] [nvarchar](512) NOT NULL,
	[ExpiresAt] [datetime2](7) NOT NULL,
	[LastActivityAt] [datetime2](7) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[AccessToken] [nvarchar](512) NOT NULL,
	[IsRevoked] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Nps].[Votes]    Script Date: 11/10/2025 6:37:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Nps].[Votes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Score] [tinyint] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Nps].[Roles] ON 
GO
INSERT [Nps].[Roles] ([Id], [Name], [Description], [CreatedAt]) VALUES (1, N'Admin', N'user admin', CAST(N'2025-11-10T10:13:29.9026440' AS DateTime2))
GO
INSERT [Nps].[Roles] ([Id], [Name], [Description], [CreatedAt]) VALUES (2, N'Voter', N'user voying', CAST(N'2025-11-10T10:13:29.9026440' AS DateTime2))
GO
SET IDENTITY_INSERT [Nps].[Roles] OFF
GO
SET IDENTITY_INSERT [Nps].[UserRoles] ON 
GO
INSERT [Nps].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (13, 17, 2)
GO
INSERT [Nps].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (14, 18, 2)
GO
INSERT [Nps].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (15, 19, 2)
GO
INSERT [Nps].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (16, 20, 2)
GO
INSERT [Nps].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (17, 21, 2)
GO
INSERT [Nps].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (18, 22, 2)
GO
INSERT [Nps].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (19, 23, 2)
GO
INSERT [Nps].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (20, 24, 2)
GO
INSERT [Nps].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (21, 25, 2)
GO
INSERT [Nps].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (22, 26, 2)
GO
INSERT [Nps].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (23, 27, 1)
GO
SET IDENTITY_INSERT [Nps].[UserRoles] OFF
GO
SET IDENTITY_INSERT [Nps].[Users] ON 
GO
INSERT [Nps].[Users] ([Id], [Username], [PasswordHash], [FailedLoginAttempts], [IsLocked], [CreatedAt]) VALUES (17, N'Votante1', N'vjX0+rt9+glRYB+cIzgNAw==.TYqxPJ6y/2itF74FQ1i2HmbxlLb7j2Zxiu1qwPPeFgo=', 0, 0, CAST(N'2025-11-10T22:52:11.7202380' AS DateTime2))
GO
INSERT [Nps].[Users] ([Id], [Username], [PasswordHash], [FailedLoginAttempts], [IsLocked], [CreatedAt]) VALUES (18, N'Votante2', N'P0vsbD8kjSBuheG5EpK1Ag==.z13SjWH9BIR02Lf4nlEo2TF+kezxxYlxiwSNS6KetRY=', 0, 0, CAST(N'2025-11-10T23:11:43.9799421' AS DateTime2))
GO
INSERT [Nps].[Users] ([Id], [Username], [PasswordHash], [FailedLoginAttempts], [IsLocked], [CreatedAt]) VALUES (19, N'Votante3', N'iQ309IVEPloeBW4ohBAjDg==.eP2EE3DUyPIQ6YAaBpc9ybHFggVLGye/VmZ6Qq3YO2w=', 0, 0, CAST(N'2025-11-10T23:11:48.6632652' AS DateTime2))
GO
INSERT [Nps].[Users] ([Id], [Username], [PasswordHash], [FailedLoginAttempts], [IsLocked], [CreatedAt]) VALUES (20, N'Votante4', N'qYJ6fynRSYL5ZWsUhwUFYg==.55yNxZlfRa8wJKkb7CzsAZ3ssJrYhYe/Q/eagGZGI8g=', 0, 0, CAST(N'2025-11-10T23:11:52.4022543' AS DateTime2))
GO
INSERT [Nps].[Users] ([Id], [Username], [PasswordHash], [FailedLoginAttempts], [IsLocked], [CreatedAt]) VALUES (21, N'Votante5', N'5bUAP7fos0iKiYV7Wrq4sw==.phner1+Y1/c2mu/d5/3d3/aC6Q7dH1olrLgOdW27fNU=', 0, 0, CAST(N'2025-11-10T23:11:55.3932896' AS DateTime2))
GO
INSERT [Nps].[Users] ([Id], [Username], [PasswordHash], [FailedLoginAttempts], [IsLocked], [CreatedAt]) VALUES (22, N'Votante6', N'XnLfZDxM3mQclPXJFkOw5w==.88rW6csuQFksVTW5hTr7MPg9pXJU5mmaQSQQClC/QVw=', 0, 0, CAST(N'2025-11-10T23:11:58.2472273' AS DateTime2))
GO
INSERT [Nps].[Users] ([Id], [Username], [PasswordHash], [FailedLoginAttempts], [IsLocked], [CreatedAt]) VALUES (23, N'Votante7', N'cKjYJnDYxsZMxEH+5y61rw==.CWTfW94sM6ibg6HehyWNqTwkmVK1A8sd7MfTNg8Oanw=', 0, 0, CAST(N'2025-11-10T23:12:01.4063712' AS DateTime2))
GO
INSERT [Nps].[Users] ([Id], [Username], [PasswordHash], [FailedLoginAttempts], [IsLocked], [CreatedAt]) VALUES (24, N'Votante8', N'fEGdAbxIMxg2nXHUXlf45A==.JUg7OsICS2EsJ9zn9vZTovn3KnM+GHq1Un1zA+2dTcA=', 0, 0, CAST(N'2025-11-10T23:12:04.1915649' AS DateTime2))
GO
INSERT [Nps].[Users] ([Id], [Username], [PasswordHash], [FailedLoginAttempts], [IsLocked], [CreatedAt]) VALUES (25, N'Votante9', N'zIDO2gIcNzr6SEZi1SQUcA==.UNjGo0LH/5k1f7BAyfeakPC5kJGivuI0x7xP4sFR8ms=', 0, 0, CAST(N'2025-11-10T23:12:07.0445210' AS DateTime2))
GO
INSERT [Nps].[Users] ([Id], [Username], [PasswordHash], [FailedLoginAttempts], [IsLocked], [CreatedAt]) VALUES (26, N'Votante10', N'PF2EoH1j5Zqva9+0CPXjXQ==.dMBCNM7bccevqftQAuCLkbR+Ml9ubLpGDKUh2UOOaic=', 0, 0, CAST(N'2025-11-10T23:12:10.8035585' AS DateTime2))
GO
INSERT [Nps].[Users] ([Id], [Username], [PasswordHash], [FailedLoginAttempts], [IsLocked], [CreatedAt]) VALUES (27, N'Admin', N'8bVGvj8IG0Livzt1tAkZhw==.W49lKLZE5pIQyz62muz3e1azf8zOJc5QJ9R4KwTZQF0=', 0, 0, CAST(N'2025-11-10T23:12:27.4101116' AS DateTime2))
GO
SET IDENTITY_INSERT [Nps].[Users] OFF
GO
SET IDENTITY_INSERT [Nps].[UserSessions] ON 
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (94, 17, N'5afccf16a93744f2acfaed1ed2a55092', CAST(N'2025-11-10T22:57:25.7752576' AS DateTime2), CAST(N'2025-11-10T22:52:25.7752576' AS DateTime2), CAST(N'2025-11-10T22:52:25.7752575' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjE3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IlZvdGFudGUxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVm90ZXIiLCJleHAiOjE3NjI4MTU0NDUsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.1d4PCYbUmPXU39chZSSmyIH4A2lLwC6iiEunEgxzGzM', 0)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (95, 17, N'f65c042ca7c74515984f4cd9a9671e39', CAST(N'2025-11-10T23:00:31.1829655' AS DateTime2), CAST(N'2025-11-10T22:55:31.1829654' AS DateTime2), CAST(N'2025-11-10T22:55:31.1829653' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjE3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IlZvdGFudGUxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVm90ZXIiLCJleHAiOjE3NjI4MTU2MzEsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.sGIWSzy8C396_n5QDMDZbSonHytLFf3tmTEDd-8c5T8', 1)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (96, 17, N'dbbb8d2b00404e6c88765d9b61b92fa6', CAST(N'2025-11-10T23:03:55.2623425' AS DateTime2), CAST(N'2025-11-10T22:58:55.2622769' AS DateTime2), CAST(N'2025-11-10T22:58:55.2622030' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjE3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IlZvdGFudGUxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVm90ZXIiLCJleHAiOjE3NjI4MTU4MzUsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.mTba79WIjgMdiRc2wnmcilNhAn9QmlDiKUPJ1iPPhRQ', 0)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (97, 27, N'ee5688938e5e4bf6b06cb0e4ee87bfaf', CAST(N'2025-11-10T23:17:54.0279299' AS DateTime2), CAST(N'2025-11-10T23:12:54.0278854' AS DateTime2), CAST(N'2025-11-10T23:12:54.0278424' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjI3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IkFkbWluIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJleHAiOjE3NjI4MTY2NzMsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.nzKJg1HKLZ6UAnw7SQq63-Y88AphVZuwzLV6_6QIakk', 1)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (98, 17, N'4748201a7a5149fa84e3f2436b2c639a', CAST(N'2025-11-10T23:18:01.6735603' AS DateTime2), CAST(N'2025-11-10T23:13:01.6735602' AS DateTime2), CAST(N'2025-11-10T23:13:01.6735602' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjE3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IlZvdGFudGUxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVm90ZXIiLCJleHAiOjE3NjI4MTY2ODEsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.LpW2wHHebx7wd5Ut5MMoN2gQT6Uf2SNM6ZGWSwhCx9g', 1)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (99, 18, N'aaea1383739d4761a0f350dcb75476f8', CAST(N'2025-11-10T23:18:13.8067273' AS DateTime2), CAST(N'2025-11-10T23:13:13.8067272' AS DateTime2), CAST(N'2025-11-10T23:13:13.8067272' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjE4IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IlZvdGFudGUyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVm90ZXIiLCJleHAiOjE3NjI4MTY2OTMsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.63OE0LqqMPvS8jsJCsai2W6vFyMw7B5bEUEpiQLyQ7M', 1)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (100, 17, N'40f7c4f499c84d69addeca232b4359c3', CAST(N'2025-11-10T23:18:25.0470022' AS DateTime2), CAST(N'2025-11-10T23:13:25.0470022' AS DateTime2), CAST(N'2025-11-10T23:13:25.0470021' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjE3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IlZvdGFudGUxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVm90ZXIiLCJleHAiOjE3NjI4MTY3MDUsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.r5wf6EGDLhDRzaPPP1aJmgXQvlhDbAGFa3X4mFN4w3U', 1)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (101, 19, N'1500087e9de4443f99d5cb51dff9073c', CAST(N'2025-11-10T23:18:35.6901354' AS DateTime2), CAST(N'2025-11-10T23:13:35.6901354' AS DateTime2), CAST(N'2025-11-10T23:13:35.6901351' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjE5IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IlZvdGFudGUzIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVm90ZXIiLCJleHAiOjE3NjI4MTY3MTUsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.6ZNsPsF9KnFOMEoz8ITpRaF5_73kn4cyjvaLErnHcXA', 1)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (102, 20, N'0c62bf51ab8a4158ba4f4c43e893f636', CAST(N'2025-11-10T23:18:49.6365537' AS DateTime2), CAST(N'2025-11-10T23:13:49.6365537' AS DateTime2), CAST(N'2025-11-10T23:13:49.6365536' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjIwIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IlZvdGFudGU0IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVm90ZXIiLCJleHAiOjE3NjI4MTY3MjksImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.JzWi-1fiHqslyBBq7_kC6th65RJKSFAnzzuYEj_-vqY', 1)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (103, 22, N'350520cf922c42c29d82af610d0ac52a', CAST(N'2025-11-10T23:19:05.0491518' AS DateTime2), CAST(N'2025-11-10T23:14:05.0491518' AS DateTime2), CAST(N'2025-11-10T23:14:05.0491517' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjIyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IlZvdGFudGU2IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVm90ZXIiLCJleHAiOjE3NjI4MTY3NDUsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.pMP4uAoE8tQrvb7ASA-HGU8NgYoq8oSfJ7mZaSaV80g', 1)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (104, 25, N'e207b69e02134e34bee368b9a9129f30', CAST(N'2025-11-10T23:19:18.5121989' AS DateTime2), CAST(N'2025-11-10T23:14:18.5121989' AS DateTime2), CAST(N'2025-11-10T23:14:18.5121988' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjI1IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IlZvdGFudGU5IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVm90ZXIiLCJleHAiOjE3NjI4MTY3NTgsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.U1hRqWs1wzLPOqkTyzWYRYcVQ3_TEClbfpU9iudJlhQ', 1)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (105, 26, N'b1f44467084646e9af0af5b1de717a32', CAST(N'2025-11-10T23:19:28.6794549' AS DateTime2), CAST(N'2025-11-10T23:14:28.6794548' AS DateTime2), CAST(N'2025-11-10T23:14:28.6794548' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjI2IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IlZvdGFudGUxMCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlZvdGVyIiwiZXhwIjoxNzYyODE2NzY4LCJpc3MiOiJodHRwczovL25wcy1hcGkiLCJhdWQiOiJodHRwczovL25wcy1jbGllbnQifQ.E_jl_mN0SJ98iNE2u8TmX4wEL8HqiFgBUWZqRvKxWKY', 1)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (106, 27, N'a5d79b2f68e044cba45e4d381b6d589f', CAST(N'2025-11-10T23:19:36.1961427' AS DateTime2), CAST(N'2025-11-10T23:14:36.1961427' AS DateTime2), CAST(N'2025-11-10T23:14:36.1961426' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjI3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IkFkbWluIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJleHAiOjE3NjI4MTY3NzYsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.sMIkjl6NRFeyCxYHwYhPfX7JxK_WxIkC6pAogbNs7yY', 1)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (107, 23, N'0744c7739e2140ceb1c94c92907c3dd6', CAST(N'2025-11-10T23:19:53.2682422' AS DateTime2), CAST(N'2025-11-10T23:14:53.2682422' AS DateTime2), CAST(N'2025-11-10T23:14:53.2682421' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjIzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IlZvdGFudGU3IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVm90ZXIiLCJleHAiOjE3NjI4MTY3OTMsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.oX8sqmMG1Chd-kGLU4NtLL9sEBw3OPXoJgARmr1Yfx4', 1)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (108, 24, N'a13317f2ea564490a9eabd05cf548fdf', CAST(N'2025-11-10T23:20:03.2683247' AS DateTime2), CAST(N'2025-11-10T23:15:03.2683246' AS DateTime2), CAST(N'2025-11-10T23:15:03.2683245' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjI0IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IlZvdGFudGU4IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVm90ZXIiLCJleHAiOjE3NjI4MTY4MDMsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.stuiyw1UDvKkyr3CGr44h27AV5cL_y-K1-i_DoCHfTU', 1)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (109, 27, N'a96a9244bd82413aa158993e21654f0d', CAST(N'2025-11-10T23:20:18.0021553' AS DateTime2), CAST(N'2025-11-10T23:15:18.0021552' AS DateTime2), CAST(N'2025-11-10T23:15:18.0021551' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjI3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IkFkbWluIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJleHAiOjE3NjI4MTY4MTgsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.Y7JLAQ9ZkAKgH3dIf0wog1fX2reHs4y2MLYhs7VH6dM', 0)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (110, 27, N'0e3955f96a164615b2d96ef6aaf1fe02', CAST(N'2025-11-10T23:25:41.5673063' AS DateTime2), CAST(N'2025-11-10T23:20:41.5673063' AS DateTime2), CAST(N'2025-11-10T23:20:41.5673062' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjI3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IkFkbWluIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJleHAiOjE3NjI4MTcxNDEsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.ryIpd24q6jMWVhmGrhzJzwLVZ2r8nRCF4Cac0_uyZ1E', 0)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (111, 27, N'cf45f94aec0748a79606d39ef287c188', CAST(N'2025-11-10T23:31:47.5165226' AS DateTime2), CAST(N'2025-11-10T23:26:47.5164520' AS DateTime2), CAST(N'2025-11-10T23:26:47.5163732' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjI3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IkFkbWluIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJleHAiOjE3NjI4MTc1MDcsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.EJNr6xgE067MrW2xucO8M69SKvxZDhtypjssZcrTIzQ', 1)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (112, 17, N'7b7b53b4852748d19b044bfeb9b88780', CAST(N'2025-11-10T23:32:16.4512160' AS DateTime2), CAST(N'2025-11-10T23:27:16.4512160' AS DateTime2), CAST(N'2025-11-10T23:27:16.4512159' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjE3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IlZvdGFudGUxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVm90ZXIiLCJleHAiOjE3NjI4MTc1MzYsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.BHQh37zxH70O75_BqP15JBo4USf_kXbGu2lUEie3ruI', 0)
GO
INSERT [Nps].[UserSessions] ([Id], [UserId], [RefreshToken], [ExpiresAt], [LastActivityAt], [CreatedAt], [AccessToken], [IsRevoked]) VALUES (113, 27, N'258f8e3191bb4a89bf96390def1e3662', CAST(N'2025-11-10T23:38:48.0296805' AS DateTime2), CAST(N'2025-11-10T23:33:48.0295708' AS DateTime2), CAST(N'2025-11-10T23:33:48.0295052' AS DateTime2), N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjI3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IkFkbWluIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJleHAiOjE3NjI4MTc5MjgsImlzcyI6Imh0dHBzOi8vbnBzLWFwaSIsImF1ZCI6Imh0dHBzOi8vbnBzLWNsaWVudCJ9.52S6Xk7lvF_abwOHLpERgveDGiZzG9Gij9r-slfeLcw', 1)
GO
SET IDENTITY_INSERT [Nps].[UserSessions] OFF
GO
SET IDENTITY_INSERT [Nps].[Votes] ON 
GO
INSERT [Nps].[Votes] ([Id], [UserId], [Score], [CreatedAt]) VALUES (12, 17, 10, CAST(N'2025-11-10T23:13:03.4397083' AS DateTime2))
GO
INSERT [Nps].[Votes] ([Id], [UserId], [Score], [CreatedAt]) VALUES (13, 18, 4, CAST(N'2025-11-10T23:13:15.8566728' AS DateTime2))
GO
INSERT [Nps].[Votes] ([Id], [UserId], [Score], [CreatedAt]) VALUES (14, 19, 8, CAST(N'2025-11-10T23:13:38.1192118' AS DateTime2))
GO
INSERT [Nps].[Votes] ([Id], [UserId], [Score], [CreatedAt]) VALUES (15, 20, 5, CAST(N'2025-11-10T23:13:52.2640558' AS DateTime2))
GO
INSERT [Nps].[Votes] ([Id], [UserId], [Score], [CreatedAt]) VALUES (16, 22, 7, CAST(N'2025-11-10T23:14:07.5885401' AS DateTime2))
GO
INSERT [Nps].[Votes] ([Id], [UserId], [Score], [CreatedAt]) VALUES (17, 25, 8, CAST(N'2025-11-10T23:14:20.4724007' AS DateTime2))
GO
INSERT [Nps].[Votes] ([Id], [UserId], [Score], [CreatedAt]) VALUES (18, 26, 2, CAST(N'2025-11-10T23:14:30.2834884' AS DateTime2))
GO
INSERT [Nps].[Votes] ([Id], [UserId], [Score], [CreatedAt]) VALUES (19, 23, 4, CAST(N'2025-11-10T23:14:54.8204827' AS DateTime2))
GO
INSERT [Nps].[Votes] ([Id], [UserId], [Score], [CreatedAt]) VALUES (20, 24, 5, CAST(N'2025-11-10T23:15:05.4108408' AS DateTime2))
GO
SET IDENTITY_INSERT [Nps].[Votes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__737584F6E6D83022]    Script Date: 11/10/2025 6:37:01 PM ******/
ALTER TABLE [Nps].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4FBD6054C]    Script Date: 11/10/2025 6:37:01 PM ******/
ALTER TABLE [Nps].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Votes__1788CC4DC10A6D5E]    Script Date: 11/10/2025 6:37:01 PM ******/
ALTER TABLE [Nps].[Votes] ADD UNIQUE NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Nps].[Users] ADD  CONSTRAINT [DF_Users_FailedLoginAttempts]  DEFAULT ((0)) FOR [FailedLoginAttempts]
GO
ALTER TABLE [Nps].[UserSessions] ADD  DEFAULT ('') FOR [AccessToken]
GO
ALTER TABLE [Nps].[UserSessions] ADD  DEFAULT ((0)) FOR [IsRevoked]
GO
ALTER TABLE [Nps].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [Nps].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Nps].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [Nps].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [Nps].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Nps].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [Nps].[UserSessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_Users] FOREIGN KEY([UserId])
REFERENCES [Nps].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Nps].[UserSessions] CHECK CONSTRAINT [FK_Sessions_Users]
GO
ALTER TABLE [Nps].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Users] FOREIGN KEY([UserId])
REFERENCES [Nps].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Nps].[Votes] CHECK CONSTRAINT [FK_Votes_Users]
GO
