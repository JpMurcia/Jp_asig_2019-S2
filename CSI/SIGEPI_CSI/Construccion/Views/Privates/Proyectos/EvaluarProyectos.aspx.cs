using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using PEPEPS.Models;
using System.Data;

namespace PEPEPS.Views.Privates.Proyectos
{
    public partial class EvaluarProyectos : System.Web.UI.Page
    {
        PE_PROYECTO Mdl_Proyecto = new PE_PROYECTO();
        DataTable DT_Proyecto;

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
                        DT_Proyecto = Mdl_Proyecto.ConsultarProyectosEvaluador(Session["Usuario"].ToString());

                        if (DT_Proyecto.Rows.Count.Equals(0))
                        {
                            Lbl_Mensaje.Visible = true;
                            GP_Proyectos.Visible = false;
                        }
                        else
                        {
                            Store_Proyectos.DataSource = DT_Proyecto;
                            Store_Proyectos.DataBind();
                        }
                    }
                }
            }
            catch
            {
                X.Redirect("~/Views/Publics/Login.aspx");
            }
        }
    }
}