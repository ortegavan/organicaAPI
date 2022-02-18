using System;
using System.Collections.Generic;
using Organica.Dados;
using Organica.Entidade;

namespace Organica.Negocio
{
	public class FormaPagamentoNegocio
	{
		private FormaPagamentoDados dados;

		public FormaPagamentoNegocio()
		{
			dados = new FormaPagamentoDados();
		}

		public void Inserir(FormaPagamentoInfo formaPagamento)
		{
			dados.Inserir(formaPagamento);
		}

		public void Atualizar(FormaPagamentoInfo formaPagamento)
		{
			dados.Atualizar(formaPagamento);
		}

		public IList<FormaPagamentoInfo> Listar()
		{
			return dados.Listar();
		}

		public FormaPagamentoInfo Consultar(int codigo)
		{
			return dados.Consultar(codigo);
		}

		public void Excluir(int codigo)
		{
			dados.Excluir(codigo);
		}
	}
}