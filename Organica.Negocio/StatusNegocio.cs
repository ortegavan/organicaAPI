using System;
using System.Collections.Generic;
using Organica.Dados;
using Organica.Entidade;

namespace Organica.Negocio
{
	public class StatusNegocio
	{
		private StatusDados dados;

		public StatusNegocio()
		{
			dados = new StatusDados();
		}

		public void Inserir(StatusInfo status)
		{
			dados.Inserir(status);
		}

		public void Atualizar(StatusInfo status)
		{
			dados.Atualizar(status);
		}

		public IList<StatusInfo> Listar()
		{
			return dados.Listar();
		}

		public StatusInfo Consultar(int codigo)
		{
			return dados.Consultar(codigo);
		}

		public void Excluir(int codigo)
		{
			dados.Excluir(codigo);
		}
	}
}