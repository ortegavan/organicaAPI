using System;
using System.Data;
using System.Data.SqlClient;

namespace Organica.Dados
{
	public abstract class DBUtils
	{
		public DBUtils()
		{
		}

		public IDbConnection GetSqlConnection()
        {
			throw new NotImplementedException();
        }
	}
}

