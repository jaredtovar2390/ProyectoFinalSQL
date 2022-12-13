using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form80 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form80()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM HorarioProfesor ORDER BY idHorarioProfesor");
        }
        private void Form80_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idHorario = textBox1.Text;
            string idProfesor = textBox2.Text;
            consulta = "INSERT INTO HorarioProfesor (idHorario,idProfesor) " +
                "values('" + idHorario + "', '" + idProfesor + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idHorarioProfesor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idHorario = textBox1.Text;
            string idProfesor = textBox2.Text;
            consulta = "UPDATE HorarioProfesor SET idHorario= '" + idHorario + "',idProfesor = '" + idProfesor + "' WHERE idHorarioProfesor = " + idHorarioProfesor.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idHorarioProfesor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM HorarioProfesor WHERE idHorarioProfesor = " + idHorarioProfesor.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form81();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form79();
            formulario.Show();
        }
    }
}
