using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Dapper;
using Organica.Entidade;

namespace Organica.Dados
{
	public class EnderecoDados : DBUtils
	{
		public EnderecoDados()
		{
		}

		public void Inserir(EnderecoInfo endereco)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				var parameters = new DynamicParameters();
				parameters.Add("Codigo", endereco.Codigo, direction: ParameterDirection.Output);
				parameters.AddDynamicParams(endereco);
				conn.Execute($"dbo.EnderecoInserir", parameters, commandType: CommandType.StoredProcedure);
				endereco.Codigo = parameters.Get<int>("Codigo");
				conn.Close();
			}
		}

		public void Atualizar(EnderecoInfo endereco)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.EnderecoAtualizar", endereco, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}

		public IList<EnderecoInfo> Listar()
		{
			IList<EnderecoInfo> enderecoLista = new List<EnderecoInfo>();
			using (IDbConnection conn = GetSqlConnection())
			{
				enderecoLista = conn.Query<EnderecoInfo>($"dbo.EnderecoListar", commandType: CommandType.StoredProcedure).ToList();
				conn.Close();
			}
			return enderecoLista;
		}

		public EnderecoInfo Consultar(int codigo)
		{
			EnderecoInfo endereco;
			using (IDbConnection conn = GetSqlConnection())
			{
				endereco = conn.Query<EnderecoInfo>($"dbo.EnderecoConsultar", new { Codigo = codigo }, commandType: CommandType.StoredProcedure).FirstOrDefault();
				conn.Close();
			}
			return (endereco == null) ? new EnderecoInfo() : endereco;
		}

		public void Excluir(int codigo)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.EnderecoExcluir", new { Codigo = codigo }, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}
	}
}