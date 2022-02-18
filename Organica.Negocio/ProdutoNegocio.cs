using System;
using System.Collections.Generic;
using Organica.Dados;
using Organica.Entidade;

namespace Organica.Negocio
{
	public class ProdutoNegocio
	{
		private ProdutoDados dados;

		public ProdutoNegocio()
		{
			dados = new ProdutoDados();
		}

		public void Inserir(ProdutoInfo produto)
		{
			dados.Inserir(produto);
		}

		public void Atualizar(ProdutoInfo produto)
		{
			dados.Atualizar(produto);
		}

		public IList<ProdutoInfo> Listar()
		{
			return dados.Listar();
		}

		public IList<ProdutoInfo> ListarPorEpoca()
		{
			return dados.Listar(DateTime.Now);
		}

		public ProdutoInfo Consultar(int codigo)
		{
			return dados.Consultar(codigo);
		}

		public void Excluir(int codigo)
		{
			dados.Excluir(codigo);
		}
	}
}