using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form57 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form57()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM AlumnoConcurso ORDER BY idAlumnoConcurso");
        }
        private void Form57_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idAlumno = textBox1.Text;
            string idConcurso = textBox2.Text;
            consulta = "INSERT INTO AlumnoConcurso (idAlumno,idConcurso) " +
                "values('" + idAlumno + "', '" + idConcurso + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idAlumnoConcurso = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM AlumnoConcurso WHERE idAlumnoConcurso = " + idAlumnoConcurso.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idAlumnoConcurso = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idAlumno = textBox1.Text;
            string idConcurso = textBox2.Text;
            consulta = "UPDATE AlumnoConcurso SET idAlumno= '" + idAlumno + "',idConcurso = '" + idConcurso + "' WHERE idAlumnoConcurso = " + idAlumnoConcurso.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form58();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form56();
            formulario.Show();
        }
    }
}
