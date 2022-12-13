using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form8 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form8()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string cantidad = textBox1.Text;
            string periodo = textBox2.Text;
            string banco = textBox3.Text;
            string semestre = textBox4.Text;
            string descripcion = textBox5.Text;
            string idUsuarioCrea = textBox6.Text;
            string idUsuarioModifica = textBox7.Text;
            consulta = "INSERT INTO Colegiatura (cantidad, periodo, banco, semestre, descripcion, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + cantidad + "', '" + periodo + "', '" + banco + "', '" + semestre + "', '" + descripcion + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
            int idColegiatura = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string cantidad = textBox1.Text;
            string periodo = textBox2.Text;
            string banco = textBox3.Text;
            string semestre = textBox4.Text;
            string descripcion = textBox5.Text;
            string idUsuarioCrea = textBox6.Text;
            string idUsuarioModifica = textBox7.Text;
            consulta = "UPDATE Colegiatura SET cantidad= '" + cantidad + "',periodo = '" + periodo + "',banco = '" + banco + "',semestre = '" + semestre + "',descripcion = '" + descripcion + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idColegiatura = " + idColegiatura.ToString();
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
            int idColegiatura = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Colegiatura WHERE idColegiatura = " + idColegiatura.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Colegiatura ORDER BY idColegiatura");
        }
        private void Form8_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form9();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form7();
            formulario.Show();
        }
    }
}
