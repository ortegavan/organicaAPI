using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Dapper;
using Organica.Entidade;

namespace Organica.Dados
{
	public class FormaPagamentoDados : DBUtils
	{
		public FormaPagamentoDados()
		{
		}

		public void Inserir(FormaPagamentoInfo formaPagamento)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				var parameters = new DynamicParameters();
				parameters.Add("Codigo", formaPagamento.Codigo, direction: ParameterDirection.Output);
				parameters.AddDynamicParams(formaPagamento);
				conn.Execute($"dbo.FormaPagamentoInserir", parameters, commandType: CommandType.StoredProcedure);
				formaPagamento.Codigo = parameters.Get<int>("Codigo");
				conn.Close();
			}
		}

		public void Atualizar(FormaPagamentoInfo formaPagamento)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.FormaPagamentoAtualizar", formaPagamento, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}

		public IList<FormaPagamentoInfo> Listar()
		{
			IList<FormaPagamentoInfo> formaPagamentoLista = new List<FormaPagamentoInfo>();
			using (IDbConnection conn = GetSqlConnection())
			{
				formaPagamentoLista = conn.Query<FormaPagamentoInfo>($"dbo.FormaPagamentoListar", commandType: CommandType.StoredProcedure).ToList();
				conn.Close();
			}
			return formaPagamentoLista;
		}

		public FormaPagamentoInfo Consultar(int codigo)
		{
			FormaPagamentoInfo formaPagamento;
			using (IDbConnection conn = GetSqlConnection())
			{
				formaPagamento = conn.Query<FormaPagamentoInfo>($"dbo.FormaPagamentoConsultar", new { Codigo = codigo }, commandType: CommandType.StoredProcedure).FirstOrDefault();
				conn.Close();
			}
			return (formaPagamento == null) ? new FormaPagamentoInfo() : formaPagamento;
		}

		public void Excluir(int codigo)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.FormaPagamentoExcluir", new { Codigo = codigo }, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}
	}
}