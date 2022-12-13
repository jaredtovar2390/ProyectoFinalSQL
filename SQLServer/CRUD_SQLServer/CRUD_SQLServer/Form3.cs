using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form3 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form3()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Beca ORDER BY idBeca");
        }
        private void Form3_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string monto = textBox2.Text;
            string razon = textBox3.Text;
            string fecha = textBox4.Text;
            string codigo = textBox5.Text;
            string idUsuarioCrea = textBox6.Text;
            string idUsuarioModifica = textBox7.Text;

            consulta = "INSERT INTO Beca (nombre, monto, razon, fecha, codigo, idUsuarioCrea, idUsuarioModifica) " +
                "values('" + nombre + "', '" + monto + "', '" + razon + "', '" + fecha + "', '" + codigo + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
            int idBeca = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string monto = textBox2.Text;
            string razon = textBox3.Text;
            string fecha = textBox4.Text;
            string codigo = textBox5.Text;
            string idUsuarioCrea = textBox6.Text;
            string idUsuarioModifica = textBox7.Text;

            consulta = "UPDATE Beca SET nombre= '" + nombre + "',monto = '" + monto + "',razon = '" + razon +
                "',fecha = '" + fecha + "'" + ",codigo = '" + codigo + "'" + ",idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idBeca = " + idBeca.ToString();
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
            int idBeca = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Beca WHERE idBeca = " + idBeca.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form4();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form2();
            formulario.Show();
        }
    }
}
