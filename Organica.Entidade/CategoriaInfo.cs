using System;

namespace Organica.Entidade
{
	[Serializable]
	public class CategoriaInfo
	{
		public CategoriaInfo() { }

		public int Codigo { get; set; }

		public DateTime? Criacao { get; set; }

		public DateTime? Alteracao { get; set; }

		public string Titulo { get; set; }

		public string Icone { get; set; }

		public int Ordem { get; set; }

		public bool Disponivel { get; set; }
	}
}