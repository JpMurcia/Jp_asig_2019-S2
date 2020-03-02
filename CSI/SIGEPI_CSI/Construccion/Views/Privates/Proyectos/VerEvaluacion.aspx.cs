using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using Ext.Net;
using Construccion.Models.Modelos_chaira;

namespace Construccion.Views.Privates.Proyectos
{
    public partial class VerEvaluacion : System.Web.UI.Page
    {
        
        DataTable DT_Proyecto;
        PROYECTO Mdl_Proyecto = new PROYECTO();

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
                        DT_Proyecto = Mdl_Proyecto.ConsultarPuntajeItems(Request.QueryString["id"].ToString());
                        Store_Evaluacion.DataSource = DT_Proyecto;
                        Store_Evaluacion.DataBind();

                        DT_Proyecto = Mdl_Proyecto.ConsultarEvaluacionId(Request.QueryString["id"].ToString());
                        HL_Proyecto.Text = DT_Proyecto.Rows[0]["PROYECTO"].ToString();
                        HL_Proyecto.NavigateUrl = DT_Proyecto.Rows[0]["ARCHIVO"].ToString();
                        Lbl_Evaluador.Text = DT_Proyecto.Rows[0]["EVALUADOR"].ToString();
                        TA_Observacioones.Text = DT_Proyecto.Rows[0]["OBSERVACIONES"].ToString();
                        Lbl_Puntaje_Total.Text = DT_Proyecto.Rows[0]["PUNTAJE"].ToString();
                        Lbl_Fecha_Finalizacion.Text = DT_Proyecto.Rows[0]["FECHA"].ToString();
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