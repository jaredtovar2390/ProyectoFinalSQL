using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form79 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form79()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM EquipoTaller ORDER BY idEquipoTaller");
        }

        private void Form79_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idEquipo = textBox1.Text;
            string idTaller = textBox2.Text;
            consulta = "INSERT INTO EquipoTaller (idEquipo,idTaller) " +
                "values('" + idEquipo + "', '" + idTaller + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idEquipoTaller = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idEquipo = textBox1.Text;
            string idTaller = textBox2.Text;
            consulta = "UPDATE EquipoTaller SET idEquipo= '" + idEquipo + "',idTaller = '" + idTaller + "' WHERE idEquipoTaller = " + idEquipoTaller.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idEquipoTaller = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM EquipoTaller WHERE idEquipoTaller = " + idEquipoTaller.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form80();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form78();
            formulario.Show();
        }
    }
}
