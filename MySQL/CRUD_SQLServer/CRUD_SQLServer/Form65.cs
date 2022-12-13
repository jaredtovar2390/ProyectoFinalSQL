using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form65 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form65()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM CategoriaLibro ORDER BY idCategoriaLibro");
        }
        private void Form65_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idCategoria = textBox1.Text;
            string idLibro = textBox2.Text;
            consulta = "INSERT INTO CategoriaLibro (idCategoria,idLibro) " +
                "values('" + idCategoria + "', '" + idLibro + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idCategoriaLibro = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idCategoria = textBox1.Text;
            string idLibro = textBox2.Text;
            consulta = "UPDATE CategoriaLibro SET idCategoria= '" + idCategoria + "',idLibro = '" + idLibro + "' WHERE idCategoriaLibro = " + idCategoriaLibro.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idCategoriaLibro = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM CategoriaLibro WHERE idCategoriaLibro = " + idCategoriaLibro.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form66();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form64();
            formulario.Show();
        }
    }
}
