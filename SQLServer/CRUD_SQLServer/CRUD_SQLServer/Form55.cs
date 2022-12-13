using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form55 : Form
    {

        SqlConnection conexion;
        string consulta;
        public Form55()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM AlumnoColegiatura ORDER BY idAlumnoColegiatura");
        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idAlumno = textBox1.Text;
            string idColegiatura = textBox2.Text;
            consulta = "INSERT INTO AlumnoColegiatura (idAlumno,idColegiatura) " +
                "values('" + idAlumno + "', '" + idColegiatura + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void Form55_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idAlumnoColegiatura = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idAlumno = textBox1.Text;
            string idColegiatura = textBox2.Text;
            consulta = "UPDATE AlumnoColegiatura SET idAlumno= '" + idAlumno + "',idColegiatura = '" + idColegiatura + "' WHERE idAlumnoColegiatura = " + idAlumnoColegiatura.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idAlumnoColegiatura = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM AlumnoColegiatura WHERE idAlumnoColegiatura = " + idAlumnoColegiatura.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form56();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form54();
            formulario.Show();
        }
    }
}
