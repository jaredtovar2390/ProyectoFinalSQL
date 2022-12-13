using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form17 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form17()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Editorial ORDER BY idEditorial");
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string telefono = textBox2.Text;
            string estado = textBox3.Text;
            string numero = textBox4.Text;
            string colonia = textBox5.Text;
            string ciudad = textBox6.Text;
            string calle = textBox7.Text;
            string idUsuarioCrea = textBox8.Text;
            string idUsuarioModifica = textBox9.Text;
            consulta = "INSERT INTO Editorial (nombre, telefono, estado, numero, colonia, ciudad, calle,idUsuarioCrea, idUsuarioModifica) " +
                "values('" + nombre + "', '" + telefono + "', '" + estado + "', '" + numero + "', '" + colonia + "', '" + ciudad + "', '" + calle + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
            textBox9.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idEditorial = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string telefono = textBox2.Text;
            string estado = textBox3.Text;
            string numero = textBox4.Text;
            string colonia = textBox5.Text;
            string ciudad = textBox6.Text;
            string calle = textBox7.Text;
            string idUsuarioCrea = textBox8.Text;
            string idUsuarioModifica = textBox9.Text;
            consulta = "UPDATE Editorial SET nombre= '" + nombre + "',telefono = '" + telefono + "',estado = '" + estado + "',numero = '" + numero + "',colonia = '" + colonia + "',ciudad = '" + ciudad + "',calle = '" + calle + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idEditorial = " + idEditorial.ToString();
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
            textBox9.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idEditorial = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Editorial WHERE idEditorial = " + idEditorial.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void Form17_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form16();
            formulario.Show();
        }
        private void button1_Click_1(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form18();
            formulario.Show();
        }
    }
}
