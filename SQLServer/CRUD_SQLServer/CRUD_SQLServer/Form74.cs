using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
namespace CRUD_SQLServer
{
    public partial class Form74 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form74()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM ConvocatoriaEmpleado ORDER BY idConvocatoriaEmpleado");
        }
        private void Form74_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idConvocatoria = textBox1.Text;
            string idEmpleado = textBox2.Text;
            consulta = "INSERT INTO ConvocatoriaEmpleado (idConvocatoria,idEmpleado) " +
                "values('" + idConvocatoria + "', '" + idEmpleado + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idConvocatoriaEmpleado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idConvocatoria = textBox1.Text;
            string idEmpleado = textBox2.Text;
            consulta = "UPDATE ConvocatoriaEmpleado SET idConvocatoria= '" + idConvocatoria + "',idEmpleado = '" + idEmpleado + "' WHERE idConvocatoriaEmpleado = " + idConvocatoriaEmpleado.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idConvocatoriaEmpleado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM ConvocatoriaEmpleado WHERE idConvocatoriaEmpleado = " + idConvocatoriaEmpleado.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form75();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form73();
            formulario.Show();
        }
    }
}
