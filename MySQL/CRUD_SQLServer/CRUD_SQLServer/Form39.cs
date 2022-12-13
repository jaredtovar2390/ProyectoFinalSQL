using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;


namespace CRUD_SQLServer
{
    public partial class Form39 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form39()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Aula ORDER BY idAula");
        }

        private void Form39_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string numero = textBox2.Text;
            string tamaño = textBox3.Text;
            string cantidadSillas = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            string idEdificio = textBox7.Text;
            consulta = "INSERT INTO Aula (nombre,numero,tamaño,cantidadSillas,idUsuarioCrea,idUsuarioModifica,idEdificio) " +
                "values('" + nombre + "', '" + numero + "', '" + tamaño + "', '" + cantidadSillas + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idEdificio + "')";
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
            int idAula = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string numero = textBox2.Text;
            string tamaño = textBox3.Text;
            string cantidadSillas = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            string idEdificio = textBox7.Text;
            consulta = "UPDATE Aula SET nombre= '" + nombre + "',numero = '" + numero + "',tamaño = '" + tamaño + "',cantidadSillas = '" + cantidadSillas + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "',idEdificio = '" + idEdificio + "' WHERE idAula = " + idAula.ToString();
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
            int idAula = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Aula WHERE idAula = " + idAula.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form40();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form38();
            formulario.Show();
        }
    }
}
