using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form84 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form84()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM ProyectoSinodal ORDER BY idProyectoSinodal");
        }
        private void Form84_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idProyecto = textBox1.Text;
            string idSinodal = textBox2.Text;
            consulta = "INSERT INTO ProyectoSinodal (idProyecto,idSinodal) " +
                "values('" + idProyecto + "', '" + idSinodal + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idProyectoSinodal = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idProyecto = textBox1.Text;
            string idSinodal = textBox2.Text;
            consulta = "UPDATE ProyectoSinodal SET idProyecto= '" + idProyecto + "',idSinodal = '" + idSinodal + "' WHERE idProyectoSinodal = " + idProyectoSinodal.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idProyectoSinodal = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM ProyectoSinodal WHERE idProyectoSinodal = " + idProyectoSinodal.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form85();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form83();
            formulario.Show();
        }
    }
}
