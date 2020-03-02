using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

using System.Data;
using Construccion.Models.Modelos_chaira;

namespace Construccion.Views.Privates
{
    public partial class PrivateMaster : System.Web.UI.MasterPage
    {


        DataTable DT_Persona;

        USUARIOS user = new USUARIOS();

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
                        user.id = Session["ID_PER"].ToString();
                        DT_Persona = user.Consul_Es_par(user);
                        /// DT_Persona = Mdl_Persona.ConsultarUsuarioCorreo(Session["Usuario"].ToString());
                        // Lbl_Usuario.Text = DT_Persona.Rows[0]["NOMBRES"].ToString() + " " + DT_Persona.Rows[0]["APELLIDOS"].ToString();


                        if (Session["rol"].ToString().Equals("8"))
                        {
                           
                            Pnl_Proyectos.Visible = Btn_Proyectos_Usuario.Visible = true;
                        }
                        else if (Session["rol"].ToString().ToString().Equals("10"))
                        {

                            if (DT_Persona.Rows[0]["Mensaje"].ToString().Equals("si"))
                            {
                                Pnl_Proyectos.Visible = Btn_Evaluar_Proyectos.Visible = true;

                            }
                            else {

                                X.Msg.Alert("Retricion", "Aun NO esta vinculado con ningun proyecto").Show();
                                Session["Usuario"] = null;
                                Session.Clear();
                                X.Redirect("~/Views/Publics/Login.aspx");

                            }

                        }
                        else if (Session["rol"].ToString().Equals("4"))
                        {
                            Pnl_Proyectos.Visible = Btn_Ver_Proyectos.Visible = true;
                        }
                        else if (Session["rol"].ToString().Equals("9"))
                        {
                            Btn_Proyectos_Usuario.Visible = Pnl_Proyectos.Visible =  Btn_Evaluar_Proyectos.Visible = Btn_Ver_Proyectos.Visible
                                = Btn_Asignar_Evaluadores.Visible = Btn_Ver_Evaluaciones.Visible  = true;
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