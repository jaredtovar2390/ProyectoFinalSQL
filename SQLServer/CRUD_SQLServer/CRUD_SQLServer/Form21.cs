using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form21 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form21()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }

        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Horario ORDER BY idHorario");
        }
        private void Form21_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string materia = textBox1.Text;
            string horaInicio = textBox2.Text;
            string horaTermina = textBox3.Text;
            string docente = textBox4.Text;
            string correo = textBox5.Text;
            string idUsuarioCrea = textBox6.Text;
            string idUsuarioModifica = textBox7.Text;
            consulta = "INSERT INTO Horario (materia, horaInicio, horaTermina, docente, correo, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + materia + "', '" + horaInicio + "', '" + horaTermina + "', '" + docente + "', '" + correo + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
            int idHorario = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string materia = textBox1.Text;
            string horaInicio = textBox2.Text;
            string horaTermina = textBox3.Text;
            string docente = textBox4.Text;
            string correo = textBox5.Text;
            string idUsuarioCrea = textBox6.Text;
            string idUsuarioModifica = textBox7.Text;
            consulta = "UPDATE Horario SET materia= '" + materia + "',horaInicio = '" + horaInicio + "',horaTermina = '" + horaTermina + "',docente = '" + docente + "',correo = '" + correo + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idHorario = " + idHorario.ToString();
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
            int idHorario = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Horario WHERE idHorario = " + idHorario.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form22();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form20();
            formulario.Show();
        }
    }
}
