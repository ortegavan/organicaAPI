using System;

namespace Organica.Entidade
{
	[Serializable]
	public class EnderecoInfo
	{
		public EnderecoInfo() { }

		public int Codigo { get; set; }

		public int CodigoUsuario { get; set; }

		public DateTime? Criacao { get; set; }

		public DateTime? Alteracao { get; set; }

		public string Destinatario { get; set; }

		public string CEP { get; set; }

		public string Logradouro { get; set; }

		public string Numero { get; set; }

		public bool SemNumero { get; set; }

		public string Complemento { get; set; }

		public string Bairro { get; set; }

		public string Cidade { get; set; }

		public string UF { get; set; }
	}
}