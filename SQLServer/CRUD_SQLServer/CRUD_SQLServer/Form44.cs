using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form44 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form44()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Libro ORDER BY idLibro");
        }
        private void Form44_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string titulo = textBox1.Text;
            string idioma = textBox2.Text;
            string edicion = textBox3.Text;
            string fecha = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            string idAula = textBox7.Text;
            string idPrestamo = textBox8.Text;
            consulta = "INSERT INTO Libro (titulo,idioma,edicion,fecha,idUsuarioCrea,idUsuarioModifica,idAula,idPrestamo) " +
                "values('" + titulo + "', '" + idioma + "', '" + edicion + "', '" + fecha + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idAula + "', '" + idPrestamo + "')";
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
            int idLibro = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string titulo = textBox1.Text;
            string idioma = textBox2.Text;
            string edicion = textBox3.Text;
            string fecha = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            string idAula = textBox7.Text;
            string idPrestamo = textBox8.Text;
            consulta = "UPDATE Libro SET titulo= '" + titulo + "',idioma = '" + idioma + "',edicion = '" + edicion + "',fecha = '" + fecha + "',idUsuarioCrea = '" + idUsuarioCrea + "',idUsuarioModifica = '" + idUsuarioModifica +
                "',idAula = '" + idAula + "',idPrestamo = '" + idPrestamo + "' WHERE idLibro = " + idLibro.ToString();
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
            int idLibro = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Libro WHERE idLibro = " + idLibro.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form45();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form43();
            formulario.Show();
        }
    }
}
