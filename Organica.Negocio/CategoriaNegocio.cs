using System;
using System.Collections.Generic;
using Organica.Dados;
using Organica.Entidade;

namespace Organica.Negocio
{
	public class CategoriaNegocio
	{
		private CategoriaDados dados;

		public CategoriaNegocio()
		{
			dados = new CategoriaDados();
		}

		public void Inserir(CategoriaInfo categoria)
		{
			dados.Inserir(categoria);
		}

		public void Atualizar(CategoriaInfo categoria)
		{
			dados.Atualizar(categoria);
		}

		public IList<CategoriaInfo> Listar()
		{
			return dados.Listar();
		}

		public CategoriaInfo Consultar(int codigo)
		{
			return dados.Consultar(codigo);
		}

		public void Excluir(int codigo)
		{
			dados.Excluir(codigo);
		}
	}
}