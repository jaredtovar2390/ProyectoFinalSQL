﻿using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CRUD_SQLServer
{
    public partial class Form51 : Form
    {
        SqlConnection conexion;
        string consulta;
        public Form51()
        {
            InitializeComponent();
            string cadena = @"Server=localhost;Database=Universidad;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
        }
        private void MostrarDatos()
        {
            dataGridView1.DataSource = ConexionSQL.ejecutaConsultaSelect("SELECT *FROM AsignaturaProfesor ORDER BY idAsignaturaProfesor");
        }
        private void Form51_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string idAsignatura = textBox1.Text;
            string idProfesor = textBox2.Text;
            consulta = "INSERT INTO AsignaturaProfesor (idAsignatura,idProfesor) " +
                "values('" + idAsignatura + "', '" + idProfesor + "')";
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            int idAsignaturaProfesor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            string idAsignatura = textBox1.Text;
            string idProfesor = textBox2.Text;
            consulta = "UPDATE AsignaturaProfesor SET idAsignatura= '" + idAsignatura + "',idProfesor = '" + idProfesor + "' WHERE idAsignaturaProfesor = " + idAsignaturaProfesor.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idAsignaturaProfesor = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "DELETE FROM AsignaturaProfesor WHERE idAsignaturaProfesor = " + idAsignaturaProfesor.ToString();
            ConexionSQL.ejecutaConsulta(consulta);
            MostrarDatos();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form52();
            formulario.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form formulario = new Form50();
            formulario.Show();
        }
    }
}
