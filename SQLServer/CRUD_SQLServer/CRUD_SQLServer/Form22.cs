using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;


namespace CRUD_SQLServer
{
    public partial class Form22 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form22()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos() 
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Kardex ORDER BY idKardex");
        }
        private void Form22_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string asignatura = textBox1.Text;
            string oportunidad = textBox2.Text;
            string calificacion = textBox3.Text;
            string periodo = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            consulta = "INSERT INTO Kardex (asignatura, oportunidad, calificacion, periodo, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + asignatura + "', '" + oportunidad + "', '" + calificacion + "', '" + periodo + "', '" +  idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
            int idKardex = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string asignatura = textBox1.Text;
            string oportunidad = textBox2.Text;
            string calificacion = textBox3.Text;
            string periodo = textBox4.Text;
            string idUsuarioCrea = textBox5.Text;
            string idUsuarioModifica = textBox6.Text;
            consulta = "UPDATE Kardex SET asignatura= '" + asignatura + "',oportunidad = '" + oportunidad + "',calificacion = '" + calificacion + "',periodo = '" + periodo + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idKardex = " + idKardex.ToString();
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
            int idKardex = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Kardex WHERE idKardex = " + idKardex.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form23();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form21();
            formulario.Show();
        }
    }
}
