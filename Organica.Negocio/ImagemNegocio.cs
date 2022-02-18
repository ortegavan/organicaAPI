using System;
using System.Collections.Generic;
using Organica.Dados;
using Organica.Entidade;

namespace Organica.Negocio
{
	public class ImagemNegocio
	{
		private ImagemDados dados;

		public ImagemNegocio()
		{
			dados = new ImagemDados();
		}

		public void Inserir(ImagemInfo imagem)
		{
			dados.Inserir(imagem);
		}

		public void Atualizar(ImagemInfo imagem)
		{
			dados.Atualizar(imagem);
		}

		public IList<ImagemInfo> Listar(int codigoProduto)
		{
			return dados.Listar(codigoProduto);
		}

		public ImagemInfo Consultar(int codigo)
		{
			return dados.Consultar(codigo);
		}

		public void Excluir(int codigo)
		{
			dados.Excluir(codigo);
		}
	}
}