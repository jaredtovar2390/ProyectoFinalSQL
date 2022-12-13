using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form82 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form82()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM ProfesorProyecto ORDER BY idProfesorProyecto");
        }

        private void Form82_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idProfesor = textBox1.Text;
            string idProyecto = textBox2.Text;
            consulta = "INSERT INTO ProfesorProyecto (idProfesor,idProyecto) " +
                "values('" + idProfesor + "', '" + idProyecto + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idProfesorProyecto = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idProfesor = textBox1.Text;
            string idProyecto = textBox2.Text;
            consulta = "UPDATE ProfesorProyecto SET idProfesor= '" + idProfesor + "',idProyecto = '" + idProyecto + "' WHERE idProfesorProyecto = " + idProfesorProyecto.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idProfesorProyecto = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM ProfesorProyecto WHERE idProfesorProyecto = " + idProfesorProyecto.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form83();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form81();
            formulario.Show();
        }
    }
}
