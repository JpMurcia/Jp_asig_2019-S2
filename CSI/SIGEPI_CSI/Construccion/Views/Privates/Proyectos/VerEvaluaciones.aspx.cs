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
    public partial class VerEvaluaciones : System.Web.UI.Page
    {
       
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
                   
                        Store_Evaluaciones.DataSource = Mdl_Proyecto.ConsultarEvaluaciones();
                        Store_Evaluaciones.DataBind();
                    }
                }
            }
            catch
            {
                X.Redirect("~/Views/Publics/Login.aspx");
            }
        }

        protected void Btn_Ayuda_Click(object sender, DirectEventArgs e)
        {
            Notification.Show(new NotificationConfig
            {
                Title = "¿Cómo buscar?",
                AlignCfg = new NotificationAlignConfig
                {
                    ElementAnchor = AnchorPoint.Top,
                    TargetAnchor = AnchorPoint.Top,
                    OffsetY = 10
                },
                Width = 500,
                Height = 120,
                AutoScroll = true,
                Icon = Icon.Information,
                AutoHide = false,
                Html = String.Format("<b>Texto:</b> <b>=</b>(igual), <b>+</b>(comienza con), <b>-</b>(finaliza con), <b>*</b>(contiene), <b>!</b>(no contiene) <br/>" +
                "<b>Números:</b> <b>></b>, <b><</b>, <b>>=</b>, <b><=</b> o especifique un número igual <br/>" +
                "<b>Fecha:</b> <b>></b>, <b><</b>, <b>>=</b>, <b><=</b> o especifique una fecha igual <br/>")
            });
        }
        protected void ExportListFromGridView(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment;filename=Info Evaluaciones.xls");
            Response.AddHeader("Content-Type", "application/vnd.ms-excel");
            using (System.IO.StringWriter sw = new System.IO.StringWriter())
            {
                using (System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw))
                {
                    System.Web.UI.WebControls.GridView grid = new System.Web.UI.WebControls.GridView();
                    grid.DataSource = Mdl_Proyecto.ConsultarEvaluacionesReport();
                    grid.DataBind();
                    grid.RenderControl(htw);
                    Response.Write(sw.ToString());
                }
            }

            Response.End();
        }



    }
}