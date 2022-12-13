using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form69 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form69()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM ConferenciaEmpleado ORDER BY idConferenciaEmpleado");
        }
        private void Form69_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idConferencia = textBox1.Text;
            string idEmpleado = textBox2.Text;
            consulta = "INSERT INTO ConferenciaEmpleado (idConferencia,idEmpleado) " +
                "values('" + idConferencia + "', '" + idEmpleado + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idConferenciaEmpleado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idConferencia = textBox1.Text;
            string idEmpleado = textBox2.Text;
            consulta = "UPDATE ConferenciaEmpleado SET idConferencia= '" + idConferencia + "',idEmpleado = '" + idEmpleado + "' WHERE idConferenciaEmpleado = " + idConferenciaEmpleado.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idConferenciaEmpleado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM ConferenciaEmpleado WHERE idConferenciaEmpleado = " + idConferenciaEmpleado.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form70();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form68();
            formulario.Show();
        }
    }
}
