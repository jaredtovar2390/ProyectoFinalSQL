using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form28 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form28()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM ServicioSocial ORDER BY idServicioSocial");
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string fecha = textBox2.Text;
            string cantidadHoras = textBox3.Text;
            string descripcion = textBox4.Text;
            string estado = textBox5.Text;
            string numero = textBox6.Text;
            string colonia = textBox7.Text;
            string ciudad = textBox8.Text;
            string calle = textBox9.Text;
            string idUsuarioCrea = textBox10.Text;
            string idUsuarioModifica = textBox11.Text;
            consulta = "INSERT INTO ServicioSocial (nombre,fecha,cantidadHoras,descripcion,estado,numero,colonia,ciudad,calle,idUsuarioCrea,idUsuarioModifica) " +
                "values('" + nombre + "', '" + fecha + "', '" + cantidadHoras + "', '" + descripcion + "', '" + estado + "', '" + numero + "', '" + colonia + "', '" + ciudad + "', '" + calle + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idServicioSocial = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string fecha = textBox2.Text;
            string cantidadHoras = textBox3.Text;
            string descripcion = textBox4.Text;
            string estado = textBox5.Text;
            string numero = textBox6.Text;
            string colonia = textBox7.Text;
            string ciudad = textBox8.Text;
            string calle = textBox9.Text;
            string idUsuarioCrea = textBox10.Text;
            string idUsuarioModifica = textBox11.Text;
            consulta = "UPDATE ServicioSocial SET nombre= '" + nombre + "',fecha = '" + fecha + "',cantidadHoras = '" + cantidadHoras + "',descripcion = '" + descripcion + "',estado = '" + estado + "',numero = '" + numero + "',colonia = '" + colonia + "',ciudad = '" + ciudad+ "',calle = '" + calle + "',idUsuarioCrea = '" + idUsuarioCrea +
               "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idServicioSocial = " + idServicioSocial.ToString();
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
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idServicioSocial = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM ServicioSocial WHERE idServicioSocial = " + idServicioSocial.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void Form28_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form29();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form27();
            formulario.Show();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
