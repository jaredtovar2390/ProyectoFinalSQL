using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form15 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form15()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }

        private void Form15_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Curso ORDER BY idCurso");
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string fecha = textBox1.Text;
            string nombre = textBox2.Text;
            string cupo = textBox3.Text;
            string precio = textBox4.Text;
            string descripcion = textBox5.Text;
            string cantidadParticipantes = textBox6.Text;
            string idUsuarioCrea = textBox7.Text;
            string idUsuarioModifica = textBox8.Text;
            consulta = "INSERT INTO Curso (fecha, nombre, cupo, precio, descripcion, cantidadParticipantes, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + fecha + "', '" + nombre + "', '" + cupo + "', '" + precio + "', '" + descripcion + "', '" + cantidadParticipantes + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
            textBox8.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idCurso = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string fecha = textBox1.Text;
            string nombre = textBox2.Text;
            string cupo = textBox3.Text;
            string precio = textBox4.Text;
            string descripcion = textBox5.Text;
            string cantidadParticipantes = textBox6.Text;
            string idUsuarioCrea = textBox7.Text;  
            string idUsuarioModifica = textBox8.Text;
            consulta = "UPDATE Curso SET fecha= '" + fecha + "',nombre = '" + nombre + "',cupo = '" + cupo + "',precio = '" + precio + "',descripcion = '" + descripcion + "',cantidadParticipantes = '" + cantidadParticipantes + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idCurso = " + idCurso.ToString();
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
            textBox8.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idCurso = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Curso WHERE idCurso = " + idCurso.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form16();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form14();
            formulario.Show();
        }
    }
}
