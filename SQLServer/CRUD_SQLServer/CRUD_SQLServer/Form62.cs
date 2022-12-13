using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;


namespace CRUD_SQLServer
{
    public partial class Form62 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form62()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM AlumnoProyecto ORDER BY idAlumnoProyecto");
        }
        private void Form62_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idAlumno = textBox1.Text;
            string idProyecto = textBox2.Text;
            consulta = "INSERT INTO AlumnoProyecto (idAlumno,idProyecto) " +
                "values('" + idAlumno + "', '" + idProyecto + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idAlumnoProyecto = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idAlumno = textBox1.Text;
            string idProyecto = textBox2.Text;
            consulta = "UPDATE AlumnoProyecto SET idAlumno= '" + idAlumno + "',idProyecto = '" + idProyecto + "' WHERE idAlumnoProyecto = " + idAlumnoProyecto.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idAlumnoProyecto = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM AlumnoProyecto WHERE idAlumnoProyecto = " + idAlumnoProyecto.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form63();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form61();
            formulario.Show();
        }
    }
}
