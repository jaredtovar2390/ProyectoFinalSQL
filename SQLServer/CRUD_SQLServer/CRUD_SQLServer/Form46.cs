using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form46 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form46()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Producto ORDER BY idProducto");
        }
        private void Form46_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string cantidad = textBox2.Text;
            string precio = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            string idArea = textBox6.Text;
            consulta = "INSERT INTO Producto (nombre,cantidad,precio,idUsuarioCrea,idUsuarioModifica,idArea) " +
                "values('" + nombre + "', '" + cantidad + "', '" + precio + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idArea + "')";
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
            int idProducto = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string cantidad = textBox2.Text;
            string precio = textBox3.Text;
            string idUsuarioCrea = textBox4.Text;
            string idUsuarioModifica = textBox5.Text;
            string idArea = textBox6.Text;
            consulta = "UPDATE Producto SET nombre= '" + nombre + "',cantidad = '" + cantidad + "',precio = '" + precio + "',idUsuarioCrea = '" + idUsuarioCrea + "',idUsuarioModifica = '" + idUsuarioModifica +
                "',idArea = '" + idArea + "' WHERE idProducto = " + idProducto.ToString();
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
            int idProducto = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Producto WHERE idProducto = " + idProducto.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form47();
            formulario.Show();
        }
        
        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form45();
            formulario.Show();
        }
    }
}
