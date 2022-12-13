using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form16 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form16()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Edificio ORDER BY idEdificio");
        }


        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string numeroPiso = textBox1.Text;
            string nombre = textBox2.Text;
            string estado = textBox3.Text;
            string numero = textBox4.Text;
            string colonia = textBox5.Text;
            string ciudad = textBox6.Text;
            string calle = textBox7.Text;
            string idUsuarioCrea = textBox8.Text;
            string idUsuarioModifica = textBox9.Text;
            consulta = "INSERT INTO Edificio (numeroPiso, nombre, estado, numero, colonia, ciudad, calle,idUsuarioCrea, idUsuarioModifica) " +
                "values('" + numeroPiso + "', '" + nombre + "', '"  + estado + "', '" + numero + "', '" + colonia + "', '" + ciudad + "', '" + calle + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "')";
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
            int idEdificio = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string numeroPiso = textBox1.Text;
            string nombre = textBox2.Text;
            string estado = textBox3.Text;
            string numero = textBox4.Text;
            string colonia = textBox5.Text;
            string ciudad = textBox6.Text;
            string calle = textBox7.Text;
            string idUsuarioCrea = textBox8.Text;
            string idUsuarioModifica = textBox9.Text;
            consulta = "UPDATE Edificio SET numeroPiso= '" + numeroPiso + "',nombre = '" + nombre + "',estado = '" + estado + "',numero = '" + numero + "',colonia = '" + colonia + "',ciudad = '" + ciudad + "',calle = '" + calle + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "' WHERE idEdificio = " + idEdificio.ToString();
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
            int idEdificio = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Edificio WHERE idEdificio = " + idEdificio.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void Form16_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form15();
            formulario.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form17();
            formulario.Show();
        }
    }
}
