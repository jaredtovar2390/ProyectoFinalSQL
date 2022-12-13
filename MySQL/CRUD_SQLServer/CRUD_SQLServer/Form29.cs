using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form29 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form29()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Tesis ORDER BY idTesis");
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string titulo = textBox1.Text;
            string descripcion = textBox2.Text;
            string fechaInicio = textBox3.Text;
            string fechaFinal = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            consulta = "INSERT INTO Tesis (titulo,descripcion,fechaInicio,fechaFinal,idUsuarioCrea,idUsuarioModifica) " +
                "values('" + titulo + "', '" + descripcion + "', '" + fechaInicio + "', '" + fechaFinal + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
        }

        private void Form29_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idTesis = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string titulo = textBox1.Text;
            string descripcion = textBox2.Text;
            string fechaInicio = textBox3.Text;
            string fechaFinal = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            consulta = "UPDATE Tesis SET titulo= '" + titulo + "',descripcion = '" + descripcion + "',fechaInicio = '" + fechaInicio + "',fechaFinal = '" + fechaFinal + "',idUsuarioCrea = '" + idUsuarioCrea +
               "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idTesis = " + idTesis.ToString();
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
            int idTesis = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Tesis WHERE idTesis = " + idTesis.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form30();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form28();
            formulario.Show();
        }
    }
}
