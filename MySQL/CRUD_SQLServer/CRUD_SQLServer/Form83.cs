using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form83 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form83()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM ProfesorVacacion ORDER BY idProfesorVacacion");
        }
        private void Form83_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idProfesor = textBox1.Text;
            string idVacacion = textBox2.Text;
            consulta = "INSERT INTO ProfesorVacacion (idProfesor,idVacacion) " +
                "values('" + idProfesor + "', '" + idVacacion + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idProfesorVacacion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idProfesor = textBox1.Text;
            string idVacacion = textBox2.Text;
            consulta = "UPDATE ProfesorVacacion SET idProfesor= '" + idProfesor + "',idVacacion = '" + idVacacion + "' WHERE idProfesorVacacion = " + idProfesorVacacion.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idProfesorVacacion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM ProfesorVacacion WHERE idProfesorVacacion = " + idProfesorVacacion.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form84();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form82();
            formulario.Show();
        }
    }
}
