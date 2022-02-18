SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.CategoriaInserir
	@Codigo int OUTPUT,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Titulo varchar(50) = NULL,
	@Icone varchar(50) = NULL,
	@Ordem int = NULL,
	@Disponivel bit = NULL
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.Categoria(Criacao, Alteracao, Titulo, Icone, Ordem, Disponivel)
	VALUES (@Criacao, @Alteracao, @Titulo, @Icone, @Ordem, @Disponivel)

	IF @@ERROR = 0
		SET @Codigo = SCOPE_IDENTITY()
	ELSE
		SET @Codigo = -1
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.CategoriaAtualizar
	@Codigo int = NULL,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Titulo varchar(50) = NULL,
	@Icone varchar(50) = NULL,
	@Ordem int = NULL,
	@Disponivel bit = NULL
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Categoria
	SET Criacao = @Criacao, Alteracao = @Alteracao, Titulo = @Titulo, Icone = @Icone, Ordem = @Ordem, Disponivel = @Disponivel
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.CategoriaListar
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, Criacao, Alteracao, Titulo, Icone, Ordem, Disponivel
	FROM dbo.Categoria
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.CategoriaConsultar
	@Codigo int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, Criacao, Alteracao, Titulo, Icone, Ordem, Disponivel
	FROM dbo.Categoria
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.CategoriaExcluir
	@Codigo int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM dbo.Categoria
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.EnderecoInserir
	@Codigo int OUTPUT,
	@CodigoUsuario int = NULL,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Destinatario varchar(50) = NULL,
	@CEP varchar(8) = NULL,
	@Logradouro varchar(150) = NULL,
	@Numero varchar(20) = NULL,
	@SemNumero bit = NULL,
	@Complemento varchar(20) = NULL,
	@Bairro varchar(50) = NULL,
	@Cidade varchar(50) = NULL,
	@UF varchar(2) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.Endereco(CodigoUsuario, Criacao, Alteracao, Destinatario, CEP, Logradouro, Numero, SemNumero, Complemento, Bairro, Cidade, UF)
	VALUES (@CodigoUsuario, @Criacao, @Alteracao, @Destinatario, @CEP, @Logradouro, @Numero, @SemNumero, @Complemento, @Bairro, @Cidade, @UF)

	IF @@ERROR = 0
		SET @Codigo = SCOPE_IDENTITY()
	ELSE
		SET @Codigo = -1
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.EnderecoAtualizar
	@Codigo int = NULL,
	@CodigoUsuario int = NULL,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Destinatario varchar(50) = NULL,
	@CEP varchar(8) = NULL,
	@Logradouro varchar(150) = NULL,
	@Numero varchar(20) = NULL,
	@SemNumero bit = NULL,
	@Complemento varchar(20) = NULL,
	@Bairro varchar(50) = NULL,
	@Cidade varchar(50) = NULL,
	@UF varchar(2) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Endereco
	SET CodigoUsuario = @CodigoUsuario, Criacao = @Criacao, Alteracao = @Alteracao, Destinatario = @Destinatario, CEP = @CEP, Logradouro = @Logradouro, Numero = @Numero, SemNumero = @SemNumero, Complemento = @Complemento, Bairro = @Bairro, Cidade = @Cidade, UF = @UF
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.EnderecoListar
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, CodigoUsuario, Criacao, Alteracao, Destinatario, CEP, Logradouro, Numero, SemNumero, Complemento, Bairro, Cidade, UF
	FROM dbo.Endereco
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.EnderecoConsultar
	@Codigo int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, CodigoUsuario, Criacao, Alteracao, Destinatario, CEP, Logradouro, Numero, SemNumero, Complemento, Bairro, Cidade, UF
	FROM dbo.Endereco
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.EnderecoExcluir
	@Codigo int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM dbo.Endereco
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.FormaPagamentoInserir
	@Codigo int OUTPUT,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Titulo varchar(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.FormaPagamento(Criacao, Alteracao, Titulo)
	VALUES (@Criacao, @Alteracao, @Titulo)

	IF @@ERROR = 0
		SET @Codigo = SCOPE_IDENTITY()
	ELSE
		SET @Codigo = -1
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.FormaPagamentoAtualizar
	@Codigo int = NULL,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Titulo varchar(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.FormaPagamento
	SET Criacao = @Criacao, Alteracao = @Alteracao, Titulo = @Titulo
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.FormaPagamentoListar
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, Criacao, Alteracao, Titulo
	FROM dbo.FormaPagamento
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.FormaPagamentoConsultar
	@Codigo int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, Criacao, Alteracao, Titulo
	FROM dbo.FormaPagamento
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.FormaPagamentoExcluir
	@Codigo int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM dbo.FormaPagamento
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.ImagemInserir
	@Codigo int OUTPUT,
	@CodigoProduto int = NULL,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Ordem int = NULL,
	@Principal bit = NULL,
	@Extensao varchar(5) = NULL,
	@Peso int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.Imagem(CodigoProduto, Criacao, Alteracao, Ordem, Principal, Extensao, Peso)
	VALUES (@CodigoProduto, @Criacao, @Alteracao, @Ordem, @Principal, @Extensao, @Peso)

	IF @@ERROR = 0
		SET @Codigo = SCOPE_IDENTITY()
	ELSE
		SET @Codigo = -1
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.ImagemAtualizar
	@Codigo int = NULL,
	@CodigoProduto int = NULL,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Ordem int = NULL,
	@Principal bit = NULL,
	@Extensao varchar(5) = NULL,
	@Peso int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Imagem
	SET CodigoProduto = @CodigoProduto, Criacao = @Criacao, Alteracao = @Alteracao, Ordem = @Ordem, Principal = @Principal, Extensao = @Extensao, Peso = @Peso
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.ImagemListar
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, CodigoProduto, Criacao, Alteracao, Ordem, Principal, Extensao, Peso
	FROM dbo.Imagem
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.ImagemConsultar
	@Codigo int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, CodigoProduto, Criacao, Alteracao, Ordem, Principal, Extensao, Peso
	FROM dbo.Imagem
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.ImagemExcluir
	@Codigo int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM dbo.Imagem
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.ItensPedidoInserir
	@Codigo int OUTPUT,
	@CodigoPedido int = NULL,
	@CodigoProduto int = NULL,
	@Criacao datetime = NULL,
	@Quantidade int = NULL,
	@ValorUnitario decimal(10,2) = NULL,
	@ValorTotal decimal(10,2) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.ItensPedido(CodigoPedido, CodigoProduto, Criacao, Quantidade, ValorUnitario, ValorTotal)
	VALUES (@CodigoPedido, @CodigoProduto, @Criacao, @Quantidade, @ValorUnitario, @ValorTotal)

	IF @@ERROR = 0
		SET @Codigo = SCOPE_IDENTITY()
	ELSE
		SET @Codigo = -1
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.ItensPedidoAtualizar
	@Codigo int = NULL,
	@CodigoPedido int = NULL,
	@CodigoProduto int = NULL,
	@Criacao datetime = NULL,
	@Quantidade int = NULL,
	@ValorUnitario decimal(10,2) = NULL,
	@ValorTotal decimal(10,2) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.ItensPedido
	SET CodigoPedido = @CodigoPedido, CodigoProduto = @CodigoProduto, Criacao = @Criacao, Quantidade = @Quantidade, ValorUnitario = @ValorUnitario, ValorTotal = @ValorTotal
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.ItensPedidoListar
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, CodigoPedido, CodigoProduto, Criacao, Quantidade, ValorUnitario, ValorTotal
	FROM dbo.ItensPedido
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.ItensPedidoConsultar
	@Codigo int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, CodigoPedido, CodigoProduto, Criacao, Quantidade, ValorUnitario, ValorTotal
	FROM dbo.ItensPedido
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.ItensPedidoExcluir
	@Codigo int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM dbo.ItensPedido
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.PedidoInserir
	@Codigo int OUTPUT,
	@CodigoUsuario int = NULL,
	@CodigoEndereco int = NULL,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Numero varchar(50) = NULL,
	@DataCompra datetime = NULL,
	@CodigoFormaPagamento int = NULL,
	@Parcelamento bit = NULL,
	@QuantidadeParcelas int = NULL,
	@ValorSubtotal decimal(10,2) = NULL,
	@ValorFrete decimal(10,2) = NULL,
	@ValorTotal decimal(10,2) = NULL,
	@CodigoStatus int = NULL,
	@Prazo int = NULL,
	@Carrinho bit = NULL
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.Pedido(CodigoUsuario, CodigoEndereco, Criacao, Alteracao, Numero, DataCompra, CodigoFormaPagamento, Parcelamento, QuantidadeParcelas, ValorSubtotal, ValorFrete, ValorTotal, CodigoStatus, Prazo, Carrinho)
	VALUES (@CodigoUsuario, @CodigoEndereco, @Criacao, @Alteracao, @Numero, @DataCompra, @CodigoFormaPagamento, @Parcelamento, @QuantidadeParcelas, @ValorSubtotal, @ValorFrete, @ValorTotal, @CodigoStatus, @Prazo, @Carrinho)

	IF @@ERROR = 0
		SET @Codigo = SCOPE_IDENTITY()
	ELSE
		SET @Codigo = -1
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.PedidoAtualizar
	@Codigo int = NULL,
	@CodigoUsuario int = NULL,
	@CodigoEndereco int = NULL,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Numero varchar(50) = NULL,
	@DataCompra datetime = NULL,
	@CodigoFormaPagamento int = NULL,
	@Parcelamento bit = NULL,
	@QuantidadeParcelas int = NULL,
	@ValorSubtotal decimal(10,2) = NULL,
	@ValorFrete decimal(10,2) = NULL,
	@ValorTotal decimal(10,2) = NULL,
	@CodigoStatus int = NULL,
	@Prazo int = NULL,
	@Carrinho bit = NULL
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Pedido
	SET CodigoUsuario = @CodigoUsuario, CodigoEndereco = @CodigoEndereco, Criacao = @Criacao, Alteracao = @Alteracao, Numero = @Numero, DataCompra = @DataCompra, CodigoFormaPagamento = @CodigoFormaPagamento, Parcelamento = @Parcelamento, QuantidadeParcelas = @QuantidadeParcelas, ValorSubtotal = @ValorSubtotal, ValorFrete = @ValorFrete, ValorTotal = @ValorTotal, CodigoStatus = @CodigoStatus, Prazo = @Prazo, Carrinho = @Carrinho
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.PedidoListar
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, CodigoUsuario, CodigoEndereco, Criacao, Alteracao, Numero, DataCompra, CodigoFormaPagamento, Parcelamento, QuantidadeParcelas, ValorSubtotal, ValorFrete, ValorTotal, CodigoStatus, Prazo, Carrinho
	FROM dbo.Pedido
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.PedidoConsultar
	@Codigo int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, CodigoUsuario, CodigoEndereco, Criacao, Alteracao, Numero, DataCompra, CodigoFormaPagamento, Parcelamento, QuantidadeParcelas, ValorSubtotal, ValorFrete, ValorTotal, CodigoStatus, Prazo, Carrinho
	FROM dbo.Pedido
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.PedidoExcluir
	@Codigo int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM dbo.Pedido
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.ProdutoInserir
	@Codigo int OUTPUT,
	@CodigoCategoria int = NULL,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Titulo varchar(50) = NULL,
	@Descricao varchar(500) = NULL,
	@Valor decimal(10,2) = NULL,
	@Desconto decimal(10,2) = NULL,
	@InicioEpoca datetime = NULL,
	@FimEpoca datetime = NULL,
	@Epoca bit = NULL,
	@Apresentacao varchar(50) = NULL,
	@Disponivel bit = NULL
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.Produto(CodigoCategoria, Criacao, Alteracao, Titulo, Descricao, Valor, Desconto, InicioEpoca, FimEpoca, Epoca, Apresentacao, Disponivel)
	VALUES (@CodigoCategoria, @Criacao, @Alteracao, @Titulo, @Descricao, @Valor, @Desconto, @InicioEpoca, @FimEpoca, @Epoca, @Apresentacao, @Disponivel)

	IF @@ERROR = 0
		SET @Codigo = SCOPE_IDENTITY()
	ELSE
		SET @Codigo = -1
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.ProdutoAtualizar
	@Codigo int = NULL,
	@CodigoCategoria int = NULL,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Titulo varchar(50) = NULL,
	@Descricao varchar(500) = NULL,
	@Valor decimal(10,2) = NULL,
	@Desconto decimal(10,2) = NULL,
	@InicioEpoca datetime = NULL,
	@FimEpoca datetime = NULL,
	@Epoca bit = NULL,
	@Apresentacao varchar(50) = NULL,
	@Disponivel bit = NULL
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Produto
	SET CodigoCategoria = @CodigoCategoria, Criacao = @Criacao, Alteracao = @Alteracao, Titulo = @Titulo, Descricao = @Descricao, Valor = @Valor, Desconto = @Desconto, InicioEpoca = @InicioEpoca, FimEpoca = @FimEpoca, Epoca = @Epoca, Apresentacao = @Apresentacao, Disponivel = @Disponivel
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.ProdutoListar
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, CodigoCategoria, Criacao, Alteracao, Titulo, Descricao, Valor, Desconto, InicioEpoca, FimEpoca, Epoca, Apresentacao, Disponivel
	FROM dbo.Produto
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.ProdutoConsultar
	@Codigo int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, CodigoCategoria, Criacao, Alteracao, Titulo, Descricao, Valor, Desconto, InicioEpoca, FimEpoca, Epoca, Apresentacao, Disponivel
	FROM dbo.Produto
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.ProdutoExcluir
	@Codigo int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM dbo.Produto
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.StatusInserir
	@Codigo int OUTPUT,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Titulo varchar(50) = NULL,
	@Inicial bit = NULL,
	@Anterior int = NULL,
	@Proximo int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.Status(Criacao, Alteracao, Titulo, Inicial, Anterior, Proximo)
	VALUES (@Criacao, @Alteracao, @Titulo, @Inicial, @Anterior, @Proximo)

	IF @@ERROR = 0
		SET @Codigo = SCOPE_IDENTITY()
	ELSE
		SET @Codigo = -1
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.StatusAtualizar
	@Codigo int = NULL,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Titulo varchar(50) = NULL,
	@Inicial bit = NULL,
	@Anterior int = NULL,
	@Proximo int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Status
	SET Criacao = @Criacao, Alteracao = @Alteracao, Titulo = @Titulo, Inicial = @Inicial, Anterior = @Anterior, Proximo = @Proximo
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.StatusListar
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, Criacao, Alteracao, Titulo, Inicial, Anterior, Proximo
	FROM dbo.Status
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.StatusConsultar
	@Codigo int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, Criacao, Alteracao, Titulo, Inicial, Anterior, Proximo
	FROM dbo.Status
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.StatusExcluir
	@Codigo int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM dbo.Status
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.UsuarioInserir
	@Codigo int OUTPUT,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Nome varchar(50) = NULL,
	@Email varchar(50) = NULL,
	@CPF varchar(11) = NULL,
	@Celular varchar(11) = NULL,
	@Senha varchar(250) = NULL,
	@Sexo int = NULL,
	@Nascimento datetime = NULL,
	@Newsletter bit = NULL
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.Usuario(Criacao, Alteracao, Nome, Email, CPF, Celular, Senha, Sexo, Nascimento, Newsletter)
	VALUES (@Criacao, @Alteracao, @Nome, @Email, @CPF, @Celular, @Senha, @Sexo, @Nascimento, @Newsletter)

	IF @@ERROR = 0
		SET @Codigo = SCOPE_IDENTITY()
	ELSE
		SET @Codigo = -1
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.UsuarioAtualizar
	@Codigo int = NULL,
	@Criacao datetime = NULL,
	@Alteracao datetime = NULL,
	@Nome varchar(50) = NULL,
	@Email varchar(50) = NULL,
	@CPF varchar(11) = NULL,
	@Celular varchar(11) = NULL,
	@Senha varchar(250) = NULL,
	@Sexo int = NULL,
	@Nascimento datetime = NULL,
	@Newsletter bit = NULL
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Usuario
	SET Criacao = @Criacao, Alteracao = @Alteracao, Nome = @Nome, Email = @Email, CPF = @CPF, Celular = @Celular, Senha = @Senha, Sexo = @Sexo, Nascimento = @Nascimento, Newsletter = @Newsletter
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.UsuarioListar
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, Criacao, Alteracao, Nome, Email, CPF, Celular, Senha, Sexo, Nascimento, Newsletter
	FROM dbo.Usuario
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.UsuarioConsultar
	@Codigo int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, Criacao, Alteracao, Nome, Email, CPF, Celular, Senha, Sexo, Nascimento, Newsletter
	FROM dbo.Usuario
	WHERE Codigo = @Codigo
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.UsuarioExcluir
	@Codigo int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM dbo.Usuario
	WHERE Codigo = @Codigo
END
GO

