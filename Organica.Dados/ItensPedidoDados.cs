using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Dapper;
using Organica.Entidade;

namespace Organica.Dados
{
	public class ItensPedidoDados : DBUtils
	{
		public ItensPedidoDados()
		{
		}

		public void Inserir(ItensPedidoInfo itensPedido)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				var parameters = new DynamicParameters();
				parameters.Add("Codigo", itensPedido.Codigo, direction: ParameterDirection.Output);
				parameters.AddDynamicParams(itensPedido);
				conn.Execute($"dbo.ItensPedidoInserir", parameters, commandType: CommandType.StoredProcedure);
				itensPedido.Codigo = parameters.Get<int>("Codigo");
				conn.Close();
			}
		}

		public void Atualizar(ItensPedidoInfo itensPedido)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.ItensPedidoAtualizar", itensPedido, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}

		public IList<ItensPedidoInfo> Listar()
		{
			IList<ItensPedidoInfo> itensPedidoLista = new List<ItensPedidoInfo>();
			using (IDbConnection conn = GetSqlConnection())
			{
				itensPedidoLista = conn.Query<ItensPedidoInfo>($"dbo.ItensPedidoListar", commandType: CommandType.StoredProcedure).ToList();
				conn.Close();
			}
			return itensPedidoLista;
		}

		public ItensPedidoInfo Consultar(int codigo)
		{
			ItensPedidoInfo itensPedido;
			using (IDbConnection conn = GetSqlConnection())
			{
				itensPedido = conn.Query<ItensPedidoInfo>($"dbo.ItensPedidoConsultar", new { Codigo = codigo }, commandType: CommandType.StoredProcedure).FirstOrDefault();
				conn.Close();
			}
			return (itensPedido == null) ? new ItensPedidoInfo() : itensPedido;
		}

		public void Excluir(int codigo)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.ItensPedidoExcluir", new { Codigo = codigo }, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}
	}
}