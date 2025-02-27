USE [antmgr]
GO
/****** Object:  Table [dbo].[system_menu]    Script Date: 2019/7/2 10:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_menu](
	[Tid] [bigint] IDENTITY(1,1) NOT NULL,
	[DataChangeLastTime] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ParentTid] [bigint] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Ico] [nvarchar](100) NULL,
	[Url] [nvarchar](200) NULL,
	[OrderRule] [int] NULL,
	[Level] [int] NULL,
	[Class] [nvarchar](100) NULL,
 CONSTRAINT [PK_system_menu] PRIMARY KEY CLUSTERED 
(
	[Tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_page_action]    Script Date: 2019/7/2 10:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_page_action](
	[Tid] [bigint] IDENTITY(1,1) NOT NULL,
	[DataChangeLastTime] [datetime] NOT NULL,
	[MenuTid] [bigint] NOT NULL,
	[ActionId] [nvarchar](100) NULL,
	[ActionName] [nvarchar](255) NULL,
	[ControlName] [nvarchar](255) NULL,
 CONSTRAINT [PK_system_page_action] PRIMARY KEY CLUSTERED 
(
	[Tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_role]    Script Date: 2019/7/2 10:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_role](
	[Tid] [bigint] IDENTITY(1,1) NOT NULL,
	[DataChangeLastTime] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[MenuRights] [nvarchar](150) NULL,
	[ActionList] [ntext] NULL,
	[CreateUser] [nvarchar](20) NULL,
	[CreateRoleTid] [bigint] NOT NULL,
	[RoleName] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_system_role] PRIMARY KEY CLUSTERED 
(
	[Tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_users]    Script Date: 2019/7/2 10:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_users](
	[Tid] [bigint] IDENTITY(1,1) NOT NULL,
	[DataChangeLastTime] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Eid] [nvarchar](36) NULL,
	[UserName] [nvarchar](50) NULL,
	[Pwd] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[LoginIp] [nvarchar](30) NULL,
	[MenuRights] [nvarchar](150) NULL,
	[RoleTid] [bigint] NOT NULL,
	[LastLoginTime] [datetime] NULL,
	[UserAgent] [nvarchar](500) NULL,
	[CreateRoleName] [nvarchar](500) NULL,
	[CreateUser] [nvarchar](50) NULL,
 CONSTRAINT [PK_system_users] PRIMARY KEY CLUSTERED 
(
	[Tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[system_menu] ADD  CONSTRAINT [DF_system_menu_DataChangeLastTime]  DEFAULT (getdate()) FOR [DataChangeLastTime]
GO
ALTER TABLE [dbo].[system_menu] ADD  CONSTRAINT [DF_system_menu_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[system_menu] ADD  CONSTRAINT [DF_system_menu_ParentTid]  DEFAULT ((0)) FOR [ParentTid]
GO
ALTER TABLE [dbo].[system_page_action] ADD  CONSTRAINT [DF_system_page_action_DataChangeLastTime]  DEFAULT (getdate()) FOR [DataChangeLastTime]
GO
ALTER TABLE [dbo].[system_page_action] ADD  CONSTRAINT [DF_system_page_action_MenuTid]  DEFAULT ((0)) FOR [MenuTid]
GO
ALTER TABLE [dbo].[system_role] ADD  CONSTRAINT [DF_system_role_DataChangeLastTime]  DEFAULT (getdate()) FOR [DataChangeLastTime]
GO
ALTER TABLE [dbo].[system_role] ADD  CONSTRAINT [DF_system_role_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[system_role] ADD  CONSTRAINT [DF_system_role_CreateRoleTid]  DEFAULT ((0)) FOR [CreateRoleTid]
GO
ALTER TABLE [dbo].[system_users] ADD  CONSTRAINT [DF_system_users_DataChangeLastTime]  DEFAULT (getdate()) FOR [DataChangeLastTime]
GO
ALTER TABLE [dbo].[system_users] ADD  CONSTRAINT [DF_system_users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[system_users] ADD  CONSTRAINT [DF_system_users_RoleTid]  DEFAULT ((0)) FOR [RoleTid]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MenuId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_menu', @level2type=N'COLUMN',@level2name=N'Tid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_menu', @level2type=N'COLUMN',@level2name=N'DataChangeLastTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_menu', @level2type=N'COLUMN',@level2name=N'IsActive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_menu', @level2type=N'COLUMN',@level2name=N'ParentTid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_menu', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'展示的图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_menu', @level2type=N'COLUMN',@level2name=N'Ico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'连接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_menu', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_menu', @level2type=N'COLUMN',@level2name=N'OrderRule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_menu', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'样式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_menu', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统菜单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_menu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_page_action', @level2type=N'COLUMN',@level2name=N'Tid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_page_action', @level2type=N'COLUMN',@level2name=N'DataChangeLastTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'访问路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_page_action', @level2type=N'COLUMN',@level2name=N'MenuTid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ActionId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_page_action', @level2type=N'COLUMN',@level2name=N'ActionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ActionName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_page_action', @level2type=N'COLUMN',@level2name=N'ActionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ControlName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_page_action', @level2type=N'COLUMN',@level2name=N'ControlName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单按钮' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_page_action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_role', @level2type=N'COLUMN',@level2name=N'Tid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_role', @level2type=N'COLUMN',@level2name=N'DataChangeLastTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_role', @level2type=N'COLUMN',@level2name=N'IsActive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_role', @level2type=N'COLUMN',@level2name=N'MenuRights'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按钮等权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_role', @level2type=N'COLUMN',@level2name=N'ActionList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_role', @level2type=N'COLUMN',@level2name=N'CreateUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者的角色Tid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_role', @level2type=N'COLUMN',@level2name=N'CreateRoleTid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_role', @level2type=N'COLUMN',@level2name=N'RoleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_role', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_users', @level2type=N'COLUMN',@level2name=N'Tid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_users', @level2type=N'COLUMN',@level2name=N'DataChangeLastTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_users', @level2type=N'COLUMN',@level2name=N'IsActive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登陆名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_users', @level2type=N'COLUMN',@level2name=N'Eid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_users', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_users', @level2type=N'COLUMN',@level2name=N'Pwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_users', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登陆IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_users', @level2type=N'COLUMN',@level2name=N'LoginIp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_users', @level2type=N'COLUMN',@level2name=N'MenuRights'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色Tid(一个人只有一个角色)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_users', @level2type=N'COLUMN',@level2name=N'RoleTid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录系统时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_users', @level2type=N'COLUMN',@level2name=N'LastLoginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录的浏览器信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_users', @level2type=N'COLUMN',@level2name=N'UserAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建的角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_users', @level2type=N'COLUMN',@level2name=N'CreateRoleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_users', @level2type=N'COLUMN',@level2name=N'CreateUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'后台系统用户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'system_users'
GO

INSERT INTO dbo.system_menu ( DataChangeLastTime, IsActive, ParentTid, Name, Ico, Url, OrderRule, Level, Class) VALUES ( '2019-05-15 18:59:43.000', 1, 0, '系统管理', null, '#', 3, 1, 'glyphicon glyphicon-cog'); 
INSERT INTO dbo.system_menu ( DataChangeLastTime, IsActive, ParentTid, Name, Ico, Url, OrderRule, Level, Class) VALUES ( '2019-07-01 13:49:10.000', 1, 1, '菜单管理', null, '~/Home/MenuList', 1, 2, 'fa fa-reorder'); 
INSERT INTO dbo.system_menu ( DataChangeLastTime, IsActive, ParentTid, Name, Ico, Url, OrderRule, Level, Class) VALUES ( '2019-07-01 13:49:52.000', 1, 1, '权限配置', null, '~/Role/RoleAction', 2, 2, 'fa fa-shield'); 
INSERT INTO dbo.system_menu ( DataChangeLastTime, IsActive, ParentTid, Name, Ico, Url, OrderRule, Level, Class) VALUES ( '2019-07-01 13:52:58.000', 1, 1, '角色管理', null, '~/Role/RoleList', 3, 2, 'fa fa-th-large');
INSERT INTO dbo.system_menu ( DataChangeLastTime, IsActive, ParentTid, Name, Ico, Url, OrderRule, Level, Class) VALUES ( '2019-07-01 13:53:15.000', 1, 1, '系统用户', null, '~/Account/UserList', 4, 2, 'fa fa-users');
INSERT INTO dbo.system_menu ( DataChangeLastTime, IsActive, ParentTid, Name, Ico, Url, OrderRule, Level, Class) VALUES ( '2019-07-01 13:53:32.000', 1, 1, '代码生成', null, '~/Common/CodeGen', 5, 2, 'fa fa-clone');
INSERT INTO dbo.system_users( DataChangeLastTime, IsActive, Eid, UserName, Pwd, Phone, LoginIp, MenuRights, RoleTid, LastLoginTime, UserAgent, CreateRoleName, CreateUser) VALUES ('2019-05-15 18:59:49.000', 1, 'zdyu', '俞正东', 'e10adc3949ba59abbe56e057f20f883e', '1300000000', '127.0.0.1', null, 0, '2019-07-01 13:47:55.000', 'Mozilla/5.0', null, null);
