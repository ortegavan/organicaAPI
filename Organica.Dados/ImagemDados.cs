using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Dapper;
using Organica.Entidade;

namespace Organica.Dados
{
	public class ImagemDados : DBUtils
	{
		public ImagemDados()
		{
		}

		public void Inserir(ImagemInfo imagem)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				var parameters = new DynamicParameters();
				parameters.Add("Codigo", imagem.Codigo, direction: ParameterDirection.Output);
				parameters.AddDynamicParams(imagem);
				conn.Execute($"dbo.ImagemInserir", parameters, commandType: CommandType.StoredProcedure);
				imagem.Codigo = parameters.Get<int>("Codigo");
				conn.Close();
			}
		}

		public void Atualizar(ImagemInfo imagem)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.ImagemAtualizar", imagem, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}

		public IList<ImagemInfo> Listar(int codigoProduto)
		{
			IList<ImagemInfo> imagemLista = new List<ImagemInfo>();
			using (IDbConnection conn = GetSqlConnection())
			{
				imagemLista = conn.Query<ImagemInfo>($"dbo.ImagemListar", new { CodigoProduto = codigoProduto }, commandType: CommandType.StoredProcedure).ToList();
				conn.Close();
			}
			return imagemLista;
		}

		public ImagemInfo Consultar(int codigo)
		{
			ImagemInfo imagem;
			using (IDbConnection conn = GetSqlConnection())
			{
				imagem = conn.Query<ImagemInfo>($"dbo.ImagemConsultar", new { Codigo = codigo }, commandType: CommandType.StoredProcedure).FirstOrDefault();
				conn.Close();
			}
			return (imagem == null) ? new ImagemInfo() : imagem;
		}

		public void Excluir(int codigo)
		{
			using (IDbConnection conn = GetSqlConnection())
			{
				conn.Execute($"dbo.ImagemExcluir", new { Codigo = codigo }, commandType: CommandType.StoredProcedure);
				conn.Close();
			}
		}
	}
}