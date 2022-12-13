using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form76 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form76()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM EmpleadoKardex ORDER BY idEmpleadoKardex");
        }
        private void Form76_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idEmpleado = textBox1.Text;
            string idKardex = textBox2.Text;
            consulta = "INSERT INTO EmpleadoKardex (idEmpleado,idKardex) " +
                "values('" + idEmpleado + "', '" + idKardex + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idEmpleadoKardex = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idEmpleado = textBox1.Text;
            string idKardex = textBox2.Text;
            consulta = "UPDATE EmpleadoKaredx SET idEmpleado= '" + idEmpleado + "',idKardex = '" + idKardex + "' WHERE idEmpleadoKardex = " + idEmpleadoKardex.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idEditorialLibro = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM EditorialLibro WHERE idEditorialLibro = " + idEditorialLibro.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form77();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form75();
            formulario.Show();
        }
    }
}
