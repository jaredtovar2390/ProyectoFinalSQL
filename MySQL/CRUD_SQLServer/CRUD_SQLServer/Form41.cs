using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form41 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form41()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Empleado ORDER BY idEmpleado");
        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string apellidoPaterno = textBox2.Text;
            string apellidoMaterno = textBox3.Text;
            string estado = textBox4.Text;
            string numero = textBox5.Text;
            string colonia = textBox6.Text;
            string ciudad = textBox7.Text;
            string calle = textBox8.Text;
            string telefono = textBox9.Text;
            string rfc = textBox10.Text;
            string idUsuarioCrea = textBox11.Text;
            string idUsuarioModifica = textBox12.Text;
            string idArea = textBox13.Text;
            consulta = "INSERT INTO Empleado (nombre,apellidoPaterno,apellidoMaterno,telefono,estado,numero,colonia,ciudad,calle,rfc,idUsuarioCrea,idUsuarioModifica,idArea) " +
                "values('" + nombre + "', '" + apellidoMaterno + "', '" + apellidoMaterno + "', '" + telefono + "', '" + estado + "', '" + numero + "', '" + colonia + "', '" + ciudad + "', '" + calle + "', '" + rfc + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idArea + "')";
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
            textBox9.Clear();
            textBox10.Clear();
            textBox11.Clear();
            textBox12.Clear();
            textBox13.Clear();
        }

        private void Form41_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idEmpleado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string apellidoPaterno = textBox2.Text;
            string apellidoMaterno = textBox3.Text;
            string estado = textBox4.Text;
            string numero = textBox5.Text;
            string colonia = textBox6.Text;
            string ciudad = textBox7.Text;
            string calle = textBox8.Text;
            string telefono = textBox9.Text;
            string rfc = textBox10.Text;
            string idUsuarioCrea = textBox11.Text;
            string idUsuarioModifica = textBox12.Text;
            string idArea = textBox13.Text;
            consulta = "UPDATE Empleado SET nombre= '" + nombre + "',apellidoPaterno = '" + apellidoPaterno + "',apellidoMaterno = '" + apellidoMaterno + "',estado = '" + estado + "',numero = '" + numero + "',colonia = '" + colonia + "',ciudad = '" + ciudad + "',calle = '" + calle + "',telefono = '" + telefono + "',rfc = '" + rfc + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "',idArea = '" + idArea + "' WHERE idEmpleado = " + idEmpleado.ToString();
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
            textBox9.Clear();
            textBox10.Clear();
            textBox11.Clear();
            textBox12.Clear();
            textBox13.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idEmpleado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Empleado WHERE idEmpleado = " + idEmpleado.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form42();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form40();
            formulario.Show();
        }
    }
}
