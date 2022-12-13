using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form37 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form37()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Asignatura ORDER BY idAsignatura");
        }
        private void Form37_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string semestre = textBox2.Text;
            string descripcion = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            string idCalificacion = textBox6.Text;
            consulta = "INSERT INTO Asignatura (nombre,semestre,descripcion,idUsuarioCrea,idUsuarioModifica,idCalificacion) " +
                "values('" + nombre + "', '" + semestre + "', '" + descripcion + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idCalificacion + "')";
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
            int idAsignatura = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string semestre = textBox2.Text;
            string descripcion = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            string idCalificacion = textBox6.Text;
            consulta = "UPDATE Asignatura SET nombre= '" + nombre + "',semestre = '" + semestre + "',descripcion = '" + descripcion + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "',idCalificacion = '" + idCalificacion + "' WHERE idAsignatura = " + idAsignatura.ToString();
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
            int idAsignatura = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Asignatura WHERE idAsignatura = " + idAsignatura.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form38();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form36();
            formulario.Show();
        }
    }
}
