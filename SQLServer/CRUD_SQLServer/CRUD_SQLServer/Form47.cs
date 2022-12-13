using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;


namespace CRUD_SQLServer
{
    public partial class Form47 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form47()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Profesor ORDER BY idProfesor");
        }
        private void Form47_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string apellidoPaterno = textBox2.Text;
            string apellidoMaterno = textBox3.Text;
            string maestria = textBox4.Text;
            string telefono = textBox5.Text;
            string estado = textBox6.Text;
            string numero = textBox7.Text;
            string colonia = textBox8.Text;
            string ciudad = textBox9.Text;
            string calle = textBox10.Text;
            string rfc = textBox11.Text;
            string idUsuarioCrea = textBox12.Text;
            string idUsuarioModifica = textBox13.Text;
            string idArea = textBox14.Text;
            consulta = "INSERT INTO Profesor (nombre,apellidoPaterno,apellidoMaterno,maestria,telefono,estado,numero,colonia,ciudad,calle,rfc,idUsuarioCrea,idUsuarioModifica,idArea) " +
                "values('" + nombre + "', '" + apellidoPaterno + "', '" + apellidoMaterno + "', '" + maestria + "', '" + telefono + "', '" + estado + "', '" + numero + "', '" + colonia + "', '" + ciudad + "', '" + calle + "', '" + rfc + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idArea + "')";
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
            textBox14.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idProfesor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string apellidoPaterno = textBox2.Text;
            string apellidoMaterno = textBox3.Text;
            string maestria = textBox4.Text;
            string telefono = textBox5.Text;
            string estado = textBox6.Text;
            string numero = textBox7.Text;
            string colonia = textBox8.Text;
            string ciudad = textBox9.Text;
            string calle = textBox10.Text;
            string rfc = textBox11.Text;
            string idUsuarioCrea = textBox12.Text;
            string idUsuarioModifica = textBox13.Text;
            string idArea = textBox14.Text;
            consulta = "UPDATE Profesor SET nombre= '" + nombre + "',apellidoPaterno = '" + apellidoPaterno + "',apellidoMaterno = '" + apellidoMaterno + "',maestria = '" + maestria + "',telefono = '" + telefono + "',estado = '" + estado + "',numero = '" + numero + "',colonia = '" + colonia + "',ciudad = '" + ciudad + "',calle = '" + calle + "',rfc = '" + rfc + "',idUsuarioCrea = '" + idUsuarioCrea +
                "',idUsuarioModifica = '" + idUsuarioModifica + "',idArea = '" + idArea + "' WHERE idProfesor = " + idProfesor.ToString();
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
            textBox14.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idProfesor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Profesor WHERE idProfesor = " + idProfesor.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form48();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form46();
            formulario.Show();
        }
    }
}
