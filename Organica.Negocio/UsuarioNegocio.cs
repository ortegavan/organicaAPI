using System;
using System.Collections.Generic;
using Organica.Dados;
using Organica.Entidade;

namespace Organica.Negocio
{
	public class UsuarioNegocio
	{
		private UsuarioDados dados;

		public UsuarioNegocio()
		{
			dados = new UsuarioDados();
		}

		public void Inserir(UsuarioInfo usuario)
		{
			dados.Inserir(usuario);
		}

		public void Atualizar(UsuarioInfo usuario)
		{
			dados.Atualizar(usuario);
		}

		public IList<UsuarioInfo> Listar()
		{
			return dados.Listar();
		}

		public UsuarioInfo Consultar(int codigo)
		{
			return dados.Consultar(codigo);
		}

		public void Excluir(int codigo)
		{
			dados.Excluir(codigo);
		}
	}
}