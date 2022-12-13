using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form64 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form64()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM AutorLibro ORDER BY idAutorLibro");
        }
        private void Form64_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idAutor = textBox1.Text;
            string idLibro = textBox2.Text;
            consulta = "INSERT INTO AutorLibro (idAutor,idLibro) " +
                "values('" + idAutor + "', '" + idLibro + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idAutorLibro = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idAutor = textBox1.Text;
            string idLibro = textBox2.Text;
            consulta = "UPDATE AutorLibro SET idAutor= '" + idAutor + "',idLibro = '" + idLibro + "' WHERE idAutorLibro = " + idAutorLibro.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idAutorLibro = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM AutorLibro WHERE idAutorLibro = " + idAutorLibro.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form65();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form63();
            formulario.Show();
        }
    }
}
