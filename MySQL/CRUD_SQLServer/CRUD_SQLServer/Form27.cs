using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form27 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form27()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form28();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form26();
            formulario.Show();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idSeccion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Seccion WHERE idSeccion = " + idSeccion.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idSeccion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string letra = textBox1.Text;
            string numero = textBox2.Text;
            string idUsuarioCrea = textBox3.Text;
            string idUsuarioModifica = textBox4.Text;
            consulta = "UPDATE Seccion SET letra= '" + letra + "',numero = '" + numero + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idSeccion = " + idSeccion.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string letra = textBox1.Text;
            string numero = textBox2.Text;
            string idUsuarioCrea = textBox3.Text;
            string idUsuarioModifica = textBox4.Text;
            consulta = "INSERT INTO Seccion (letra, numero, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + letra + "', '" + numero + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Seccion ORDER BY idSeccion");
        }
        private void Form27_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
    }
}
