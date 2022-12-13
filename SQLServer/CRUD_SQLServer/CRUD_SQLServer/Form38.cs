using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form38 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form38()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Area ORDER BY idArea");
        }
        private void Form38_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string descripcion = textBox1.Text;
            string nombre = textBox2.Text;
            string idUsuarioCrea = textBox3.Text;
            string idUsuarioModifica = textBox4.Text;
            string idTipoArea = textBox5.Text;
            string idEdificio = textBox6.Text;
            consulta = "INSERT INTO Area (descripcion,nombre,idUsuarioCrea,idUsuarioModifica,idTipoArea,idEdificio) " +
                "values('" + descripcion + "', '" + nombre + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idTipoArea + "', '" + idEdificio + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idArea = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string descripcion = textBox1.Text;
            string nombre = textBox2.Text;
            string idUsuarioCrea = textBox3.Text;
            string idUsuarioModifica = textBox4.Text;
            string idTipoArea = textBox5.Text;
            string idEdificio = textBox6.Text;
            consulta = "UPDATE Area SET descripcion= '" + descripcion + "',nombre = '" + nombre + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "',idTipoArea = '" + idTipoArea + "',idEdificio = '" + idEdificio + "' WHERE idArea = " + idArea.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idArea = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Area WHERE idArea = " + idArea.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form37();
            formulario.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form39();
            formulario.Show();
        }
    }
}
