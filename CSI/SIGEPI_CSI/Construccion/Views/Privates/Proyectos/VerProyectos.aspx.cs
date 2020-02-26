using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Xsl;
using Ext.Net;
using PEPEPS.Models;
using System.Data;

namespace PEPEPS.Views.Privates.Proyectos
{
    public partial class VerProyectos : System.Web.UI.Page
    {
        PE_PROYECTO Mdl_Proyecto = new PE_PROYECTO();
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
                        Store_Proyectos.DataSource = new PE_PROYECTO().ConsultarProyectos();
                        Store_Proyectos.DataBind();
                    }
                }
                HL_Propuesta.Text = "Ver propuesta";
                HL_Presupuesto.Text = "Ver presupuesto actualizado";
                HL_Informe_Parcial.Text = "Ver informe parcial #1";
                HL_Informe_Parcial2.Text = "Ver informe parcial #2";
            }
            catch
            {
                X.Redirect("~/Views/Publics/Login.aspx");
            }
        }

        protected void ToExcel(object sender, EventArgs e)
        {
            string json = Hidden_Proyectos.Value.ToString();
            StoreSubmitDataEventArgs eSubmit = new StoreSubmitDataEventArgs(json, null);
            XmlNode xml = eSubmit.Xml;

            this.Response.Clear();
            this.Response.ContentType = "application/vnd.ms-excel";
            this.Response.AddHeader("Content-Disposition", "attachment; filename=Listado Proyectos.xls");

            XslCompiledTransform xtExcel = new XslCompiledTransform();

            xtExcel.Load(Server.MapPath("~/Views/Privates/Content/Archivos/General/Excel.xsl"));
            xtExcel.Transform(xml, null, this.Response.OutputStream);
            this.Response.End();
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
            Response.AddHeader("content-disposition", "attachment;filename=Info Proyectos Grupos.xls");
            Response.AddHeader("Content-Type", "application/vnd.ms-excel");
            using (System.IO.StringWriter sw = new System.IO.StringWriter())
            {
                using (System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw))
                {
                    System.Web.UI.WebControls.GridView grid = new System.Web.UI.WebControls.GridView();
                    grid.DataSource = Mdl_Proyecto.ConsultarProyectosGrupos();
                    grid.DataBind();
                    grid.RenderControl(htw);
                    Response.Write(sw.ToString());
                }
            }
            Response.End();
        }

        protected void Btn_Archivos_Click(object sender, DirectEventArgs e)
        {
            Ventana_Archivos.Show();

            if (e.ExtraParams["ARCHIVO"].ToString().Length == 0)
            {
                HL_Propuesta.Text = "ARCHIVO SIN CARGAR";
                HL_Propuesta.NavigateUrl = "";
                HL_Propuesta.Target = "_top";
            }
            else
            {
                HL_Propuesta.NavigateUrl = e.ExtraParams["ARCHIVO"].ToString();
                HL_Propuesta.Target = "_blank";
            }

            if (e.ExtraParams["PRESUPUESTO"].ToString().Length == 0)
            {
                HL_Presupuesto.Text = "PRESUPUESTO SIN CARGAR";
                HL_Presupuesto.NavigateUrl = "";
                HL_Presupuesto.Target = "_top";
            }
            else
            {
                HL_Presupuesto.NavigateUrl = e.ExtraParams["PRESUPUESTO"].ToString();
                HL_Presupuesto.Target = "_blank";
            }

            if (e.ExtraParams["PARCIAL"].ToString().Length == 0)
            {
                HL_Informe_Parcial.Text = "INFORME PARCIAL #1 SIN CARGAR";
                HL_Informe_Parcial.NavigateUrl = "";
                HL_Informe_Parcial.Target = "_top";
            }
            else
            {
                HL_Informe_Parcial.NavigateUrl = e.ExtraParams["PARCIAL"].ToString();
                HL_Informe_Parcial.Target = "_blank";
            }

            if (e.ExtraParams["PARCIAL2"].ToString().Length == 0)
            {
                HL_Informe_Parcial2.Text = "INFORME PARCIAL #2 SIN CARGAR";
                HL_Informe_Parcial2.NavigateUrl = "";
                HL_Informe_Parcial2.Target = "_top";

            }
            else
            {
                HL_Informe_Parcial2.NavigateUrl = e.ExtraParams["PARCIAL2"].ToString();
                HL_Informe_Parcial2.Target = "_blank";
            }
        }
    }
}