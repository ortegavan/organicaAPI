using System;

namespace Organica.Entidade
{
	[Serializable]
	public class FormaPagamentoInfo
	{
		public FormaPagamentoInfo() { }

		public int Codigo { get; set; }

		public DateTime? Criacao { get; set; }

		public DateTime? Alteracao { get; set; }

		public string Titulo { get; set; }
	}
}