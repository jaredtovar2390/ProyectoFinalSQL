using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form1 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form1()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Adeudo ORDER BY idAdeudo");
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string semestre = textBox2.Text;
            string fecha = textBox3.Text;
            string especialidad = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;

            consulta = "INSERT INTO Adeudo (nombre, semestre, fecha, especialidad, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + nombre + "', '" + semestre + "', '" + fecha + "', '" + especialidad + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
            int idAdeudo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string semestre = textBox2.Text;
            string fecha = textBox3.Text;
            string especialidad = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;

            consulta = "UPDATE Adeudo SET nombre= '" + nombre + "',semestre = '" + semestre + "',fecha = '" + fecha +
                "',especialidad = '" + especialidad + "'" + ",idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idAdeudo = " + idAdeudo.ToString();
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
            int idAdeudo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Adeudo WHERE idAdeudo = " + idAdeudo.ToString();
            //consulta = "UPDATE Adeudo SET estatus = 0 WHERE idAdeudo = " + idAdeudo.ToString(); ;
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form2();
            formulario.Show();
        }
    }
}
