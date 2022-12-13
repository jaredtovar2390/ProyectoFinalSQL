using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form78 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form78()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM EmpleadoResidencia ORDER BY idEmpleadoResidencia");
        }
        private void Form78_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idEmpleado = textBox1.Text;
            string idResidencia = textBox2.Text;
            consulta = "INSERT INTO EmpleadoResidencia (idEmpleado,idResidencia) " +
                "values('" + idEmpleado + "', '" + idResidencia + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idEmpleadoResidencia = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idEmpleado = textBox1.Text;
            string idResidencia = textBox2.Text;
            consulta = "UPDATE EmpleadoResidencia SET idEmpleado= '" + idEmpleado + "',idResidencia = '" + idResidencia + "' WHERE idEmpleadoResidencia = " + idEmpleadoResidencia.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idEmpleadoResidencia = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM EmpleadoResidencia WHERE idEmpleadoResidencia = " + idEmpleadoResidencia.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form79();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form77();
            formulario.Show();
        }
    }
}
