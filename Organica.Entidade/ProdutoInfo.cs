using System;

namespace Organica.Entidade
{
	[Serializable]
	public class ProdutoInfo
	{
		public ProdutoInfo() { }

		public int Codigo { get; set; }

		public int CodigoCategoria { get; set; }

		public DateTime? Criacao { get; set; }

		public DateTime? Alteracao { get; set; }

		public string Titulo { get; set; }

		public string Descricao { get; set; }

		public decimal Valor { get; set; }

		public decimal Desconto { get; set; }

		public DateTime? InicioEpoca { get; set; }

		public DateTime? FimEpoca { get; set; }

		public bool Epoca { get; set; }

		public string Apresentacao { get; set; }

		public bool Disponivel { get; set; }
	}
}