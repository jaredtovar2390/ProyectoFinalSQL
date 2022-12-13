using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form70 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form70()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM ConferenciaProfesor ORDER BY idConferenciaProfesor");
        }
        private void Form70_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idConferencia = textBox1.Text;
            string idProfesor = textBox2.Text;
            consulta = "INSERT INTO ConferenciaProfesor (idConferencia,idProfesor) " +
                "values('" + idConferencia + "', '" + idProfesor + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idConferenciaProfesor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idConferencia = textBox1.Text;
            string idProfesor = textBox2.Text;
            consulta = "UPDATE ConferenciaProfesor SET idConferencia= '" + idConferencia + "',idProfesor = '" + idProfesor + "' WHERE idConferenciaProfesor = " + idConferenciaProfesor.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idConferenciaProfesor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM ConferenciaProfesor WHERE idConferenciaProfesor = " + idConferenciaProfesor.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form71();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form69();
            formulario.Show();
        }
    }
}
