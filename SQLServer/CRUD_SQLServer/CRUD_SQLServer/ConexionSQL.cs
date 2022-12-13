﻿using System;
using System.Data.SqlClient;
using System.Data;
using System.Threading.Tasks;

namespace CRUD_SQLServer
{
    class ConexionSQL
    {
        public static SqlConnection conexion = new SqlConnection();
        static string servidor = "DESKTOP-KB3P8F9\\SQLEXPRESS";
        static string bd = "Universidad";
        static string ususario = "sa";
        static string password = "12345678";


        static String cadenaConexion = "server=" + servidor + ";" + "user id =" + ususario + ";" + "password=" + password + ";" + "database=" + bd + ";";

        private static void conectar()
        {
            try
            {
                conexion.ConnectionString = cadenaConexion;
                conexion.Open();
                //MessageBox.Show("Se conecto correctamente la base de datos");
            }
            catch (SqlException e)
            {

            }
        }
        public static DataTable ejecutaConsultaSelect(string consulta)
        {
            conectar();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "tabla");
            conexion.Close();
            return ds.Tables["tabla"];
        }
        public static void ejecutaConsulta(string consulta)
        {
            conectar();
            SqlCommand comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
        }
    }
}
