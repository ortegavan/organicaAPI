using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Dapper;
using Organica.Entidade;

namespace Organica.Dados
{
	public class ProdutoDados : DBUtils
	{
		public ProdutoDados()
		{
		}

		public void Inserir(ProdutoInfo produto)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				var parameters = new DynamicParameters();
				parameters.Add("Codigo", produto.Codigo, direction: ParameterDirection.Output);
				parameters.AddDynamicParams(produto);
				conn.Execute($"dbo.ProdutoInserir", parameters, commandType: CommandType.StoredProcedure);
				produto.Codigo = parameters.Get<int>("Codigo");
				conn.Close();
			}
		}

		public void Atualizar(ProdutoInfo produto)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.ProdutoAtualizar", produto, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}

		public IList<ProdutoInfo> Listar()
		{
			IList<ProdutoInfo> produtoLista = new List<ProdutoInfo>();
			using (IDbConnection conn = GetSqlConnection())
			{
				produtoLista = conn.Query<ProdutoInfo>($"dbo.ProdutoListar", commandType: CommandType.StoredProcedure).ToList();
				conn.Close();
			}
			return produtoLista;
		}

		public IList<ProdutoInfo> Listar(DateTime data)
		{
			IList<ProdutoInfo> produtoLista = new List<ProdutoInfo>();
			using (IDbConnection conn = GetSqlConnection())
			{
				produtoLista = conn.Query<ProdutoInfo>($"dbo.ProdutoListarPorEpoca", new { DataAtual = data }, commandType: CommandType.StoredProcedure).ToList();
				conn.Close();
			}
			return produtoLista;
		}

		public ProdutoInfo Consultar(int codigo)
		{
			ProdutoInfo produto;
			using (IDbConnection conn = GetSqlConnection())
			{
				produto = conn.Query<ProdutoInfo>($"dbo.ProdutoConsultar", new { Codigo = codigo }, commandType: CommandType.StoredProcedure).FirstOrDefault();
				conn.Close();
			}
			return (produto == null) ? new ProdutoInfo() : produto;
		}

		public void Excluir(int codigo)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.ProdutoExcluir", new { Codigo = codigo }, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}
	}
}