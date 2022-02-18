using System;
using System.Collections.Generic;
using Organica.Dados;
using Organica.Entidade;

namespace Organica.Negocio
{
	public class ItensPedidoNegocio
	{
		private ItensPedidoDados dados;

		public ItensPedidoNegocio()
		{
			dados = new ItensPedidoDados();
		}

		public void Inserir(ItensPedidoInfo itensPedido)
		{
			dados.Inserir(itensPedido);
		}

		public void Atualizar(ItensPedidoInfo itensPedido)
		{
			dados.Atualizar(itensPedido);
		}

		public IList<ItensPedidoInfo> Listar()
		{
			return dados.Listar();
		}

		public ItensPedidoInfo Consultar(int codigo)
		{
			return dados.Consultar(codigo);
		}

		public void Excluir(int codigo)
		{
			dados.Excluir(codigo);
		}
	}
}