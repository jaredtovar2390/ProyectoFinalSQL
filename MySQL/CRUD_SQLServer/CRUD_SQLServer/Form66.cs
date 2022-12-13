using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form66 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form66()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM CertificadoCurso ORDER BY idCertificadoCurso");
        }

        private void Form66_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idCertificado = textBox1.Text;
            string idCurso = textBox2.Text;
            consulta = "INSERT INTO CertificadoCurso (idCertificado,idCurso) " +
                "values('" + idCertificado + "', '" + idCurso + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idCertificadoCurso = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idCertificado = textBox1.Text;
            string idCurso = textBox2.Text;
            consulta = "UPDATE CertificadoCurso SET idCertificado= '" + idCertificado + "',idCurso = '" + idCurso + "' WHERE idCertificadoCurso = " + idCertificadoCurso.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idCertificadoCurso = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM CertificadoCurso WHERE idCertificadoCurso = " + idCertificadoCurso.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form67();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form65();
            formulario.Show();
        }
    }
}
