using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form77 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form77()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM EmpleadoServicioSocial ORDER BY idEmpleadoServicioSocial");
        }

        private void Form77_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idEmpleado = textBox1.Text;
            string idServicioSocial = textBox2.Text;
            consulta = "INSERT INTO EmpleadoServicioSocial (idEmpleado,idServicioSocial) " +
                "values('" + idEmpleado + "', '" + idServicioSocial + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idEmpleadoServicioSocial = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idEmpleado = textBox1.Text;
            string idServicioSocial = textBox2.Text;
            consulta = "UPDATE EmpleadoServicioSocial SET Empleado= '" + idEmpleado + "',idServicioSocial = '" + idServicioSocial + "' WHERE idEmpleadoServicioSocial = " + idEmpleadoServicioSocial.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idEmpleadoServicioSocial = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM EmpleadoServicioSocial WHERE idEmpleadoServicioSocial = " + idEmpleadoServicioSocial.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form78();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form76();
            formulario.Show();
        }
    }
}
