using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form61 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form61()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM AlumnoVacacion ORDER BY idAlumnoVacacion");
        }
        private void Form61_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idAlumno = textBox1.Text;
            string idVacacion = textBox2.Text;
            consulta = "INSERT INTO AlumnoVacacion (idAlumno,idVacacion) " +
                "values('" + idAlumno + "', '" + idVacacion + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idAlumnoVacacion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idAlumno = textBox1.Text;
            string idVacacion = textBox2.Text;
            consulta = "UPDATE AlumnoVacacion SET idAlumno= '" + idAlumno + "',idVacacion = '" + idVacacion + "' WHERE idAlumnoVacacion = " + idAlumnoVacacion.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idAlumnoVacacion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM AlumnoVacacion WHERE idAlumnoVacacion = " + idAlumnoVacacion.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form62();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form60();
            formulario.Show();
        }
    }
}
