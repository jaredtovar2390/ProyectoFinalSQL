using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;


namespace CRUD_SQLServer
{
    public partial class Form20 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form20()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM FeriaCiencia ORDER BY idFeriaCiencia");
        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string participante = textBox1.Text;
            string apellidoPaterno = textBox2.Text;
            string apellidoMaterno = textBox3.Text;
            string especialidad = textBox4.Text;
            string universidad = textBox5.Text;
            string fecha = textBox6.Text;
            string idUsuarioCrea = textBox7.Text;
            string idUsuarioModifica = textBox8.Text;
            consulta = "INSERT INTO FeriaCiencia (participante, apellidoPaterno, apellidoMaterno, especialidad, universidad, fecha, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + participante + "', '" + apellidoPaterno + "', '" + apellidoMaterno + "', '" + especialidad + "', '" + universidad + "', '" + fecha + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();
            textBox8.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idFeriaCiencia = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string participante = textBox1.Text;
            string apellidoPaterno = textBox2.Text;
            string apellidoMaterno = textBox3.Text;
            string especialidad = textBox4.Text;
            string universidad = textBox5.Text;
            string fecha = textBox6.Text;
            string idUsuarioCrea = textBox7.Text;
            string idUsuarioModifica = textBox8.Text;
            consulta = "UPDATE FeriaCiencia SET participante= '" + participante + "',apellidoPaterno = '" + apellidoPaterno + "',apellidoMaterno = '" + apellidoMaterno + "',especialidad = '" + especialidad + "',universidad = '" + universidad + "',fecha = '" + fecha + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idFeriaCiencia = " + idFeriaCiencia.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();
            textBox8.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idEquipo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM FeriaCiencia WHERE idFeriaCiencia = " + idEquipo.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void Form20_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form19();
            formulario.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form21();
            formulario.Show();
        }
    }
}
