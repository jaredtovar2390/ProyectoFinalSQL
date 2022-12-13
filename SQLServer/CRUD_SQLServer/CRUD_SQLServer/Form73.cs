using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form73 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form73()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM ConvocatoriaProfesor ORDER BY idConvocatoriaProfesor");
        }


        private void Form73_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idConvocatoria = textBox1.Text;
            string idProfesor = textBox2.Text;
            consulta = "INSERT INTO ConvocatoriaProfesor (idConvocatoria,idProfesor) " +
                "values('" + idConvocatoria + "', '" + idProfesor + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idConvocatoriaProfesor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idConvocatoria = textBox1.Text;
            string idProfesor = textBox2.Text;
            consulta = "UPDATE ConvocatoriaProfesor SET idConvocatoria= '" + idConvocatoria + "',idProfesor = '" + idProfesor + "' WHERE idConvocatoriaProfesor = " + idConvocatoriaProfesor.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idConvocatoriaProfesor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM ConvocatoriaProfesor WHERE idConvocatoriaProfesor = " + idConvocatoriaProfesor.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form74();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form72();
            formulario.Show();
        }
    }
}
