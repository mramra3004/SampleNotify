USE [DATA_NOTIFY]
GO
/****** Object:  Table [dbo].[CUSTOMER_NOTIFY_CONFIG]    Script Date: 10/1/2020 5:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER_NOTIFY_CONFIG](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppId] [nvarchar](450) NOT NULL,
	[AccountId] [varchar](50) NOT NULL,
	[NotifyConfigCode] [nvarchar](255) NOT NULL,
	[SendEmail] [bit] NOT NULL,
	[SendWeb] [bit] NOT NULL,
	[SendMobile] [bit] NOT NULL,
	[SendDesktop] [bit] NOT NULL,
 CONSTRAINT [PK_CustomerNotifyConfig] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMAILTEMPLATE]    Script Date: 10/1/2020 5:50:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMAILTEMPLATE](
	[Id] [varchar](50) NOT NULL,
	[AppId] [nvarchar](255) NOT NULL,
	[AppNotifyConfigCode] [nvarchar](255) NOT NULL,
	[GroupType] [int] NULL,
	[LanguageCulture] [nvarchar](50) NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](4000) NULL,
	[Subject] [nvarchar](255) NOT NULL,
	[HtmlBody] [nvarchar](max) NULL,
	[TextBody] [nvarchar](max) NULL,
	[BccEmailAddresses] [nvarchar](1000) NULL,
	[Priority] [int] NOT NULL,
	[DelayBeforeSend] [int] NULL,
	[MessageDelayPeriod] [int] NULL,
	[HasAttachments] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedBy] [nvarchar](450) NOT NULL,
	[CreatedByUserName] [nvarchar](256) NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](450) NULL,
	[UpdatedByUserName] [nvarchar](256) NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_EmailTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NOTIFY]    Script Date: 10/1/2020 5:50:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NOTIFY](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app_id] [nvarchar](255) NOT NULL,
	[badge] [text] NULL,
	[body] [ntext] NULL,
	[click_action] [nvarchar](255) NULL,
	[code] [nvarchar](255) NULL,
	[created_on_utc] [datetime] NULL,
	[dont_send_before_date_utc] [datetime] NULL,
	[json_data] [ntext] NULL,
	[link] [nvarchar](255) NULL,
	[list_to] [nvarchar](255) NULL,
	[list_to_type] [int] NULL,
	[list_to_type_text] [nvarchar](255) NULL,
	[priority] [int] NULL,
	[priority_text] [nvarchar](255) NULL,
	[ref_code] [nvarchar](255) NULL,
	[ref_type] [nvarchar](255) NULL,
	[require_interaction] [bit] NULL,
	[routing_key] [nvarchar](255) NULL,
	[send_status] [int] NULL,
	[send_status_text] [nvarchar](255) NULL,
	[sent_on_utc] [datetime] NULL,
	[sent_tries] [int] NULL,
	[sound] [nvarchar](255) NULL,
	[title] [nvarchar](255) NULL,
 CONSTRAINT [PK_NOTIFY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NOTIFY_CONFIG]    Script Date: 10/1/2020 5:50:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NOTIFY_CONFIG](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[GroupId] [int] NOT NULL,
	[Description] [nvarchar](4000) NULL,
	[Active] [bit] NOT NULL,
	[Required] [bit] NOT NULL,
 CONSTRAINT [PK_NotifyConfig] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NOTIFY_CONFIG_GROUP]    Script Date: 10/1/2020 5:50:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NOTIFY_CONFIG_GROUP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Ord] [int] NOT NULL,
	[AppId] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_NOTIFY_CONFIG_GROUP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBSCRIBE_NOTIFY]    Script Date: 10/1/2020 5:50:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBSCRIBE_NOTIFY](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[fcm_token] [nvarchar](1000) NOT NULL,
	[app_id] [nvarchar](255) NOT NULL,
	[browser] [nvarchar](255) NULL,
	[created_on_utc] [datetime] NOT NULL,
	[device] [nvarchar](255) NULL,
	[device_id] [nvarchar](255) NULL,
	[device_type] [nvarchar](255) NULL,
	[last_activity_date_utc] [datetime] NULL,
	[logged_out] [bit] NOT NULL,
	[os] [nvarchar](255) NULL,
	[os_version] [nvarchar](255) NULL,
	[topic] [nvarchar](255) NULL,
	[user_id] [nvarchar](255) NULL,
	[user_name] [nvarchar](255) NULL,
 CONSTRAINT [PK__SUBSCRIB__61C3D35C9B3D13F3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CUSTOMER_NOTIFY_CONFIG] ADD  CONSTRAINT [DF_CustomerNotifyConfig_SendDesktop_1]  DEFAULT ((0)) FOR [SendDesktop]
GO
ALTER TABLE [dbo].[EMAILTEMPLATE] ADD  CONSTRAINT [DF_EmailTemplate_HasAttachments_1]  DEFAULT ((0)) FOR [HasAttachments]
GO
ALTER TABLE [dbo].[EMAILTEMPLATE] ADD  CONSTRAINT [DF_EmailTemplate_Active_1]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[EMAILTEMPLATE] ADD  CONSTRAINT [DF_EmailTemplate_DisplayOrder_1]  DEFAULT ((9999)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[SUBSCRIBE_NOTIFY] ADD  CONSTRAINT [DF_SUBSCRIBE_NOTIFY_logged_out]  DEFAULT ((0)) FOR [logged_out]
GO
ALTER TABLE [dbo].[NOTIFY_CONFIG]  WITH CHECK ADD  CONSTRAINT [FK_NOTIFY_CONFIG_NOTIFY_CONFIG_GROUP] FOREIGN KEY([GroupId])
REFERENCES [dbo].[NOTIFY_CONFIG_GROUP] ([Id])
GO
ALTER TABLE [dbo].[NOTIFY_CONFIG] CHECK CONSTRAINT [FK_NOTIFY_CONFIG_NOTIFY_CONFIG_GROUP]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã App (VD: ichiba-portal-web)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER_NOTIFY_CONFIG', @level2type=N'COLUMN',@level2name=N'AppId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CustomerId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER_NOTIFY_CONFIG', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Guid.NewGuid().ToString()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã App (VD: ichiba-portal-web)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'AppId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã thông báo của App (VD: NotifyConfigCodes.Orders.Transport.OrderPlaced)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'AppNotifyConfigCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhóm cấu hình (Enum: NotifyConfigGroup)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'GroupType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã ngôn ngữ (VD: vi-VN, en-US)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'LanguageCulture'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên Template' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tiêu đề' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'Subject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nội dung Html' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'HtmlBody'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nội dung Text' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'TextBody'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bcc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'BccEmailAddresses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Độ ưu tiên (Enum: NotifyPriority)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Delay thời gian gửi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'DelayBeforeSend'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn vị thời gian delay (Enum: MessageDelayPeriod - 0: giờ; 1: ngày)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'MessageDelayPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Có tệp đính kèm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'HasAttachments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kích hoạt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thứ tự hiển thị' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'DisplayOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id SSO người tạo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'CreatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UserName SSO người tạo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'CreatedByUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày giờ tạo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'CreatedOnUtc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id SSO người sửa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'UpdatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UserName SSO người sửa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'UpdatedByUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày giờ sửa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMAILTEMPLATE', @level2type=N'COLUMN',@level2name=N'UpdatedOnUtc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhóm cấu hình (Enum: NotifyConfigGroup)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NOTIFY_CONFIG', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
