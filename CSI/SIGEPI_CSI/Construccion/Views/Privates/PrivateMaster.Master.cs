using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

using System.Data;

namespace Construccion.Views.Privates
{
    public partial class PrivateMaster : System.Web.UI.MasterPage
    {
       
      

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["usuario"].ToString().Equals(null))
                    X.Redirect("~/Views/Publics/Login.aspx");
                else
                {
                    if (!IsPostBack)
                    {
                        /// DT_Persona = Mdl_Persona.ConsultarUsuarioCorreo(Session["Usuario"].ToString());
                        // Lbl_Usuario.Text = DT_Persona.Rows[0]["NOMBRES"].ToString() + " " + DT_Persona.Rows[0]["APELLIDOS"].ToString();


                        if (Session["rol"].ToString().Equals("8"))
                        {
                            Btn_Registrar_Propuesta.Visible =
                            Pnl_Proyectos.Visible = Btn_Proyectos_Usuario.Visible = true;
                        }
                        else if (Session["rol"].ToString().ToString().Equals("1"))
                        {
                            Pnl_Proyectos.Visible = Btn_Evaluar_Proyectos.Visible = true;
                        }
                        else if (Session["rol"].ToString().Equals("4"))
                        {
                            Pnl_Proyectos.Visible = Btn_Ver_Proyectos.Visible = true;
                        }
                        else if (Session["rol"].ToString().Equals("9"))
                        {
                            Btn_Proyectos_Usuario.Visible = Pnl_Proyectos.Visible = Btn_Registrar_Propuesta.Visible = Btn_Evaluar_Proyectos.Visible = Btn_Ver_Proyectos.Visible
                                = Btn_Asignar_Evaluadores.Visible = Btn_Ver_Evaluaciones.Visible = Pnl_Usuarios.Visible = Btn_Ver_Usuarios.Visible = true;
                        }
                    }
                }
            }
            catch
            {
                X.Redirect("~/Views/Publics/Login.aspx");
            }
        }

        protected void Btn_Cerrar_Session_Click(object sender, DirectEventArgs e)
        {
            Session["Usuario"] = null;
            Session.Clear();
            X.Redirect("~/Views/Publics/Login.aspx");
        }
    }
}