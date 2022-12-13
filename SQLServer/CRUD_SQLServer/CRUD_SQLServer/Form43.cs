using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form43 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form43()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Grupo ORDER BY idGrupo");
        }
        private void Form43_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string cantidadAlumno = textBox2.Text;
            string especialidad = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            string idAula = textBox6.Text;
            string idSeccion = textBox7.Text;
            consulta = "INSERT INTO Grupo (nombre,cantidadAlumno,idUsuarioCrea,idUsuarioModifica,idAula,idSeccion) " +
                "values('" + nombre + "', '" + cantidadAlumno + "', '" + especialidad + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idAula + "', '" + idSeccion + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idGrupo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string cantidadAlumno = textBox2.Text;
            string especialidad = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            string idAula = textBox6.Text;
            string idSeccion = textBox7.Text;
            consulta = "UPDATE Grupo SET nombre= '" + nombre + "',cantidadAlumno = '" + cantidadAlumno + "',especialidad = '" + especialidad + "',idUsuarioCrea = '" + idUsuarioCrea + "',idUsuarioModifica = '" + idUsuarioModifica +
                "',idAula = '" + idAula + "',idSeccion = '" + idSeccion + "' WHERE idGrupo = " + idGrupo.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idGrupo = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Grupo WHERE idGrupo = " + idGrupo.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form44();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form42();
            formulario.Show();
        }
    }
}
