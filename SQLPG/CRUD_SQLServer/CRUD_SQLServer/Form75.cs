using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form75 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form75()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM EditorialLibro ORDER BY idEditorialLibro");
        }
        private void Form75_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idEditorial = textBox1.Text;
            string idLibro = textBox2.Text;
            consulta = "INSERT INTO EditorialLibro (idEditorial,idLibro) " +
                "values('" + idEditorial + "', '" + idLibro + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idEditorialLibro = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idEditorial = textBox1.Text;
            string idLibro = textBox2.Text;
            consulta = "UPDATE EditorialLibro SET idEditorial= '" + idEditorial + "',idLibro = '" + idLibro + "' WHERE idEditorialLibro = " + idEditorialLibro.ToString();
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
            Form formulario = new Form76();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form74();
            formulario.Show();
        }
    }
}
