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
    public partial class EvaluarProyecto : System.Web.UI.Page
    {
       // PE_PROYECTO Mdl_Proyecto = new PE_PROYECTO();
        PROYECTO Mdl_Proyecto = new PROYECTO();
        DataTable DT_Proyecto;
        public string Proyecto = "Name";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DT_Proyecto = Mdl_Proyecto.ConsultarProyectosEvaluacion(Request.QueryString["id"].ToString(), Session["Usuario"].ToString());
                TA_Metodologia.Text = DT_Proyecto.Rows[0]["METODOLOGIA"].ToString();
                TA_Justificacion.Text = DT_Proyecto.Rows[0]["JUSTIFICACION"].ToString();
                TA_Planteamiento.Text = DT_Proyecto.Rows[0]["PLANTEAMIENTO"].ToString();
                TA_Impacto.Text = DT_Proyecto.Rows[0]["IMPACTO"].ToString();
                TA_Resultados.Text = DT_Proyecto.Rows[0]["RESULTADOS"].ToString();
                TA_General.Text = DT_Proyecto.Rows[0]["GENERAL"].ToString();
                TA_Especificos.Text = DT_Proyecto.Rows[0]["ESPECIFICOS"].ToString();
                Session["Evaluacion"] = DT_Proyecto.Rows[0]["EVALUACION"].ToString();

                Lbl_Planteamiento.Text = Lbl_Justificacion.Text = Lbl_Objetivos.Text = Lbl_Metodologia.Text = Lbl_Impacto.Text = Lbl_Resultados.Text
                    = Lbl_Finalizar.Text = DT_Proyecto.Rows[0]["PROYECTO"].ToString();

                if (DT_Proyecto.Rows[0]["ESTADO"].ToString().Equals("0"))
                {
                    Btn_Puntaje_Planteamiento.Visible = Btn_Puntaje_Justificacion.Visible = Btn_Puntaje_Objetivos.Visible = Btn_Puntaje_Metodologia.Visible
                        = Btn_Puntaje_Impacto.Visible = Btn_Puntaje_Resultados.Visible = Btn_Modal_Guardar.Visible = TF_Puntaje_Planteamiento.Editable
                        = TF_Puntaje_Justificacion.Editable = TF_Puntaje_Objetivos.Editable = TF_Puntaje_Metodologia.Editable = TF_Puntaje_Impacto.Editable
                        = TF_Puntaje_Resultados.Editable = TA_Observaciones.Editable = true;
                    FP_Finalizar.Title = "FINALIZAR EVALUACIÓN";
                }

                if (!IsPostBack)
                {
                    DT_Proyecto = Mdl_Proyecto.ConsultarPuntajeItemsEvaluador(Session["Evaluacion"].ToString(), Session["Usuario"].ToString());
                    TF_Puntaje_Planteamiento.Text = DT_Proyecto.Rows[0]["PUNTAJE"].ToString();
                    TF_Puntaje_Justificacion.Text = DT_Proyecto.Rows[1]["PUNTAJE"].ToString();
                    TF_Puntaje_Objetivos.Text = DT_Proyecto.Rows[2]["PUNTAJE"].ToString();
                    TF_Puntaje_Metodologia.Text = DT_Proyecto.Rows[3]["PUNTAJE"].ToString();
                    TF_Puntaje_Impacto.Text = DT_Proyecto.Rows[4]["PUNTAJE"].ToString();
                    TF_Puntaje_Resultados.Text = DT_Proyecto.Rows[6]["PUNTAJE"].ToString();

                    DT_Proyecto = Mdl_Proyecto.ConsultarObservacionesEvaluacion(Session["Evaluacion"].ToString(), Session["Usuario"].ToString());
                    TA_Observaciones.Text = DT_Proyecto.Rows[0]["OBSERVACIONES"].ToString();
                }
            }
            catch
            {
                X.Redirect("~/Views/Privates/Inicio.aspx");
            }
        }

        protected void Btn_Puntaje_Planteamiento_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable DT_Mensaje = Mdl_Proyecto.AsignarPuntajeItem(Session["Evaluacion"].ToString(), "1", TF_Puntaje_Planteamiento.Text);
                if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
                    X.Msg.Alert("Registro exitoso", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "#{FormRegistro}.getForm().reset();").Show();
                else
                    X.Msg.Alert("Error", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
            }
            catch (Exception ex)
            {
                X.Msg.Alert("Error", ex.Message).Show();
            }
        }

        protected void Btn_Puntaje_Justificacion_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable DT_Mensaje = Mdl_Proyecto.AsignarPuntajeItem(Session["Evaluacion"].ToString(), "2", TF_Puntaje_Justificacion.Text);
                if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
                    X.Msg.Alert("Registro exitoso", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "#{FormRegistro}.getForm().reset();").Show();
                else
                    X.Msg.Alert("Error", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
            }
            catch (Exception ex)
            {
                X.Msg.Alert("Error", ex.Message).Show();
            }
        }
        protected void Btn_Puntaje_Objetivos_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable DT_Mensaje = Mdl_Proyecto.AsignarPuntajeItem(Session["Evaluacion"].ToString(), "3", TF_Puntaje_Objetivos.Text);
                if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
                    X.Msg.Alert("Registro exitoso", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "#{FormRegistro}.getForm().reset();").Show();
                else
                    X.Msg.Alert("Error", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
            }
            catch (Exception ex)
            {
                X.Msg.Alert("Error", ex.Message).Show();
            }
        }

        protected void Btn_Puntaje_Metodologia_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable DT_Mensaje = Mdl_Proyecto.AsignarPuntajeItem(Session["Evaluacion"].ToString(), "4", TF_Puntaje_Metodologia.Text);
                if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
                    X.Msg.Alert("Registro exitoso", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "#{FormRegistro}.getForm().reset();").Show();
                else
                    X.Msg.Alert("Error", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
            }
            catch (Exception ex)
            {
                X.Msg.Alert("Error", ex.Message).Show();
            }
        }

        protected void Btn_Puntaje_Impacto_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable DT_Mensaje = Mdl_Proyecto.AsignarPuntajeItem(Session["Evaluacion"].ToString(), "5", TF_Puntaje_Impacto.Text);
                if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
                    X.Msg.Alert("Registro exitoso", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "#{FormRegistro}.getForm().reset();").Show();
                else
                    X.Msg.Alert("Error", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
            }
            catch (Exception ex)
            {
                X.Msg.Alert("Error", ex.Message).Show();
            }
        }


        protected void Btn_Puntaje_Resultados_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable DT_Mensaje = Mdl_Proyecto.AsignarPuntajeItem(Session["Evaluacion"].ToString(), "7", TF_Puntaje_Resultados.Text);
                if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
                    X.Msg.Alert("Registro exitoso", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "#{FormRegistro}.getForm().reset();").Show();
                else
                    X.Msg.Alert("Error", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
            }
            catch (Exception ex)
            {
                X.Msg.Alert("Error", ex.Message).Show();
            }
        }


        protected void Btn_Guardar_Evaluacion_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable DT_Mensaje = Mdl_Proyecto.GuardarEvaluacion(Session["Evaluacion"].ToString(), TA_Observaciones.Text, TF_Puntaje_Planteamiento.Text,
                    TF_Puntaje_Justificacion.Text, TF_Puntaje_Objetivos.Text, TF_Puntaje_Metodologia.Text, TF_Puntaje_Impacto.Text, TF_Puntaje_Resultados.Text);
                if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
                    X.Msg.Alert("Registro exitoso", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "new function(){location.href = 'EvaluarProyectos.aspx'}").Show();
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