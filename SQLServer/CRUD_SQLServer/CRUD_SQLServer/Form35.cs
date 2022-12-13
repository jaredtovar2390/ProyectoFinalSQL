using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form35 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form35()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Actividad ORDER BY idActividad");
        }
        private void Form35_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string descripcion = textBox1.Text;
            string fecha = textBox2.Text;
            string estado = textBox3.Text;
            string numero = textBox4.Text;
            string colonia = textBox5.Text;
            string ciudad = textBox6.Text;
            string calle = textBox7.Text;
            string idUsuarioCrea = textBox8.Text;
            string idUsuarioModifica = textBox9.Text;
            string idClub = textBox10.Text;
            consulta = "INSERT INTO Actividad (descripcion,fecha,estado,numero,colonia,ciudad,calle,idUsuarioCrea,idUsuarioModifica,idClub) " +
                "values('" + descripcion + "', '" + fecha + "', '" + estado + "', '" + numero + "', '" + colonia + "', '" + ciudad + "', '" + calle + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idClub + "')";
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
            int idActividad = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string descripcion = textBox1.Text;
            string fecha = textBox2.Text;
            string estado = textBox3.Text;
            string numero = textBox4.Text;
            string colonia = textBox5.Text;
            string ciudad = textBox6.Text;
            string calle = textBox7.Text;
            string idUsuarioCrea = textBox8.Text;
            string idUsuarioModifica = textBox9.Text;
            string idClub = textBox10.Text;
            consulta = "UPDATE Actividad SET descripcion= '" + descripcion + "',fecha = '" + fecha + "',estado = '" + estado + "',numero = '" + numero + "',colonia = '" + colonia + "',ciudad = '" + ciudad + "',calle = '" + calle + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "',idClub = '" + idClub + "' WHERE idActividad = " + idActividad.ToString();
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
            int idActividad = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Actividad WHERE idActividad = " + idActividad.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form36();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form34();
            formulario.Show();
        }
    }
}
