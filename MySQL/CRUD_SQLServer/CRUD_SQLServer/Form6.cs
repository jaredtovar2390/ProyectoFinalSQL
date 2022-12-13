using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{

    public partial class Form6 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form6()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string fecha = textBox1.Text;
            string titulo = textBox2.Text;
            string descripcion = textBox3.Text;
            string responsable = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            consulta = "INSERT INTO Certificado (fecha, titulo, descripcion, responsable, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + fecha + "', '" + titulo + "', '" + descripcion + "', '" + responsable + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Certificado ORDER BY idCertificado");
        }

        private void Form6_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idCertificado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string fecha = textBox1.Text;
            string titulo = textBox2.Text;
            string descripcion = textBox3.Text;
            string responsable = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            consulta = "UPDATE Certificado SET fecha= '" + fecha + "',titulo = '" + titulo + "',descripcion = '" + descripcion + "',responsable = '" + responsable +"',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idCertificado = " + idCertificado.ToString();
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
            int idCertificado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Certificado WHERE idCertificado = " + idCertificado.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form5();
            formulario.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form7();
            formulario.Show();
        }
    }
}
