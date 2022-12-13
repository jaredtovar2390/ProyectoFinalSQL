using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form53 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form53()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM AlumnoPrestamo ORDER BY idAlumnoPrestamo");
        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idAlumno = textBox1.Text;
            string idPrestamo = textBox2.Text;
            consulta = "INSERT INTO AlumnoPrestamo (idAlumno,idPrestamo) " +
                "values('" + idAlumno + "', '" + idPrestamo + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idAlumnoPrestamo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idAlumno = textBox1.Text;
            string idPrestamo = textBox2.Text;
            consulta = "UPDATE AlumnoPrestamo SET idAlumno= '" + idAlumno + "',idPrestamo = '" + idPrestamo + "' WHERE idAlumnoPrestamo = " + idAlumnoPrestamo.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idAlumnoPrestamo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM AlumnoPrestamo WHERE idAlumnoPrestamo = " + idAlumnoPrestamo.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void Form53_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form54();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form52();
            formulario.Show();
        }
    }
}
