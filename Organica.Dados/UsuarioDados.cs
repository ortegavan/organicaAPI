using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Dapper;
using Organica.Entidade;

namespace Organica.Dados
{
	public class UsuarioDados : DBUtils
	{
		public UsuarioDados()
		{
		}

		public void Inserir(UsuarioInfo usuario)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				var parameters = new DynamicParameters();
				parameters.Add("Codigo", usuario.Codigo, direction: ParameterDirection.Output);
				parameters.AddDynamicParams(usuario);
				conn.Execute($"dbo.UsuarioInserir", parameters, commandType: CommandType.StoredProcedure);
				usuario.Codigo = parameters.Get<int>("Codigo");
				conn.Close();
			}
		}

		public void Atualizar(UsuarioInfo usuario)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.UsuarioAtualizar", usuario, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}

		public IList<UsuarioInfo> Listar()
		{
			IList<UsuarioInfo> usuarioLista = new List<UsuarioInfo>();
			using (IDbConnection conn = GetSqlConnection())
			{
				usuarioLista = conn.Query<UsuarioInfo>($"dbo.UsuarioListar", commandType: CommandType.StoredProcedure).ToList();
				conn.Close();
			}
			return usuarioLista;
		}

		public UsuarioInfo Consultar(int codigo)
		{
			UsuarioInfo usuario;
			using (IDbConnection conn = GetSqlConnection())
			{
				usuario = conn.Query<UsuarioInfo>($"dbo.UsuarioConsultar", new { Codigo = codigo }, commandType: CommandType.StoredProcedure).FirstOrDefault();
				conn.Close();
			}
			return (usuario == null) ? new UsuarioInfo() : usuario;
		}

		public void Excluir(int codigo)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.UsuarioExcluir", new { Codigo = codigo }, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}
	}
}