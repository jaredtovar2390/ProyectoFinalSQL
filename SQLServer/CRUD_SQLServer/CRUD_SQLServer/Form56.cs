using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form56 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form56()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM AlumnoKardex ORDER BY idAlumnoKardex");
        }
        private void Form56_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idAlumno = textBox1.Text;
            string idKardex = textBox2.Text;
            consulta = "INSERT INTO AlumnoKardex (idAlumno,idKardex) " +
                "values('" + idAlumno + "', '" + idKardex + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idAlumnoKardex = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idAlumno = textBox1.Text;
            string idKardex = textBox2.Text;
            consulta = "UPDATE AlumnoKardex SET idAlumno= '" + idAlumno + "',idKardex = '" + idKardex + "' WHERE idAlumnoKardex = " + idAlumnoKardex.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idAlumnoKardex = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM AlumnoKardex WHERE idAlumnoKardex = " + idAlumnoKardex.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form57();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form55();
            formulario.Show();
        }
    }
}
