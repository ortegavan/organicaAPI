/****** Object:  Table [dbo].[Categoria]    Script Date: 17/02/2022 16:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Criacao] [datetime] NOT NULL,
	[Alteracao] [datetime] NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Icone] [varchar](50) NULL,
	[Ordem] [int] NULL,
	[Disponivel] [bit] NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Endereco]    Script Date: 17/02/2022 16:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endereco](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoUsuario] [int] NOT NULL,
	[Criacao] [datetime] NOT NULL,
	[Alteracao] [datetime] NULL,
	[Destinatario] [varchar](50) NOT NULL,
	[CEP] [varchar](8) NOT NULL,
	[Logradouro] [varchar](150) NOT NULL,
	[Numero] [varchar](20) NULL,
	[SemNumero] [bit] NULL,
	[Complemento] [varchar](20) NULL,
	[Bairro] [varchar](50) NOT NULL,
	[Cidade] [varchar](50) NOT NULL,
	[UF] [varchar](2) NOT NULL,
 CONSTRAINT [PK_Endereco] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormaPagamento]    Script Date: 17/02/2022 16:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormaPagamento](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Criacao] [datetime] NOT NULL,
	[Alteracao] [datetime] NULL,
	[Titulo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FormaPagamento] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imagem]    Script Date: 17/02/2022 16:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagem](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoProduto] [int] NOT NULL,
	[Criacao] [datetime] NOT NULL,
	[Alteracao] [datetime] NULL,
	[Ordem] [int] NULL,
	[Principal] [bit] NULL,
	[Extensao] [varchar](5) NULL,
	[Peso] [int] NULL,
 CONSTRAINT [PK_Imagem] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItensPedido]    Script Date: 17/02/2022 16:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItensPedido](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoPedido] [int] NOT NULL,
	[CodigoProduto] [int] NOT NULL,
	[Criacao] [datetime] NOT NULL,
	[Quantidade] [int] NOT NULL,
	[ValorUnitario] [decimal](10, 2) NOT NULL,
	[ValorTotal] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ItensPedido] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 17/02/2022 16:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoUsuario] [int] NOT NULL,
	[CodigoEndereco] [int] NULL,
	[Criacao] [datetime] NOT NULL,
	[Alteracao] [datetime] NULL,
	[Numero] [varchar](50) NULL,
	[DataCompra] [datetime] NULL,
	[CodigoFormaPagamento] [int] NULL,
	[Parcelamento] [bit] NULL,
	[QuantidadeParcelas] [int] NULL,
	[ValorSubtotal] [decimal](10, 2) NOT NULL,
	[ValorFrete] [decimal](10, 2) NULL,
	[ValorTotal] [decimal](10, 2) NULL,
	[CodigoStatus] [int] NULL,
	[Prazo] [int] NULL,
	[Carrinho] [bit] NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 17/02/2022 16:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produto](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCategoria] [int] NOT NULL,
	[Criacao] [datetime] NOT NULL,
	[Alteracao] [datetime] NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Descricao] [varchar](500) NULL,
	[Valor] [decimal](10, 2) NOT NULL,
	[Desconto] [decimal](10, 2) NULL,
	[InicioEpoca] [datetime] NULL,
	[FimEpoca] [datetime] NULL,
	[Epoca] [bit] NULL,
	[Apresentacao] [varchar](50) NULL,
	[Disponivel] [bit] NULL,
 CONSTRAINT [PK_Produto] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 17/02/2022 16:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Criacao] [datetime] NOT NULL,
	[Alteracao] [datetime] NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Inicial] [bit] NULL,
	[Anterior] [int] NULL,
	[Proximo] [int] NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/02/2022 16:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Criacao] [datetime] NOT NULL,
	[Alteracao] [datetime] NULL,
	[Nome] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[CPF] [varchar](11) NULL,
	[Celular] [varchar](11) NULL,
	[Senha] [varchar](250) NULL,
	[Sexo] [int] NULL,
	[Nascimento] [datetime] NULL,
	[Newsletter] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Endereco]  WITH CHECK ADD  CONSTRAINT [FK_Endereco_Usuario] FOREIGN KEY([CodigoUsuario])
REFERENCES [dbo].[Usuario] ([Codigo])
GO
ALTER TABLE [dbo].[Endereco] CHECK CONSTRAINT [FK_Endereco_Usuario]
GO
ALTER TABLE [dbo].[Imagem]  WITH CHECK ADD  CONSTRAINT [FK_Imagem_Produto] FOREIGN KEY([CodigoProduto])
REFERENCES [dbo].[Produto] ([Codigo])
GO
ALTER TABLE [dbo].[Imagem] CHECK CONSTRAINT [FK_Imagem_Produto]
GO
ALTER TABLE [dbo].[ItensPedido]  WITH CHECK ADD  CONSTRAINT [FK_ItensPedido_Pedido] FOREIGN KEY([CodigoPedido])
REFERENCES [dbo].[Pedido] ([Codigo])
GO
ALTER TABLE [dbo].[ItensPedido] CHECK CONSTRAINT [FK_ItensPedido_Pedido]
GO
ALTER TABLE [dbo].[ItensPedido]  WITH CHECK ADD  CONSTRAINT [FK_ItensPedido_Produto] FOREIGN KEY([CodigoProduto])
REFERENCES [dbo].[Produto] ([Codigo])
GO
ALTER TABLE [dbo].[ItensPedido] CHECK CONSTRAINT [FK_ItensPedido_Produto]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Endereco] FOREIGN KEY([CodigoEndereco])
REFERENCES [dbo].[Endereco] ([Codigo])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Endereco]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_FormaPagamento] FOREIGN KEY([CodigoFormaPagamento])
REFERENCES [dbo].[FormaPagamento] ([Codigo])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_FormaPagamento]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Status] FOREIGN KEY([CodigoStatus])
REFERENCES [dbo].[Status] ([Codigo])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Status]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Usuario] FOREIGN KEY([CodigoUsuario])
REFERENCES [dbo].[Usuario] ([Codigo])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Usuario]
GO
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_Categoria] FOREIGN KEY([CodigoCategoria])
REFERENCES [dbo].[Categoria] ([Codigo])
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_Produto_Categoria]
GO
