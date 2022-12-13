using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    
    public partial class Form7 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form7()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Club ORDER BY idClub");
        }

        private void Form7_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string telefono = textBox1.Text;
            string nombre = textBox2.Text;
            string descripcion = textBox3.Text;
            string responsable = textBox4.Text;
            string estado = textBox5.Text;
            string numero = textBox6.Text;
            string colonia = textBox7.Text;
            string ciudad = textBox8.Text;
            string calle = textBox9.Text;
            string idUsuarioCrea = textBox10.Text;
            string idUsuarioModifica = textBox11.Text;
            consulta = "INSERT INTO Club (telefono, nombre, descripcion, responsable, estado, numero, colonia, ciudad, calle,idUsuarioCrea, idUsuarioModifica) " +
                "values('" + telefono + "', '" + nombre + "', '" + descripcion + "', '" + responsable + "', '" + estado + "', '" + numero + "', '" + colonia + "', '" + ciudad + "', '" + calle + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
            textBox10.Clear();
            textBox11.Clear();
        }
        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idClub = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Club WHERE idClub = " + idClub.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idClub = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string telefono = textBox1.Text;
            string nombre = textBox2.Text;
            string descripcion = textBox3.Text;
            string responsable = textBox4.Text;
            string estado = textBox5.Text;
            string numero = textBox6.Text;
            string colonia = textBox7.Text;
            string ciudad = textBox8.Text;
            string calle = textBox9.Text;
            string idUsuarioCrea = textBox10.Text;
            string idUsuarioModifica = textBox11.Text;
            consulta = "UPDATE Club SET telefono= '" + telefono + "',nombre = '" + nombre + "',descripcion = '" + descripcion + "',responsable = '" + responsable + "',estado = '" + estado + "',numero = '" + numero + "',colonia = '" + colonia + "',ciudad = '" + ciudad + "',calle = '" + calle + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idClub = " + idClub.ToString();
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
            textBox10.Clear();
            textBox11.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form6();
            formulario.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form8();
            formulario.Show();
        }
    }
}
