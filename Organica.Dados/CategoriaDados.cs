using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Dapper;
using Organica.Entidade;

namespace Organica.Dados
{
	public class CategoriaDados : DBUtils
	{
		public CategoriaDados()
		{
		}

		public void Inserir(CategoriaInfo categoria)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				var parameters = new DynamicParameters();
				parameters.Add("Codigo", categoria.Codigo, direction: ParameterDirection.Output);
				parameters.AddDynamicParams(categoria);
				conn.Execute($"dbo.CategoriaInserir", parameters, commandType: CommandType.StoredProcedure);
				categoria.Codigo = parameters.Get<int>("Codigo");
				conn.Close();
			}
		}

		public void Atualizar(CategoriaInfo categoria)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.CategoriaAtualizar", categoria, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}

		public IList<CategoriaInfo> Listar()
		{
			IList<CategoriaInfo> categoriaLista = new List<CategoriaInfo>();
			using (IDbConnection conn = GetSqlConnection())
			{
				categoriaLista = conn.Query<CategoriaInfo>($"dbo.CategoriaListar", commandType: CommandType.StoredProcedure).ToList();
				conn.Close();
			}
			return categoriaLista;
		}

		public CategoriaInfo Consultar(int codigo)
		{
			CategoriaInfo categoria;
			using (IDbConnection conn = GetSqlConnection())
			{
				categoria = conn.Query<CategoriaInfo>($"dbo.CategoriaConsultar", new { Codigo = codigo }, commandType: CommandType.StoredProcedure).FirstOrDefault();
				conn.Close();
			}
			return (categoria == null) ? new CategoriaInfo() : categoria;
		}

		public void Excluir(int codigo)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.CategoriaExcluir", new { Codigo = codigo }, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}
	}
}