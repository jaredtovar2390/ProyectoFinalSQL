using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;


namespace CRUD_SQLServer
{
    public partial class Form13 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form13()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }

        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM CredencialEscolar ORDER BY idCredencialEscolar");
        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string vigenciaInicio = textBox1.Text;
            string vencimiento = textBox2.Text;
            string responsable = textBox3.Text;
            string universidad = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            consulta = "INSERT INTO CredencialEscolar (vigenciaInicio, vencimiento, responsable, universidad, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + vigenciaInicio + "', '" + vencimiento + "', '" + responsable + "', '" + universidad + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox5.Clear();
            textBox6.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idCredencialEscolar = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string vigenciaInicio = textBox1.Text;
            string vencimiento = textBox2.Text;
            string responsable = textBox3.Text;
            string universidad = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            consulta = "UPDATE CredencialEscolar SET vigenciaInicio= '" + vigenciaInicio + "',vencimiento = '" + vencimiento + "',responsable = '" + responsable + "',universidad = '" + universidad + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idCredencialEscolar = " + idCredencialEscolar.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox5.Clear();
            textBox6.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idCredencialEscolar = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM CredencialEscolar WHERE idCredencialEscolar = " + idCredencialEscolar.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void Form13_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form12();
            formulario.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form14();
            formulario.Show();
        }
    }
}
