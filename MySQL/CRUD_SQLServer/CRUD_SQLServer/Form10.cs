using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form10 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form10()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string fecha = textBox1.Text;
            string responsable = textBox2.Text;
            string titulo = textBox3.Text;
            string participante = textBox4.Text;
            string razon = textBox5.Text;
            string idUsuarioCrea = textBox6.Text;
            string idUsuarioModifica = textBox7.Text;
            consulta = "INSERT INTO Conferencia (fecha, responsable, titulo, participante, razon, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + fecha + "', '" + responsable + "', '" + titulo + "', '" + participante + "', '" + razon + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
            int idConferencia = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string fecha = textBox1.Text;
            string responsable = textBox2.Text;
            string titulo = textBox3.Text;
            string participante = textBox4.Text;
            string razon = textBox5.Text;
            string idUsuarioCrea = textBox6.Text;
            string idUsuarioModifica = textBox7.Text;
            consulta = "UPDATE Conferencia SET fecha= '" + fecha + "',responsable = '" + responsable + "',titulo = '" + titulo + "',participante = '" + participante + "',razon = '" + razon + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idConferencia = " + idConferencia.ToString();
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
            int idConferencia = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Conferencia WHERE idConferencia = " + idConferencia.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void Form10_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Conferencia ORDER BY idConferencia");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form9();
            formulario.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form11();
            formulario.Show();
        }
    }
}
