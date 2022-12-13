using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form18 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form18()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Equipo ORDER BY idEquipo");
        }

        private void Form18_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string cantidad = textBox2.Text;
            string idUsuarioCrea = textBox3.Text;
            string idUsuarioModifica = textBox4.Text;
            consulta = "INSERT INTO Equipo (nombre, cantidad, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + nombre + "', '" + cantidad + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idEquipo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string cantidad = textBox2.Text;
            string idUsuarioCrea = textBox3.Text;
            string idUsuarioModifica = textBox4.Text;
            consulta = "UPDATE Equipo SET nombre= '" + nombre + "',cantidad = '" + cantidad + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idEquipo = " + idEquipo.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idEquipo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Equipo WHERE idEquipo = " + idEquipo.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form19();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form17();
            formulario.Show();
        }
    }
}
