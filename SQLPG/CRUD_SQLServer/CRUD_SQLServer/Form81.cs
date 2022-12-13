using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form81 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form81()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM PracticaProfesor ORDER BY idPracticaProfesor");
        }

        private void Form81_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idPracticaProfesor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idPractica = textBox1.Text;
            string idProfesor = textBox2.Text;
            consulta = "UPDATE PracticaProfesor SET idPractica= '" + idPractica + "',idProfesor = '" + idProfesor + "' WHERE idPracticaProfesor = " + idPracticaProfesor.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form80();
            formulario.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form82();
            formulario.Show();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idPractica = textBox1.Text;
            string idProfesor = textBox2.Text;
            consulta = "INSERT INTO PracticaProfesor (idPractica,idProfesor) " +
                "values('" + idPractica + "', '" + idProfesor + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idPracticaProfesor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM PracticaProfesor WHERE idPracticaProfesor = " + idPracticaProfesor.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }
    }
}
