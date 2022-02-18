using System;

namespace Organica.Entidade
{
	[Serializable]
	public class StatusInfo
	{
		public StatusInfo() { }

		public int Codigo { get; set; }

		public DateTime? Criacao { get; set; }

		public DateTime? Alteracao { get; set; }

		public string Titulo { get; set; }

		public bool Inicial { get; set; }

		public int Anterior { get; set; }

		public int Proximo { get; set; }
	}
}