using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form49 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form49()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Sinodal ORDER BY idSinodal");
        }
        private void Form49_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string apellidoPaterno = textBox2.Text;
            string apellidoMaterno = textBox3.Text;
            string telefono = textBox4.Text;
            string correo = textBox5.Text;
            string idUsuarioCrea = textBox6.Text;
            string idUsuarioModifica = textBox7.Text;
            string idFeriaCiencia = textBox8.Text;
            consulta = "INSERT INTO Sinodal (nombre,apellidoPaterno,apellidoMaterno,telefono,correo,idUsuarioCrea,idUsuarioModifica,idFeriaCiencia) " +
                "values('" + nombre + "', '" + apellidoPaterno + "', '" + apellidoMaterno + "', '" + telefono + "', '" + correo + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idFeriaCiencia + "')";
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
            int idSinodal = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string apellidoPaterno = textBox2.Text;
            string apellidoMaterno = textBox3.Text;
            string telefono = textBox4.Text;
            string correo = textBox5.Text;
            string idUsuarioCrea = textBox6.Text;
            string idUsuarioModifica = textBox7.Text;
            string idFeriaCiencia = textBox8.Text;
            consulta = "UPDATE Sinodal SET nombre= '" + nombre + "',apellidoPaterno = '" + apellidoPaterno + "',apellidoMaterno = '" + apellidoMaterno + "',telefono = '" + telefono + "',correo = '" + correo + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "',idFeriaCiencia = '" + idFeriaCiencia + "' WHERE idSinodal = " + idSinodal.ToString();
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
            int idSinodal = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Sinodal WHERE idSinodal = " + idSinodal.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form50();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form48();
            formulario.Show();
        }
    }
}
