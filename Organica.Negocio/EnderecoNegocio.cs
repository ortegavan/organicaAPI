using System;
using System.Collections.Generic;
using Organica.Dados;
using Organica.Entidade;

namespace Organica.Negocio
{
	public class EnderecoNegocio
	{
		private EnderecoDados dados;

		public EnderecoNegocio()
		{
			dados = new EnderecoDados();
		}

		public void Inserir(EnderecoInfo endereco)
		{
			dados.Inserir(endereco);
		}

		public void Atualizar(EnderecoInfo endereco)
		{
			dados.Atualizar(endereco);
		}

		public IList<EnderecoInfo> Listar()
		{
			return dados.Listar();
		}

		public EnderecoInfo Consultar(int codigo)
		{
			return dados.Consultar(codigo);
		}

		public void Excluir(int codigo)
		{
			dados.Excluir(codigo);
		}
	}
}