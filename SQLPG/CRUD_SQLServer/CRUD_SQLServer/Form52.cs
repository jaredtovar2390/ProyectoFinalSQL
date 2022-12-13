using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form52 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form52()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM AsignaturaCarrera ORDER BY idAsignaturaCarrera");
        }
        private void Form52_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idAsignatura = textBox1.Text;
            string idCarrera = textBox2.Text;
            consulta = "INSERT INTO AsignaturaCarrera (idAsignatura,idCarrera) " +
                "values('" + idAsignatura + "', '" + idCarrera + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idAsignaturaCarrera = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idAsignatura = textBox1.Text;
            string idCarrera = textBox2.Text;
            consulta = "UPDATE AsignaturaCarrera SET idAsignatura= '" + idAsignatura + "',idCarrera = '" + idCarrera + "' WHERE idAsignaturaCarrera = " + idAsignaturaCarrera.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idAsignaturaCarrera = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM AsignaturaCarrera WHERE idAsignaturaCarrera = " + idAsignaturaCarrera.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form53();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form51();
            formulario.Show();
        }
    }
}
