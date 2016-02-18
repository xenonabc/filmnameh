using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace filmnameh.Share
{
    static public class Share
    {
        public enum Sessions
        {
            user
        }
    }
    static public class DB
    {
        static SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        static public IEnumerable<Dictionary<string, object>> ExecuteCommand(string cmd, params object[] parameters)
        {
            IEnumerable<Dictionary<string, object>> r = null;
            using (var command = new SqlCommand(cmd, conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
            {
                foreach (var p in parameters)
                    command.Parameters.Add(p);
                conn.Open();
                try
                {
                    SqlDataReader dr = command.ExecuteReader();
                    r = Serialize(dr);
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    conn.Close();
                }
            }
            return r;
        }
        static private IEnumerable<Dictionary<string, object>> Serialize(SqlDataReader reader)
        {
            var results = new List<Dictionary<string, object>>();
            var cols = new List<string>();
            for (var i = 0; i < reader.FieldCount; i++)
                cols.Add(reader.GetName(i));

            while (reader.Read())
                results.Add(SerializeRow(cols, reader));

            return results;
        }
        static private Dictionary<string, object> SerializeRow(IEnumerable<string> cols, SqlDataReader reader)
        {
            var result = new Dictionary<string, object>();
            foreach (var col in cols)
                result.Add(col, reader[col]);
            return result;
        }   
    }
}