using System;
using NUnit.Framework;
using Organica.Entidade;
using Organica.Negocio;

namespace Organica.Testes;

public class Tests
{
    [Ignore("Testado")]
    [Test]
    public void CriarCategoria()
    {
        var categoriaNegocio = new CategoriaNegocio();
        var categoria = new CategoriaInfo()
        {
            Criacao = DateTime.Now,
            Disponivel = true,
            Ordem = 1,
            Titulo = "frutas",
            Icone = "<i class=\"fa-light fa-strawberry\"></i>"
        };
        //categoriaNegocio.Inserir(categoria);

        categoria = new CategoriaInfo()
        {
            Criacao = DateTime.Now,
            Disponivel = true,
            Ordem = 2,
            Titulo = "verduras",
            Icone = "<i class=\"fa-light fa-leafy-green\"></i>"
        };
        categoriaNegocio.Inserir(categoria);

        categoria = new CategoriaInfo()
        {
            Criacao = DateTime.Now,
            Disponivel = true,
            Ordem = 3,
            Titulo = "legumes",
            Icone = "<i class=\"fa-light fa-pepper\"></i>"
        };
        categoriaNegocio.Inserir(categoria);

        categoria = new CategoriaInfo()
        {
            Criacao = DateTime.Now,
            Disponivel = true,
            Ordem = 4,
            Titulo = "ovos",
            Icone = "<i class=\"fa-light fa-egg-fried\"></i>"
        };
        categoriaNegocio.Inserir(categoria);

        categoria = new CategoriaInfo()
        {
            Criacao = DateTime.Now,
            Disponivel = true,
            Ordem = 5,
            Titulo = "temperos frescos",
            Icone = "<i class=\"fa-light fa-pepper-hot\"></i>"
        };
        categoriaNegocio.Inserir(categoria);

        categoria = new CategoriaInfo()
        {
            Criacao = DateTime.Now,
            Disponivel = true,
            Ordem = 6,
            Titulo = "leite e queijos",
            Icone = "<i class=\"fa-light fa-cheese-swiss\"></i>"
        };
        categoriaNegocio.Inserir(categoria);

        Assert.IsTrue(categoriaNegocio.Listar().Count > 0);
    }

    [Test]
    public void CriarProduto()
    {
        var produtoNegocio = new ProdutoNegocio();
        var produto = new ProdutoInfo()
        {
            Apresentacao = "400g",
            CodigoCategoria = 3,
            Criacao = DateTime.Now,
            Desconto = 5,
            Descricao = "Produto fresco, direto do produtor, o rabanete é pequeno, de sabor intenso, e dá um frescor delicioso às nossas saladas. Considerado um alimento diurético.",
            Disponivel = true,
            Epoca = true,
            Titulo = "Rabanete",
            Valor = 7.99M
        };
        //produtoNegocio.Inserir(produto);

        var imagemNegocio = new ImagemNegocio();
        var imagem = new ImagemInfo()
        {
            CodigoProduto = 1,
            Criacao = DateTime.Now,
            Extensao = ".jpg",
            Principal = true
        };
        imagemNegocio.Inserir(imagem);



        Assert.IsTrue(produtoNegocio.Listar().Count > 0);
    }
}
