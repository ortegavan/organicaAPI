SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CategoriaListar]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, Criacao, Alteracao, Titulo, Icone, Ordem, Disponivel
	FROM dbo.Categoria
    WHERE Disponivel = 1 
    ORDER BY Ordem 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProdutoListarPorEpoca]
    @DataAtual datetime
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, CodigoCategoria, Criacao, Alteracao, Titulo, Descricao, Valor, Desconto, InicioEpoca, FimEpoca, Epoca, Apresentacao, Disponivel
	FROM dbo.Produto
    WHERE Disponivel = 1
    AND (Epoca = 1 OR @DataAtual BETWEEN InicioEpoca AND FimEpoca)
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ImagemListar]
    @CodigoProduto int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Codigo, CodigoProduto, Criacao, Alteracao, Ordem, Principal, Extensao, Peso
	FROM dbo.Imagem
    WHERE CodigoProduto = @CodigoProduto
    ORDER BY Ordem
END
GO
