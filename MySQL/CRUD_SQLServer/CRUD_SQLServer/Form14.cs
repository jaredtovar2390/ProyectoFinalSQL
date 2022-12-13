using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form14 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form14()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string cantidad = textBox1.Text;
            string responsable = textBox2.Text;
            string motivo = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            consulta = "INSERT INTO Credito (cantidad, responsable, motivo, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + cantidad + "', '" + responsable + "', '" + motivo + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox5.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idCredito = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string cantidad = textBox1.Text;
            string responsable = textBox2.Text;
            string motivo = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            consulta = "UPDATE Credito SET cantidad= '" + cantidad + "',responsable = '" + responsable + "',motivo = '" + motivo + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idCredito = " + idCredito.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox5.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idCredito = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Credito WHERE idCredito = " + idCredito.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Credito ORDER BY idCredito");
        }

        private void Form14_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form15();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form13();
            formulario.Show();
        }
    }
}
