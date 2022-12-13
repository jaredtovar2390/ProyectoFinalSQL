using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms; 

namespace CRUD_SQLServer
{
    public partial class Form36 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form36()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string apellidoPaterno = textBox2.Text;
            string apellidoMaterno = textBox3.Text;
            string matricula = textBox4.Text;
            string curp = textBox5.Text;
            string telefono = textBox6.Text;
            string estado = textBox7.Text;
            string numero = textBox8.Text;
            string colonia = textBox9.Text;
            string ciudad = textBox10.Text;
            string calle = textBox11.Text;
            string idUsuarioCrea = textBox12.Text;
            string idUsuarioModifica = textBox13.Text;
            string idClub = textBox14.Text;
            string idAdeudo = textBox15.Text;
            string idForo = textBox16.Text;
            string idTransporteEscolar = textBox17.Text;
            string idCredencialEscolar = textBox18.Text;
            string idServicioSocial = textBox19.Text;
            string idResidencia = textBox20.Text;
            string idCurso = textBox21.Text;
            string idBeca = textBox22.Text;
            string idFeriaCiencia = textBox23.Text;
            string idToefl = textBox24.Text;
            string idGrupo = textBox25.Text;
            consulta = "INSERT INTO Alumno (nombre,apellidoPaterno,apellidoMaterno,matricula,curp,telefono,estado,numero,colonia,ciudad,calle,idUsuarioCrea,idUsuarioModifica,idClub,idAdeudo,idForo,idTransporteEscolar,idCredencialEscolar,idServicioSocial,idResidencia,idCurso,idBeca,idFeriaCiencia,idToefl,idGrupo) " +
               "values('" + nombre + "', '" + apellidoPaterno + "', '" + apellidoMaterno + "', '" + matricula + "', '" + curp + "', '" + telefono + "', '" + estado + "', '" + numero + "', '" + colonia + "', '" + ciudad + "', '" + calle + "', '" + idUsuarioCrea + "', '" + idUsuarioModifica + "', '" + idClub + "', '" + idAdeudo + "', '" + idForo + "', '" + idTransporteEscolar + "', '" + idCredencialEscolar + "', '" + idServicioSocial + "', '" + idResidencia + "', '" + idCurso + "', '" + idBeca + "', '" + idFeriaCiencia + "', '" + idToefl + "', '" + idGrupo + "')";
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
            textBox15.Clear();
            textBox16.Clear();
            textBox17.Clear();
            textBox18.Clear();
            textBox19.Clear();
            textBox20.Clear();
            textBox21.Clear();
            textBox22.Clear();
            textBox23.Clear();
            textBox24.Clear();
            textBox25.Clear();
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM Alumno ORDER BY idAlumno");
        }

        private void Form36_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idAlumno = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string nombre = textBox1.Text;
            string apellidoPaterno = textBox2.Text;
            string apellidoMaterno = textBox3.Text;
            string matricula = textBox4.Text;
            string curp = textBox5.Text;
            string telefono = textBox6.Text;
            string estado = textBox7.Text;
            string numero = textBox8.Text;
            string colonia = textBox9.Text;
            string ciudad = textBox10.Text;
            string calle = textBox11.Text;
            string idUsuarioCrea = textBox12.Text;
            string idUsuarioModifica = textBox13.Text;
            string idClub = textBox14.Text;
            string idAdeudo = textBox15.Text;
            string idForo = textBox16.Text;
            string idTransporteEscolar = textBox17.Text;
            string idCredencialEscolar = textBox18.Text;
            string idServicioSocial = textBox19.Text;
            string idResidencia = textBox20.Text;
            string idCurso = textBox21.Text;
            string idBeca = textBox22.Text;
            string idFeriaCiencia = textBox23.Text;
            string idToefl = textBox24.Text;
            string idGrupo = textBox25.Text;
            consulta = "UPDATE Alumno SET nombre= '" + nombre + "',apellidoPaterno = '" + apellidoPaterno + "',apellidoMaterno = '" + apellidoMaterno + "',matricula = '" + matricula + "',curp = '" + curp + "',telefono = '" + telefono + "',estado = '" + estado + "',numero = '" + numero + "',colonia = '" + colonia + "',ciudad = '" + ciudad + "',calle = '" + calle + "',idUsuarioCrea = '" + idUsuarioCrea + "',idUsuarioModifica = '" + idUsuarioModifica + "',idClub = '" + idClub + "',idAdeudo = '" + idAdeudo + "',idForo = '" + idForo + "',idTransporteEscolar = '" + idTransporteEscolar + "',idCredencialEscolar = '" + idCredencialEscolar + "',idServicioSocial = '" + idServicioSocial + "',idResidencia = '" + idResidencia + "',idCurso = '" + idCurso + "',idBeca = '" + idBeca + "',idFeriaCiencia = '" + idFeriaCiencia +
                "',idToefl = '" + idToefl + "',idGrupo = '" + idGrupo + "' WHERE idAlumno = " + idAlumno.ToString();
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
            textBox15.Clear();
            textBox16.Clear();
            textBox17.Clear();
            textBox18.Clear();
            textBox19.Clear();
            textBox20.Clear();
            textBox21.Clear();
            textBox22.Clear();
            textBox23.Clear();
            textBox24.Clear();
            textBox25.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idAlumno = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM Alumno WHERE idAlumno = " + idAlumno.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form37();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form35();
            formulario.Show();
        }
    }
}
