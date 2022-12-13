using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form40 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form40()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Carrera ORDER BY idCarrera");
        }

        private void Form40_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string cantidadSemestre = textBox2.Text;
            string descripcion = textBox3.Text;
            string cantidadAsignatura = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            string idPeriodo = textBox7.Text;
            consulta = "INSERT INTO Carrera (nombre,cantidadSemestre,descripcion,cantidadAsignatura,idUsuarioCrea,idUsuarioModifica,idPeriodo) " +
                "values('" + nombre + "', '" + cantidadSemestre + "', '" + descripcion + "', '" + cantidadAsignatura + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idPeriodo + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idCarrera = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string cantidadSemestre = textBox2.Text;
            string descripcion = textBox3.Text;
            string cantidadAsignatura = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            string idPeriodo = textBox7.Text;
            consulta = "UPDATE Carrera SET nombre= '" + nombre + "',cantidadSemestre = '" + cantidadSemestre + "',descripcion = '" + descripcion + "',cantidadAsignatura = '" + cantidadAsignatura + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "',idPeriodo = '" + idPeriodo + "' WHERE idCarrera = " + idCarrera.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idCarrera = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Carrera WHERE idCarrera = " + idCarrera.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form41();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form39();
            formulario.Show();
        }
    }
}
