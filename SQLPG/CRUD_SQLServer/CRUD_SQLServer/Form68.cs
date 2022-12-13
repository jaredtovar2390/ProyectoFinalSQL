using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form68 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form68()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM ConcursoEmpleado ORDER BY idConcursoEmpleado");
        }

        private void Form68_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idConcurso = textBox1.Text;
            string idEmpleado = textBox2.Text;
            consulta = "INSERT INTO ConcursoEmpleado (idConcurso,idEmpleado) " +
                "values('" + idConcurso + "', '" + idEmpleado + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idConcursoEmpleado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idConcurso = textBox1.Text;
            string idEmpleado = textBox2.Text;
            consulta = "UPDATE ConcursoEmpleado SET idConcurso= '" + idConcurso + "',idEmpleado = '" + idEmpleado + "' WHERE idConcursoEmpleado = " + idConcursoEmpleado.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idConcursoEmpleado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM ConcursoEmpleado WHERE idConcursoEmpleado = " + idConcursoEmpleado.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form69();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form67();
            formulario.Show();
        }
    }
}
