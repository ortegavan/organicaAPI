using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Dapper;
using Organica.Entidade;

namespace Organica.Dados
{
	public class StatusDados : DBUtils
	{
		public StatusDados()
		{
		}

		public void Inserir(StatusInfo status)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				var parameters = new DynamicParameters();
				parameters.Add("Codigo", status.Codigo, direction: ParameterDirection.Output);
				parameters.AddDynamicParams(status);
				conn.Execute($"dbo.StatusInserir", parameters, commandType: CommandType.StoredProcedure);
				status.Codigo = parameters.Get<int>("Codigo");
				conn.Close();
			}
		}

		public void Atualizar(StatusInfo status)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.StatusAtualizar", status, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}

		public IList<StatusInfo> Listar()
		{
			IList<StatusInfo> statusLista = new List<StatusInfo>();
			using (IDbConnection conn = GetSqlConnection())
			{
				statusLista = conn.Query<StatusInfo>($"dbo.StatusListar", commandType: CommandType.StoredProcedure).ToList();
				conn.Close();
			}
			return statusLista;
		}

		public StatusInfo Consultar(int codigo)
		{
			StatusInfo status;
			using (IDbConnection conn = GetSqlConnection())
			{
				status = conn.Query<StatusInfo>($"dbo.StatusConsultar", new { Codigo = codigo }, commandType: CommandType.StoredProcedure).FirstOrDefault();
				conn.Close();
			}
			return (status == null) ? new StatusInfo() : status;
		}

		public void Excluir(int codigo)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.StatusExcluir", new { Codigo = codigo }, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}
	}
}