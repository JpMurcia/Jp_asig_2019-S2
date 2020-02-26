using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Ext.Net;
using PEPEPS.Models;

namespace PEPEPS.Views.Privates.Usuarios
{
    public partial class DatosUsuario : System.Web.UI.Page
    {
        DataTable DT_Persona;
        PE_PERSONA Mdl_Persona = new PE_PERSONA();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Usuario"].ToString().Equals(null))
                    X.Redirect("~/Views/Publics/Login.aspx");
                else
                {
                    if (!IsPostBack)
                    {
                        DT_Persona = Mdl_Persona.ConsultarUsuarioCorreo(Session["Usuario"].ToString());
                        TF_Nombre.Text = DT_Persona.Rows[0]["NOMBRES"].ToString();
                        TF_Apellidos.Text = DT_Persona.Rows[0]["APELLIDOS"].ToString();
                        TF_Cedula.Text = DT_Persona.Rows[0]["CEDULA"].ToString();
                        TF_Telefono.Text = DT_Persona.Rows[0]["TELEFONO"].ToString();
                        TF_Correo.Text = DT_Persona.Rows[0]["CORREO"].ToString();
                        TF_Rol.Text = DT_Persona.Rows[0]["ROL"].ToString();
                    }
                }
            }
            catch
            {
                X.Redirect("~/Views/Publics/Login.aspx");
            }
        }

        protected void Btn_Actualizar_Contrasena_Click(object sender, DirectEventArgs e)
        {
            try
            {
                DataTable DT_Mensaje = Mdl_Persona.ActualizarContrasena(Session["Usuario"].ToString(), TB_Contrasena_Actual.Text, TB_Contrasena_Nueva.Text);
                if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
                    X.Msg.Alert("Registro exitoso", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "#{Form_Contrasena}.getForm().reset(); #{Ventana_Contrasena}.hide();").Show();
                else
                    X.Msg.Alert("Error", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
            }
            catch (Exception ex)
            {
                X.Msg.Alert("Error", ex.Message).Show();
            }
        }

        protected void Btn_Actualizar_Datos_Click(object sender, DirectEventArgs e)
        {
            try
            {
                DataTable DT_Mensaje = Mdl_Persona.ActualizarPersona(Session["Usuario"].ToString(), TF_Nombre.Text, TF_Apellidos.Text, TF_Telefono.Text);
                if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
                    X.Msg.Alert("Registro exitoso", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "new function(){location.href = 'DatosUsuario.aspx'}").Show();
                else
                    X.Msg.Alert("Error", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
            }
            catch (Exception ex)
            {
                X.Msg.Alert("Error", ex.Message).Show();
            }
        }
    }
}