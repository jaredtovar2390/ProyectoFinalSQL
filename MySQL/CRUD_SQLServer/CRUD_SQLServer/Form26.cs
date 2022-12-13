using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form26 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form26()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Residencia ORDER BY idResidencia");
        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string estado = textBox2.Text;
            string numero = textBox3.Text;
            string colonia = textBox4.Text;
            string ciudad = textBox5.Text;
            string calle = textBox6.Text;
            string descripcion = textBox7.Text;
            string cantidadHoras = textBox8.Text;
            string idUsuarioCrea = textBox9.Text;
            string idUsuarioModifica = textBox10.Text;
            consulta = "INSERT INTO Residencia (nombre,estado,numero,colonia,ciudad,calle,descripcion,cantidadHoras,idUsuarioCrea,idUsuarioModifica) " +
                "values('" + nombre + "', '" + estado + "', '" + numero + "', '" + colonia + "', '" + ciudad + "', '" + calle + "', '" + descripcion + "', '" + cantidadHoras + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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

        }

        private void Form26_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idResidencia = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string estado = textBox2.Text;
            string numero = textBox3.Text;
            string colonia = textBox4.Text;
            string ciudad = textBox5.Text;
            string calle = textBox6.Text;
            string descripcion = textBox7.Text;
            string cantidadHoras = textBox8.Text;
            string idUsuarioCrea = textBox9.Text;
            string idUsuarioModifica = textBox10.Text;
            consulta = "UPDATE Residencia SET nombre= '" + nombre + "',estado = '" + estado + "',numero = '" + numero + "',colonia = '" + colonia + "',ciudad = '" + ciudad + "',calle = '" + calle + "',descripcion = '" + descripcion + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idResidencia = " + idResidencia.ToString();
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
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idResidencia = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Residencia WHERE idResidencia = " + idResidencia.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form27();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form25();
            formulario.Show();
        }
    }
}
