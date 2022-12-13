using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form50 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form50()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Taller ORDER BY idTaller");
        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string idUsuarioCrea = textBox2.Text;
            string idUsuarioModifica = textBox3.Text;
            string idEdificio = textBox4.Text;
            consulta = "INSERT INTO Taller (nombre,idUsuarioCrea,idUsuarioModifica,idEdificio) " +
                "values('" + nombre + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idEdificio + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }

        private void Form50_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idTaller = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string idUsuarioCrea = textBox2.Text;
            string idUsuarioModifica = textBox3.Text;
            string idEdificio = textBox4.Text;
            consulta = "UPDATE Taller SET nombre= '" + nombre + "',idUsuarioCrea = '" + idUsuarioCrea + "',idUsuarioModifica = '" + idUsuarioModifica +
                "',idEdificio = '" + idEdificio + "' WHERE idTaller = " + idTaller.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idTaller = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Taller WHERE idTaller = " + idTaller.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form49();
            formulario.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form51();
            formulario.Show();
        }
    }
}
