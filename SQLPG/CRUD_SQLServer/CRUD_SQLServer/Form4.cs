using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form4 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form4()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }

        private void Form4_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Calificacion ORDER BY idCalificacion");
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nota = textBox1.Text;
            string actividad = textBox2.Text;
            string idUsuarioCrea = textBox3.Text;
            string idUsuarioModifica = textBox4.Text;

            consulta = "INSERT INTO Calificacion (nota, actividad, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + nota + "', '" + actividad + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idCalificacion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nota = textBox1.Text;
            string actividad = textBox2.Text;
            string idUsuarioCrea = textBox3.Text;
            string idUsuarioModifica = textBox4.Text;
            consulta = "UPDATE Calificacion SET nota= '" + nota + "',actividad = '" + actividad + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idCalificacion = " + idCalificacion.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idCalificacion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Calificacion WHERE idCalificacion = " + idCalificacion.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form3();
            formulario.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form5();
            formulario.Show();
        }
    }
}
