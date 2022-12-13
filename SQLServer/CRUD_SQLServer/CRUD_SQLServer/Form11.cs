using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form11 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form11()
        {

            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Contrato ORDER BY idContrato");
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string fechaInicio = textBox1.Text;
            string fechaVencimiento = textBox2.Text;
            string nombre = textBox3.Text;
            string titulo = textBox4.Text;
            string razon = textBox5.Text;
            string idUsuarioCrea = textBox6.Text;
            string idUsuarioModifica = textBox7.Text;
            consulta = "INSERT INTO Contrato (fechaInicio, fechaVencimiento, nombre, titulo, razon, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + fechaInicio + "', '" + fechaVencimiento + "', '" + nombre + "', '" + titulo + "', '" + razon + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idContrato = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string fechaInicio = textBox1.Text;
            string fechaVencimiento = textBox2.Text;
            string nombre = textBox3.Text;
            string titulo = textBox4.Text;
            string razon = textBox5.Text;
            string idUsuarioCrea = textBox6.Text;
            string idUsuarioModifica = textBox7.Text;
            consulta = "UPDATE Contrato SET fechaInicio= '" + fechaInicio + "',fechaVencimiento = '" + fechaVencimiento + "',nombre = '" + nombre + "',titulo = '" + titulo + "',razon = '" + razon + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idContrato = " + idContrato.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idContrato = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Contrato WHERE idContrato = " + idContrato.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void Form11_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form12();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form10();
            formulario.Show();
        }
    }
}
