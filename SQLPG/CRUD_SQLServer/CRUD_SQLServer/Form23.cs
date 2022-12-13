using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form23 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form23()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form24();
            formulario.Show();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string fechaInicio = textBox1.Text;
            string fechaTermina = textBox2.Text;
            string idUsuarioCrea = textBox3.Text;
            string idUsuarioModifica = textBox4.Text;
            consulta = "INSERT INTO Periodo (fechaInicio, fechaTermina, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + fechaInicio + "', '" + fechaTermina + "', '"  + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idPeriodo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Periodo WHERE idPeriodo = " + idPeriodo.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idPeriodo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string fechaInicio = textBox1.Text;
            string fechaTermina = textBox2.Text;
            string idUsuarioCrea = textBox3.Text;
            string idUsuarioModifica = textBox4.Text;
            consulta = "UPDATE Periodo SET fechaInicio= '" + fechaInicio + "',fechaTermina = '" + fechaTermina + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idPeriodo = " + idPeriodo.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form22();
            formulario.Show();
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Periodo ORDER BY idPeriodo");
        }
        private void Form23_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
    }
}
