using System;
using System.Collections.Generic;
using Organica.Dados;
using Organica.Entidade;

namespace Organica.Negocio
{
	public class PedidoNegocio
	{
		private PedidoDados dados;

		public PedidoNegocio()
		{
			dados = new PedidoDados();
		}

		public void Inserir(PedidoInfo pedido)
		{
			dados.Inserir(pedido);
		}

		public void Atualizar(PedidoInfo pedido)
		{
			dados.Atualizar(pedido);
		}

		public IList<PedidoInfo> Listar()
		{
			return dados.Listar();
		}

		public PedidoInfo Consultar(int codigo)
		{
			return dados.Consultar(codigo);
		}

		public void Excluir(int codigo)
		{
			dados.Excluir(codigo);
		}
	}
}