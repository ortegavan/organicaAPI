using System;

namespace Organica.Entidade
{
	[Serializable]
	public class UsuarioInfo
	{
		public UsuarioInfo() { }

		public int Codigo { get; set; }

		public DateTime? Criacao { get; set; }

		public DateTime? Alteracao { get; set; }

		public string Nome { get; set; }

		public string Email { get; set; }

		public string CPF { get; set; }

		public string Celular { get; set; }

		public string Senha { get; set; }

		public Sexo Sexo { get; set; }

		public DateTime? Nascimento { get; set; }

		public bool Newsletter { get; set; }
	}
}