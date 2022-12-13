using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form24 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form24()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Prestamo ORDER BY idPrestamo");
        }
        private void Form24_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idPrestamo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string fechaInicio = textBox1.Text;
            string fechaFinal = textBox2.Text;
            string fechaEntrega = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            consulta = "UPDATE Prestamo SET fechaInicio= '" + fechaInicio + "',fechaFinal = '" + fechaFinal + "',fechaEntrega = '" + fechaEntrega + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idPrestamo = " + idPrestamo.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string fechaInicio = textBox1.Text;
            string fechaFinal = textBox2.Text;
            string fechaEntrega = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            consulta = "INSERT INTO Prestamo (fechaInicio, fechaFinal, fechaEntrega, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + fechaInicio + "', '" + fechaFinal + "', '" + fechaEntrega + "', '"  + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
            int idPrestamo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Prestamo WHERE idPrestamo = " + idPrestamo.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form23();
            formulario.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form25();
            formulario.Show();
        }
    }
}
