using System;

namespace Organica.Entidade
{
	[Serializable]
	public class ItensPedidoInfo
	{
		public ItensPedidoInfo() { }

		public int Codigo { get; set; }

		public int CodigoPedido { get; set; }

		public int CodigoProduto { get; set; }

		public DateTime? Criacao { get; set; }

		public int Quantidade { get; set; }

		public decimal ValorUnitario { get; set; }

		public decimal ValorTotal { get; set; }
	}
}