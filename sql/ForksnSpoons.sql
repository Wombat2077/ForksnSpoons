USE [ForksnSpoons]
GO
/****** Object:  Table [dbo].[Category]    Script Date: Пн 28.10.24 13:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distributor]    Script Date: Пн 28.10.24 13:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distributor](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Distributor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: Пн 28.10.24 13:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: Пн 28.10.24 13:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[OrderDate] [date] NULL,
	[DeliveryDate] [date] NULL,
	[OrderPointId] [int] NULL,
	[UserId] [int] NULL,
	[GetCode] [nchar](10) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderList]    Script Date: Пн 28.10.24 13:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderList](
	[OrderId] [int] NULL,
	[ProductArticle] [nchar](10) NOT NULL,
	[Count] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPoint]    Script Date: Пн 28.10.24 13:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPoint](
	[Id] [int] NOT NULL,
	[PostIndex] [int] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](50) NULL,
	[Number] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderPoint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: Пн 28.10.24 13:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Article] [nchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Unit] [nchar](10) NULL,
	[Cost] [money] NULL,
	[MaxDiscount] [int] NULL,
	[ManufacturerId] [int] NULL,
	[DistributorId] [int] NULL,
	[CategoryId] [int] NULL,
	[Discount] [int] NULL,
	[Count] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[PhotoPath] [nchar](10) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: Пн 28.10.24 13:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[Role] [int] NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Вилки')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Ложки')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Наборы')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Ножи')
GO
INSERT [dbo].[Distributor] ([Id], [Name]) VALUES (1, N'LeroiMerlin')
INSERT [dbo].[Distributor] ([Id], [Name]) VALUES (2, N'Максидом')
GO
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (1, N'Alaska')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (2, N'Apollo')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (3, N'Attribute')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (4, N'Davinci')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (5, N'Doria')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (6, N'Mayer & Boch')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (7, N'Smart Home')
GO
INSERT [dbo].[Order] ([Id], [OrderDate], [DeliveryDate], [OrderPointId], [UserId], [GetCode], [Status]) VALUES (1, CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 1, 10, N'801       ', 1)
INSERT [dbo].[Order] ([Id], [OrderDate], [DeliveryDate], [OrderPointId], [UserId], [GetCode], [Status]) VALUES (2, CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 14, 10, N'802       ', 2)
INSERT [dbo].[Order] ([Id], [OrderDate], [DeliveryDate], [OrderPointId], [UserId], [GetCode], [Status]) VALUES (3, CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 2, 7, N'803       ', 2)
INSERT [dbo].[Order] ([Id], [OrderDate], [DeliveryDate], [OrderPointId], [UserId], [GetCode], [Status]) VALUES (4, CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 22, 7, N'804       ', 2)
INSERT [dbo].[Order] ([Id], [OrderDate], [DeliveryDate], [OrderPointId], [UserId], [GetCode], [Status]) VALUES (5, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 2, 9, N'805       ', 2)
INSERT [dbo].[Order] ([Id], [OrderDate], [DeliveryDate], [OrderPointId], [UserId], [GetCode], [Status]) VALUES (6, CAST(N'2022-05-20' AS Date), CAST(N'2022-05-26' AS Date), 28, 9, N'806       ', 2)
INSERT [dbo].[Order] ([Id], [OrderDate], [DeliveryDate], [OrderPointId], [UserId], [GetCode], [Status]) VALUES (7, CAST(N'2022-05-22' AS Date), CAST(N'2022-05-28' AS Date), 3, 9, N'807       ', 2)
INSERT [dbo].[Order] ([Id], [OrderDate], [DeliveryDate], [OrderPointId], [UserId], [GetCode], [Status]) VALUES (8, CAST(N'2022-05-22' AS Date), CAST(N'2022-05-28' AS Date), 32, 9, N'808       ', 2)
INSERT [dbo].[Order] ([Id], [OrderDate], [DeliveryDate], [OrderPointId], [UserId], [GetCode], [Status]) VALUES (9, CAST(N'2022-05-24' AS Date), CAST(N'2022-05-30' AS Date), 5, 9, N'809       ', 2)
INSERT [dbo].[Order] ([Id], [OrderDate], [DeliveryDate], [OrderPointId], [UserId], [GetCode], [Status]) VALUES (10, CAST(N'2022-05-24' AS Date), CAST(N'2022-05-30' AS Date), 36, 8, N'810       ', 2)
GO
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (1, N'А112Т4    ', 2)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (1, N'T793T4    ', 3)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (2, N'G387Y6    ', 16)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (2, N'F573T5    ', 10)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (3, N'D735T5    ', 20)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (3, N'B736H6    ', 20)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (4, N'H384H3    ', 2)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (4, N'K437E6    ', 2)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (5, N'E732R7    ', 4)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (5, N'R836H6    ', 3)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (6, N'F839R6    ', 4)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (6, N'G304H6    ', 4)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (7, N'C430T4    ', 10)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (7, N'C946Y6    ', 3)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (8, N'V403G6    ', 5)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (8, N'B963H5    ', 5)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (9, N'V026J4    ', 2)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (9, N'V727Y6    ', 2)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (10, N'C635Y6    ', 2)
INSERT [dbo].[OrderList] ([OrderId], [ProductArticle], [Count]) VALUES (10, N'W405G6    ', 2)
GO
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (1, 344288, N' г. Талнах', N' ул. Чехова', N'1')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (2, 614164, N' г.Талнах', N'  ул. Степная', N'30')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (3, 394242, N' г. Талнах', N' ул. Коммунистическая', N'43')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (4, 660540, N' г. Талнах', N' ул. Солнечная', N'25')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (5, 125837, N' г. Талнах', N' ул. Шоссейная', N'40')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (6, 125703, N' г. Талнах', N' ул. Партизанская', N'49')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (7, 625283, N' г. Талнах', N' ул. Победы', N'46')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (8, 614611, N' г. Талнах', N' ул. Молодежная', N'50')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (9, 454311, N' г.Талнах', N' ул. Новая', N'19')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (10, 660007, N' г.Талнах', N' ул. Октябрьская', N'19')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (11, 603036, N' г. Талнах', N' ул. Садовая', N'4')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (12, 450983, N' г.Талнах', N' ул. Комсомольская', N'26')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (13, 394782, N' г. Талнах', N' ул. Чехова', N'3')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (14, 603002, N' г. Талнах', N' ул. Дзержинского', N'28')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (15, 450558, N' г. Талнах', N' ул. Набережная', N'30')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (16, 394060, N' г.Талнах', N' ул. Фрунзе', N'43')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (17, 410661, N' г. Талнах', N' ул. Школьная', N'50')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (18, 625590, N' г. Талнах', N' ул. Коммунистическая', N'20')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (19, 625683, N' г. Талнах', N' ул. 8 Марта', N'16')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (20, 400562, N' г. Талнах', N' ул. Зеленая', N'32')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (21, 614510, N' г. Талнах', N' ул. Маяковского', N'47')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (22, 410542, N' г. Талнах', N' ул. Светлая', N'46')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (23, 620839, N' г. Талнах', N' ул. Цветочная', N'8')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (24, 443890, N' г. Талнах', N' ул. Коммунистическая', N'1')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (25, 603379, N' г. Талнах', N' ул. Спортивная', N'46')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (26, 603721, N' г. Талнах', N' ул. Гоголя', N'41')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (27, 410172, N' г. Талнах', N' ул. Северная', N'13')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (28, 420151, N' г. Талнах', N' ул. Вишневая', N'32')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (29, 125061, N' г. Талнах', N' ул. Подгорная', N'8')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (30, 630370, N' г. Талнах', N' ул. Шоссейная', N'24')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (31, 614753, N' г. Талнах', N' ул. Полевая', N'35')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (32, 426030, N' г. Талнах', N' ул. Маяковского', N'44')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (33, 450375, N' г. Талнах', N' ул. Клубная', N'44')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (34, 625560, N' г. Талнах', N' ул. Некрасова', N'12')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (35, 630201, N' г. Талнах', N' ул. Комсомольская', N'17')
INSERT [dbo].[OrderPoint] ([Id], [PostIndex], [City], [Street], [Number]) VALUES (36, 190949, N' г. Талнах', N' ул. Мичурина', N'26')
GO
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'B736H6    ', N'Вилка столовая', N'шт.       ', 220.0000, 5, 1, 1, 1, 3, 4, N'Вилка столовая 21,2 см «Аляска бэйсик» сталь KunstWerk', N'B736H6.jpg')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'B963H5    ', N'Ложка', N'шт.       ', 800.0000, 5, 7, 1, 2, 3, 8, N'Ложка 21 мм металлическая (медная) (Упаковка 10 шт)', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'C430T4    ', N'Набор на одну персону', N'шт.       ', 1600.0000, 30, 3, 1, 3, 3, 6, N'Набор на одну персону (4 предмета) серия "Bistro", нерж. сталь, Was, Германия.', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'C635Y6    ', N'Детский столовый набор', N'шт.       ', 1000.0000, 15, 2, 2, 3, 4, 25, N'Детский столовый набор Fissman «Зебра» ', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'C730R7    ', N'Ложка детская', N'шт.       ', 300.0000, 5, 7, 1, 2, 3, 17, N'Ложка детская столовая', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'C943G5    ', N'Набор чайных ложек', N'шт.       ', 200.0000, 5, 3, 2, 3, 4, 12, N'Attribute Набор чайных ложек Baguette 3 предмета серебристый', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'C946Y6    ', N'Вилка столовая', N'шт.       ', 300.0000, 15, 2, 1, 1, 2, 16, N'Вилка детская столовая', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'D735T5    ', N'Ложка чайная', N'шт.       ', 220.0000, 5, 1, 1, 2, 2, 13, N'Ложка чайная ALASKA Eternum', N'D735T5.jpg')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'E732R7    ', N'Набор столовых приборов', N'шт.       ', 990.0000, 15, 7, 2, 3, 5, 6, N'Набор столовых приборов Smart Home20 Black в подарочной коробке, 4 шт', N'E732R7.jpg')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'F392G6    ', N'Набор столовых приборов', N'шт.       ', 490.0000, 10, 2, 1, 3, 4, 9, N'Apollo Набор столовых приборов Chicago 4 предмета серебристый', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'F573T5    ', N'Вилки столовые', N'шт.       ', 650.0000, 15, 4, 2, 1, 3, 4, N'Вилки столовые на блистере / 6 шт.', N'F573T5.jpg')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'F745K4    ', N'Столовые приборы для салата', N'шт.       ', 2000.0000, 10, 6, 1, 3, 3, 2, N'Столовые приборы для салата Orskov Lava, 2шт', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'F839R6    ', N'Ложка чайная', N'шт.       ', 400.0000, 15, 5, 2, 2, 2, 6, N'Ложка чайная DORIA Eternum', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'G304H6    ', N'Набор ложек', N'шт.       ', 500.0000, 5, 2, 2, 2, 4, 12, N'Набор ложек столовых APOLLO "Bohemica" 3 пр.', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'G387Y6    ', N'Ложка столовая', N'шт.       ', 441.0000, 5, 5, 2, 2, 4, 23, N'Ложка столовая DORIA L=195/60 мм Eternum', N'G387Y6.jpg')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'H384H3    ', N'Набор столовых приборов', N'шт.       ', 600.0000, 15, 2, 2, 3, 2, 9, N'Набор столовых приборов для торта Palette 7 предметов серебристый', N'H384H3.jpg')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'H495H6    ', N'Набор стейковых ножей', N'шт.       ', 7000.0000, 15, 6, 1, 4, 2, 15, N'Набор стейковых ножей 4 пр. в деревянной коробке', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'K437E6    ', N'Набор вилок', N'шт.       ', 530.0000, 5, 2, 2, 3, 3, 16, N'Набор вилок столовых APOLLO "Aurora" 3шт.', N'K437E6.jpg')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'L593H5    ', N'набор ножей', N'шт.       ', 1300.0000, 25, 6, 2, 3, 5, 14, N'Набор ножей Mayer & Boch, 4 шт', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'N493G6    ', N'Набор для серверовки', N'шт.       ', 2550.0000, 15, 7, 1, 3, 4, 6, N'Набор для сервировки сыра Select', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'R836H6    ', N'Набор  столовых ножей', N'шт.       ', 250.0000, 5, 3, 1, 4, 3, 16, N'Attribute Набор столовых ножей Baguette 2 предмета серебристый', N'R836H6.jpg')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'S394J5    ', N'Набор чайных ложек', N'шт.       ', 170.0000, 5, 3, 1, 3, 3, 4, N'Attribute Набор чайных ложек Chaplet 3 предмета серебристый', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'S395B5    ', N'Нож для стейка', N'шт.       ', 600.0000, 10, 2, 1, 4, 4, 15, N'Нож для стейка 11,5 см серебристый/черный', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'T793T4    ', N'Набор ложек', N'шт.       ', 250.0000, 10, 3, 1, 2, 3, 16, N'Набор столовых ложек Baguette 3 предмета серебристый', N'T793T4.jpg')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'V026J4    ', N'набор ножей', N'шт.       ', 700.0000, 15, 2, 2, 3, 3, 9, N'абор ножей для стейка и пиццы Swiss classic 2 шт. желтый', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'V403G6    ', N'Ложка чайная', N'шт.       ', 600.0000, 15, 5, 2, 2, 5, 24, N'Ложка чайная DORIA Eternum', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'V727Y6    ', N'Набор десертных ложек', N'шт.       ', 3000.0000, 10, 6, 1, 2, 4, 8, N'Набор десертных ложек на подставке Размер: 7*7*15 см', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'W295Y5    ', N'Сервировочный набор для торта', N'шт.       ', 1100.0000, 15, 3, 2, 3, 2, 16, N'Набор сервировочный для торта "Розанна"', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'W405G6    ', N'Набор столовых приборов', N'шт.       ', 1300.0000, 25, 3, 1, 3, 3, 4, N'Набор сервировочных столовых вилок Цветы', N'          ')
INSERT [dbo].[Product] ([Article], [Name], [Unit], [Cost], [MaxDiscount], [ManufacturerId], [DistributorId], [CategoryId], [Discount], [Count], [Description], [PhotoPath]) VALUES (N'А112Т4    ', N'Набор вилок', N'шт.       ', 1600.0000, 30, 4, 2, 1, 2, 6, N'Набор столовых вилок Davinci, 20 см 6 шт.', N'А112Т4.jpg')
GO
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (1, 1, N'Савицкая', N'Арина', N'Саввична', N'1y3lj8w0viop@outlook.com', N'2L6KZG')
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (2, 1, N'Мартынов', N'Максим', N'Михайлович', N'3o698uk5c0rw@tutanota.com', N'uzWC67')
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (3, 1, N'Зубов', N'Александр', N'Дамирович', N'lx24fvrt1aip@yahoo.com', N'8ntwUp')
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (4, 2, N'Попов', N'Даниил', N'Олегович', N's8z076vku95j@gmail.com', N'YOyhfR')
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (5, 2, N'Семенов', N'Михаил', N'Никитич', N'n3bxm7f2q5i4@outlook.com', N'RSbvHv')
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (6, 2, N'Дмитриева', N'Надежда', N'Вячеславовна', N'r7dztn8a5ihq@mail.com', N'rwVDh9')
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (7, 3, N'Воронцова', N'Виктория', N'Саввична', N'vofgck2m39hq@gmail.com', N'LdNyos')
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (8, 3, N'Софронов', N'Ярослав', N'Игоревич', N's6q9tevybado@yahoo.com', N'gynQMT')
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (9, 3, N'Егоров', N'Артём', N'Евгеньевич', N'p7wuls3dtq9v@yahoo.com', N'AtnDjr')
INSERT [dbo].[User] ([Id], [Role], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (10, 3, N'Ситникова', N'Эмилия', N'Степановна', N'rdn04s1u2ckb@mail.com', N'JlFRCZ')
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderPoint] FOREIGN KEY([OrderPointId])
REFERENCES [dbo].[OrderPoint] ([Id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderList]  WITH CHECK ADD  CONSTRAINT [FK_OrderList_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[OrderList] CHECK CONSTRAINT [FK_OrderList_Order]
GO
ALTER TABLE [dbo].[OrderList]  WITH CHECK ADD  CONSTRAINT [FK_OrderList_Product] FOREIGN KEY([ProductArticle])
REFERENCES [dbo].[Product] ([Article])
GO
ALTER TABLE [dbo].[OrderList] CHECK CONSTRAINT [FK_OrderList_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Distributor] FOREIGN KEY([DistributorId])
REFERENCES [dbo].[Distributor] ([Id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Distributor]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturer] ([Id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
