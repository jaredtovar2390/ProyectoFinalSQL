using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form42 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form42()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Examen ORDER BY idExamen");
        }

        private void Form42_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string numeroPregunta = textBox1.Text;
            string fecha = textBox2.Text;
            string semestre = textBox3.Text;
            string especialidad = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            string idTipoExamen = textBox7.Text;
            string idCalificacion = textBox8.Text;
            consulta = "INSERT INTO Examen (numeroPregunta,fecha,semestre,especialidad,idUsuarioCrea,idUsuarioModifica,idTipoExamen,idCalificacion) " +
                "values('" + numeroPregunta + "', '" + fecha + "', '" + semestre + "', '" + especialidad + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idTipoExamen + "', '" + idCalificacion + "')";
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
            int idExamen = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string numeroPregunta = textBox1.Text;
            string fecha = textBox2.Text;
            string semestre = textBox3.Text;
            string especialidad = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            string idTipoExamen = textBox7.Text;
            string idCalificacion = textBox8.Text;
            consulta = "UPDATE Examen SET numeroPregunta= '" + numeroPregunta + "',fecha = '" + fecha + "',semestre = '" + semestre + "',especialidad = '" + especialidad + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "',idTipoExamen = '" + idTipoExamen + "' WHERE idCalificacion = " + idCalificacion.ToString();
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
            int idExamen = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Examen WHERE idExamen = " + idExamen.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form43();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form41();
            formulario.Show();
        }
    }
}
