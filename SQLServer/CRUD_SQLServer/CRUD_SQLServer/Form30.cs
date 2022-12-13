using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
namespace CRUD_SQLServer
{
    public partial class Form30 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form30()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Toefl ORDER BY idToefl");
        }
        private void Form30_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string descripcion = textBox2.Text;
            string fecha = textBox3.Text;
            string cantidadPreguntas = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            consulta = "INSERT INTO idToefl (nombre,descripcion,fecha,cantidadPreguntas,idUsuarioCrea,idUsuarioModifica) " +
                "values('" + nombre + "', '" + descripcion + "', '" + fecha + "', '" + cantidadPreguntas + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
            int idToefl = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string descripcion = textBox2.Text;
            string fecha = textBox3.Text;
            string cantidadPreguntas = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            consulta = "UPDATE idToefl SET nombre= '" + nombre + "',descripcion = '" + descripcion + "',fecha = '" + fecha + "',cantidadPreguntas = '" + cantidadPreguntas + "',idUsuarioCrea = '" + idUsuarioCrea +
               "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idToefl = " + idToefl.ToString();
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
            int idToefl = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Toefl WHERE idToefl = " + idToefl.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form31();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form29();
            formulario.Show();
        }
    }
}
