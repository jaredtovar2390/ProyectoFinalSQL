using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form71 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form71()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM ContratoEmpleado ORDER BY idContratoEmpleado");
        }
        private void Form71_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idContrato = textBox1.Text;
            string idEmpleado = textBox2.Text;
            consulta = "INSERT INTO ContratoEmpleado (idContrato,idEmpleado) " +
                "values('" + idContrato + "', '" + idEmpleado + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();

        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idContratoEmpleado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idContrato = textBox1.Text;
            string idEmpleado = textBox2.Text;
            consulta = "UPDATE ContratoEmpleado SET idContrato= '" + idContrato + "',idEmpleado = '" + idEmpleado + "' WHERE idContratoEmpleado = " + idContratoEmpleado.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idContratoEmpleado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM ContratoEmpleado WHERE idContratoEmpleado = " + idContratoEmpleado.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form72();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form70();
            formulario.Show();
        }
    }
}
