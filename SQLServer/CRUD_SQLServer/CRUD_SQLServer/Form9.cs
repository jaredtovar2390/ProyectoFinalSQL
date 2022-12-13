using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form9 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form9()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Concurso ORDER BY idConcurso");
        }

        private void btnAgregar_Click_1(object sender, EventArgs e)
        {
            string fecha = textBox1.Text;
            string responsable = textBox2.Text;
            string nombre = textBox3.Text;
            string premio = textBox4.Text;
            string descripcion = textBox5.Text;
            string idUsuarioCrea = textBox6.Text;
            string idUsuarioModifica = textBox7.Text;
            consulta = "INSERT INTO Concurso (fecha, responsable, nombre, premio, descripcion, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + fecha + "', '" + responsable + "', '" + nombre + "', '" + premio + "', '" + descripcion + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
            int idConcurso = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string fecha = textBox1.Text;
            string responsable = textBox2.Text;
            string nombre = textBox3.Text;
            string premio = textBox4.Text;
            string descripcion = textBox5.Text;
            string idUsuarioCrea = textBox6.Text;
            string idUsuarioModifica = textBox7.Text;
            consulta = "UPDATE Concurso SET fecha= '" + fecha + "',responsable = '" + responsable + "',nombre = '" + nombre + "',premio = '" + premio + "',descripcion = '" + descripcion + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idConcurso = " + idConcurso.ToString();
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
            int idConcurso = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Concurso WHERE idConcurso = " + idConcurso.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void Form9_Load_1(object sender, EventArgs e)
        {
            MostrarDatos();   
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form8();
            formulario.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form10();
            formulario.Show();
        }
    }
}
