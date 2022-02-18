using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Dapper;
using Organica.Entidade;

namespace Organica.Dados
{
	public class PedidoDados : DBUtils
	{
		public PedidoDados()
		{
		}

		public void Inserir(PedidoInfo pedido)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				var parameters = new DynamicParameters();
				parameters.Add("Codigo", pedido.Codigo, direction: ParameterDirection.Output);
				parameters.AddDynamicParams(pedido);
				conn.Execute($"dbo.PedidoInserir", parameters, commandType: CommandType.StoredProcedure);
				pedido.Codigo = parameters.Get<int>("Codigo");
				conn.Close();
			}
		}

		public void Atualizar(PedidoInfo pedido)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.PedidoAtualizar", pedido, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}

		public IList<PedidoInfo> Listar()
		{
			IList<PedidoInfo> pedidoLista = new List<PedidoInfo>();
			using (IDbConnection conn = GetSqlConnection())
			{
				pedidoLista = conn.Query<PedidoInfo>($"dbo.PedidoListar", commandType: CommandType.StoredProcedure).ToList();
				conn.Close();
			}
			return pedidoLista;
		}

		public PedidoInfo Consultar(int codigo)
		{
			PedidoInfo pedido;
			using (IDbConnection conn = GetSqlConnection())
			{
				pedido = conn.Query<PedidoInfo>($"dbo.PedidoConsultar", new { Codigo = codigo }, commandType: CommandType.StoredProcedure).FirstOrDefault();
				conn.Close();
			}
			return (pedido == null) ? new PedidoInfo() : pedido;
		}

		public void Excluir(int codigo)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.PedidoExcluir", new { Codigo = codigo }, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}
	}
}