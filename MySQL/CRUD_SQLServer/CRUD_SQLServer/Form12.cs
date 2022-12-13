using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form12 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form12()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string fecha = textBox1.Text;
            string responsable = textBox2.Text;
            string nombre = textBox3.Text;
            string descripcion = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            consulta = "INSERT INTO Convocatoria (fecha, responsable, nombre, descripcion, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + fecha + "', '" + responsable + "', '" + nombre + "', '" + descripcion + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
            int idConvocatoria = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string fecha = textBox1.Text;
            string responsable = textBox2.Text;
            string nombre = textBox3.Text;
            string descripcion = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            consulta = "UPDATE Convocatoria SET fecha= '" + fecha + "',responsable = '" + responsable + "',nombre = '" + nombre + "',descripcion = '" + descripcion + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idConvocatoria = " + idConvocatoria.ToString();
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
            int idConvocatoria = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Convocatoria WHERE idConvocatoria = " + idConvocatoria.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void Form12_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Convocatoria ORDER BY idConvocatoria");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form11();
            formulario.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form13();
            formulario.Show();
        }
    }
}
