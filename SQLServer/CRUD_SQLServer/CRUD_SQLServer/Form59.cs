using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form59 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form59()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM AlumnoExamen ORDER BY idAlumnoExamen");
        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idAlumno = textBox1.Text;
            string idExamen = textBox2.Text;
            consulta = "INSERT INTO AlumnoExamen (idAlumno,idExamen) " +
                "values('" + idAlumno + "', '" + idExamen + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void Form59_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idAlumnoExamen = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idAlumno = textBox1.Text;
            string idExamen = textBox2.Text;
            consulta = "UPDATE AlumnoExamen SET idAlumno= '" + idAlumno + "',idExamen = '" + idExamen + "' WHERE idAlumnoExamen = " + idAlumnoExamen.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idAlumnoExamen = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM AlumnoExamen WHERE idAlumnoExamen = " + idAlumnoExamen.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form60();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form58();
            formulario.Show();
        }
    }
}
