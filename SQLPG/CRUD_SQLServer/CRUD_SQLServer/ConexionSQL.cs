using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Windows.Forms;
namespace CRUD_SQLServer
{
    class ConexionSQL
    {
        public static MySqlConnection conexion = new MySqlConnection();
        static string servidor = "localhost";
        static string bd = "Universidad";
        static string ususario = "root";
        static string password = "16mayo2002";
        static string puerto = "3306";

        static String cadenaConexion = "server=" + servidor + ";" + "user id =" + ususario + ";" + "password=" + password + ";" + "port= " + puerto + ";" + "database=" + bd + ";";

        private static void conectar()
        {
            try
            {
                conexion.ConnectionString = cadenaConexion;
                conexion.Open();
            }
            catch (MySqlException e)
            {

            }
        }
        public static DataTable ejecutaConsultaSelect(string consulta)
        {
            conectar();
            MySqlDataAdapter adaptador = new MySqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "tabla");
            conexion.Close();
            return ds.Tables["tabla"];
        }
        public static void ejecutaConsulta(string consulta)
        {
            conectar();
            MySqlCommand comando = new MySqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
        }
    }
}
