using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form48 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form48()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Recurso ORDER BY idRecurso");
        }
        private void Form48_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string fechaInicio = textBox1.Text;
            string fechaFinal = textBox2.Text;
            string descripcion = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            string idAdeudo = textBox6.Text;
            consulta = "INSERT INTO Recurso (fechaInicio,fechaFinal,descripcion,idUsuarioCrea,idUsuarioModifica,idAdeudo) " +
                "values('" + fechaInicio + "', '" + fechaFinal + "', '" + descripcion + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idAdeudo + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idRecurso = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string fechaInicio = textBox1.Text;
            string fechaFinal = textBox2.Text;
            string descripcion = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            string idAdeudo = textBox6.Text;
            consulta = "UPDATE Recurso SET fechaInicio= '" + fechaInicio + "',fechaFinal = '" + fechaFinal + "',descripcion = '" + descripcion + "',idUsuarioCrea = '" + idUsuarioCrea + "',idUsuarioModifica = '" + idUsuarioModifica +
                "',idAdeudo = '" + idAdeudo + "' WHERE idRecurso = " + idRecurso.ToString();
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
            int idRecurso = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Recurso WHERE idRecurso = " + idRecurso.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form49();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form47();
            formulario.Show();
        }
    }
}
