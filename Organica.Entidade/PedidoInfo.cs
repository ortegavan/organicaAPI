using System;

namespace Organica.Entidade
{
	[Serializable]
	public class PedidoInfo
	{
		public PedidoInfo() { }

		public int Codigo { get; set; }

		public int CodigoUsuario { get; set; }

		public int CodigoEndereco { get; set; }

		public DateTime? Criacao { get; set; }

		public DateTime? Alteracao { get; set; }

		public string Numero { get; set; }

		public DateTime? DataCompra { get; set; }

		public int CodigoFormaPagamento { get; set; }

		public bool Parcelamento { get; set; }

		public int QuantidadeParcelas { get; set; }

		public decimal ValorSubtotal { get; set; }

		public decimal ValorFrete { get; set; }

		public decimal ValorTotal { get; set; }

		public int CodigoStatus { get; set; }

		public int Prazo { get; set; }

		public bool Carrinho { get; set; }
	}
}