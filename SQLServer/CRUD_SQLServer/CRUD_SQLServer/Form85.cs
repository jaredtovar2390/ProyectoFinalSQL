using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form85 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form85()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM SinodalTesis ORDER BY idSinodalTesis");
        }
        private void Form85_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idSinodal = textBox1.Text;
            string idTesis = textBox2.Text;
            consulta = "INSERT INTO SinodalTesis (idSinodal,idTesis) " +
                "values('" + idSinodal + "', '" + idTesis + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idSinodalTesis = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idSinodal = textBox1.Text;
            string idTesis = textBox2.Text;
            consulta = "UPDATE SinodalTesis SET idSinodal= '" + idSinodal + "',idTesis = '" + idTesis + "' WHERE idSinodalTesis = " + idSinodalTesis.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idSinodalTesis = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM SinodalTesis WHERE idSinodalTesis = " + idSinodalTesis.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form84();
            formulario.Show();
        }
    }
}
