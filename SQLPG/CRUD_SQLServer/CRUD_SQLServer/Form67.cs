using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form67 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form67()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM ColegiaturaEmpleado ORDER BY idColegiaturaEmpleado");
        }
        private void Form67_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idColegiatura = textBox1.Text;
            string idEmpleado = textBox2.Text;
            consulta = "INSERT INTO ColegiaturaEmpleado (idColegiatura,idEmpleado) " +
                "values('" + idColegiatura + "', '" + idEmpleado + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {

            int idColegiaturaEmpleado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idColegiatura = textBox1.Text;
            string idEmpleado = textBox2.Text;
            consulta = "UPDATE ColegiaturaEmpleado SET idColegiatura= '" + idColegiatura + "',idEmpleado = '" + idEmpleado + "' WHERE idColegiaturaEmpleado = " + idColegiaturaEmpleado.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idColegiaturaEmpleado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM ColegiaturaEmpleado WHERE idColegiaturaEmpleado = " + idColegiaturaEmpleado.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form68();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form66();
            formulario.Show();
        }
    }
}
