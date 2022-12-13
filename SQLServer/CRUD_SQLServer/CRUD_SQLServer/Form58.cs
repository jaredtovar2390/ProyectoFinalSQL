using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;


namespace CRUD_SQLServer
{
    public partial class Form58 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form58()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM AlumnoAsignatura ORDER BY idAlumnoAsignatura");
        }
        private void Form58_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idAlumno = textBox1.Text;
            string idAsignatura = textBox2.Text;
            consulta = "INSERT INTO AlumnoAsignatura (idAlumno,idAsignatura) " +
                "values('" + idAlumno + "', '" + idAsignatura + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idAlumnoAsignatura = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idAlumno = textBox1.Text;
            string idAsignatura = textBox2.Text;
            consulta = "UPDATE AlumnoAsignatura SET idAlumno= '" + idAlumno + "',idAsignatura = '" + idAsignatura + "' WHERE idAlumnoAsignatura = " + idAlumnoAsignatura.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idAlumnoAsignatura = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM AlumnoAsignatura WHERE idAlumnoAsignatura = " + idAlumnoAsignatura.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form59();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form57();
            formulario.Show();
        }
    }
}
