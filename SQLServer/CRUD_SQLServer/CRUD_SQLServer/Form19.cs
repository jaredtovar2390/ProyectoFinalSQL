using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form19 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form19()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string link = textBox2.Text;
            string tema = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            consulta = "INSERT INTO Foro (nombre, link, tema, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + nombre + "', '" + link + "', '" + tema + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idForo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string link = textBox2.Text;
            string tema = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            consulta = "UPDATE Foro SET nombre= '" + nombre + "',link = '" + link + "',tema = '" + tema + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idForo = " + idForo.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idForo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Foro WHERE idForo = " + idForo.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void Form19_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Foro ORDER BY idForo");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form20();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form18();
            formulario.Show();
        }
    }
}
