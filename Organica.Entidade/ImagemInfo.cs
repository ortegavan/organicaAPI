using System;

namespace Organica.Entidade
{
	[Serializable]
	public class ImagemInfo
	{
		public ImagemInfo() { }

		public int Codigo { get; set; }

		public int CodigoProduto { get; set; }

		public DateTime? Criacao { get; set; }

		public DateTime? Alteracao { get; set; }

		public int Ordem { get; set; }

		public bool Principal { get; set; }

		public string Extensao { get; set; }

		public int Peso { get; set; }
	}
}