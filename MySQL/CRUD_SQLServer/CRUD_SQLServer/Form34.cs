using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form34 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form34()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Vacacion ORDER BY idVacacion");
        }

        private void Form34_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string fechaInicio = textBox1.Text;
            string fechaRegreso = textBox2.Text;
            string descripcion = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            consulta = "INSERT INTO Vacacion (fechaInicio,fechaRegreso,descripcion,idUsuarioCrea, idUsuarioModifica) " +
                "values('" + fechaInicio + "', '" + fechaRegreso + "', '" + descripcion + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
            int idVacacion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string fechaInicio = textBox1.Text;
            string fechaRegreso = textBox2.Text;
            string descripcion = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            consulta = "UPDATE Vacacion SET fechaInicio= '" + fechaInicio + "',fechaRegreso = '" + fechaRegreso + "',descripcion = '" + descripcion + "',idUsuarioCrea = '" + idUsuarioCrea +
               "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idVacacion = " + idVacacion.ToString();
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
            int idVacacion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Vacacion WHERE idVacacion = " + idVacacion.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form35();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form33();
            formulario.Show();
        }
    }
}
