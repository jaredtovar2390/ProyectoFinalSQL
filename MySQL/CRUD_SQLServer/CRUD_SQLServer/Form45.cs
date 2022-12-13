using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form45 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form45()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Practica ORDER BY idPractica");
        }
        private void Form45_Load(object sender, EventArgs e)
        {
            MostrarDatos();  
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string evaluacion = textBox1.Text;
            string descripcion = textBox2.Text;
            string idUsuarioCrea = textBox3.Text;
            string idUsuarioModifica = textBox4.Text;
            string idCalificacion = textBox5.Text;
            consulta = "INSERT INTO Practica (evaluacion,descripcion,idUsuarioCrea,idUsuarioModifica,idCalificacion) " +
                "values('" + evaluacion + "', '" + descripcion + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idCalificacion + "')";
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
            int idPractica = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string evaluacion = textBox1.Text;
            string descripcion = textBox2.Text;
            string idUsuarioCrea = textBox3.Text;
            string idUsuarioModifica = textBox4.Text;
            string idCalificacion = textBox5.Text;
            consulta = "UPDATE Practica SET evaluacion= '" + evaluacion + "',descripcion = '" + descripcion + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "',idCalificacion = '" + idCalificacion + "' WHERE idPractica = " + idPractica.ToString();
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
            int idPractica = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Practica WHERE idPractica = " + idPractica.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form46();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form44();
            formulario.Show();
        }
    }
}
