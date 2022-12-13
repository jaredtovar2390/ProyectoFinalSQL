using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form72 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form72()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM ContratoProfesor ORDER BY idContratoProfesor");
        }

        private void Form72_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idContrato = textBox1.Text;
            string idProfesor = textBox2.Text;
            consulta = "INSERT INTO ContratoProfesor (idContrato,idProfesor) " +
                "values('" + idContrato + "', '" + idProfesor + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idContratoProfesor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idContrato = textBox1.Text;
            string idProfesor = textBox2.Text;
            consulta = "UPDATE ContratoProfesor SET idContrato= '" + idContrato + "',idProfesor = '" + idProfesor + "' WHERE idContratoProfesor = " + idContratoProfesor.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idContratoProfesor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM ContratoProfesor WHERE idContratoProfesor = " + idContratoProfesor.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form73();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form71();
            formulario.Show();
        }
    }
}
