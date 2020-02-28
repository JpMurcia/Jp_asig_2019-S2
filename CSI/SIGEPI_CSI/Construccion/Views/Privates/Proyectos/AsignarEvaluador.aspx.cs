using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
//using PEPEPS.Models;
using System.Data;
using Construccion.Models.Modelos_chaira;

namespace Construccion.Views.Privates.Proyectos
{
    public partial class AsignarEvaluador : System.Web.UI.Page
    {
        //PE_PROYECTO Mdl_Proyecto = new PE_PROYECTO();
        PROYECTO dt = new PROYECTO();
        USUARIOS dt2 = new USUARIOS();

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
                        //
                        Store_Proyectos.DataSource = dt.consultargrupoModel();
                        Store_Proyectos.DataBind();
                        DataTable DT_Evaluadores = dt2.consul_Par_Evaluador();
                        Str_Evaluador_1.DataSource = DT_Evaluadores;
                        Str_Evaluador_1.DataBind();
                        Str_Evaluador_2.DataSource = DT_Evaluadores;
                        Str_Evaluador_2.DataBind();
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

        protected void Btn_Asignar_Evaluadores_Click(object sender, DirectEventArgs e)
        {
            Ventana_Evaluadores.Show();
            CB_Evaluador_1.Text = "";
            CB_Evaluador_2.Text = "";
            CB_Evaluador_1.Selectable = true;
            CB_Evaluador_2.Selectable = true;
            Lbl_Proyecto.Text = e.ExtraParams["NOM_PROYECTO"].ToString();
            Session["Ev1"] = true;
            Session["Ev2"] = true;
            Session["ID"] = e.ExtraParams["COD_PROYECTO"].ToString();
            dt.id_proye = e.ExtraParams["COD_PROYECTO"].ToString();
            DataTable DT_Evaluadores = dt.consultarParEvaluador(dt);
            string hola = DT_Evaluadores.ToString();
            if (DT_Evaluadores.Rows.Count.Equals(1))
            {
                CB_Evaluador_1.Select(DT_Evaluadores.Rows[0]["ID"].ToString());
                CB_Evaluador_1.Selectable = false;
                Session["Ev1"] = false;
            }
            else if (DT_Evaluadores.Rows.Count.Equals(2))
            {
                CB_Evaluador_1.Select(DT_Evaluadores.Rows[0]["ID"].ToString());
                CB_Evaluador_2.Select(DT_Evaluadores.Rows[1]["ID"].ToString());
                CB_Evaluador_1.Selectable = false;
                CB_Evaluador_2.Selectable = false;
                Session["Ev1"] = false;
                Session["Ev2"] = false;
            }
        }

        protected void Btn_Guardar_Evaluadores_Click(object sender, DirectEventArgs e)
        {
            try
            {
                DataTable DT_Mensaje1, DT_Mensaje2;
                dt.id_proye = Session["ID"].ToString();
                if (!CB_Evaluador_1.SelectedItem.IsEmptyObject() && !CB_Evaluador_2.SelectedItem.IsEmptyObject() && (bool)Session["Ev1"] && (bool)Session["Ev2"])
                {
                    if (!CB_Evaluador_1.SelectedItem.Value.Equals(CB_Evaluador_2.SelectedItem.Value))
                    {
                        dt.id_proye= Session["ID"].ToString();
                        DT_Mensaje1 = dt.AsignarEvaluador(CB_Evaluador_1.SelectedItem.Value, dt);
                        DT_Mensaje2 = dt.AsignarEvaluador(CB_Evaluador_2.SelectedItem.Value, dt);
                        Ventana_Evaluadores.Hide();
                        if (DT_Mensaje1.Rows[0]["TIPO"].Equals("3") && DT_Mensaje2.Rows[0]["TIPO"].Equals("3"))
                            X.Msg.Alert("Registro exitoso", "Evaluadores registrados correctamente.").Show();
                        else
                            X.Msg.Alert("Error!", DT_Mensaje1.Rows[0]["MENSAJE"].ToString()).Show();
                    }
                    else
                        X.Msg.Alert("Error!", "Debe seleccionar dos evaluadores diferentes").Show();
                }
                else if (!CB_Evaluador_1.SelectedItem.IsEmptyObject() && (bool)Session["Ev1"])
                {
                    if (!CB_Evaluador_2.SelectedItem.IsEmptyObject())
                    {
                        if (!CB_Evaluador_1.SelectedItem.Value.Equals(CB_Evaluador_2.SelectedItem.Value))
                        {
                            DT_Mensaje1 = dt.AsignarEvaluador(CB_Evaluador_1.SelectedItem.Value, dt);
                            Ventana_Evaluadores.Hide();
                            if (DT_Mensaje1.Rows[0]["TIPO"].Equals("3"))
                                X.Msg.Alert("Registro exitoso", DT_Mensaje1.Rows[0]["MENSAJE"].ToString(), "new function(){location.href = 'AsignarEvaluador.aspx'}").Show();
                            else
                                X.Msg.Alert("Error!", DT_Mensaje1.Rows[0]["MENSAJE"].ToString()).Show();
                        }
                        else
                            X.Msg.Alert("Error!", "Debe seleccionar dos evaluadores diferentes").Show();
                    }
                    else
                    {
                        DT_Mensaje1 = dt.AsignarEvaluador(CB_Evaluador_1.SelectedItem.Value, dt);
                        Ventana_Evaluadores.Hide();
                        if (DT_Mensaje1.Rows[0]["TIPO"].Equals("3"))
                            X.Msg.Alert("Registro exitoso", DT_Mensaje1.Rows[0]["MENSAJE"].ToString(), "new function(){location.href = 'AsignarEvaluador.aspx'}").Show();
                        else
                            X.Msg.Alert("Error!", DT_Mensaje1.Rows[0]["MENSAJE"].ToString()).Show();
                    }
                }
                else if (!CB_Evaluador_2.SelectedItem.IsEmptyObject() && (bool)Session["Ev2"])
                {
                    if (!CB_Evaluador_1.SelectedItem.IsEmptyObject())
                    {
                        if (!CB_Evaluador_1.SelectedItem.Value.Equals(CB_Evaluador_2.SelectedItem.Value))
                        {
                            
                            DT_Mensaje2 = dt.AsignarEvaluador(CB_Evaluador_2.SelectedItem.Value, dt);
                            Ventana_Evaluadores.Hide();
                            if (DT_Mensaje2.Rows[0]["TIPO"].Equals("3"))
                                X.Msg.Alert("Registro exitoso", DT_Mensaje2.Rows[0]["MENSAJE"].ToString(), "new function(){location.href = 'AsignarEvaluador.aspx'}").Show();
                            else
                                X.Msg.Alert("Error!", DT_Mensaje2.Rows[0]["MENSAJE"].ToString()).Show();
                        }
                        else
                            X.Msg.Alert("Error!", "Debe seleccionar dos evaluadores diferentes").Show();
                    }
                    else
                    {
                        DT_Mensaje2 = dt.AsignarEvaluador(CB_Evaluador_2.SelectedItem.Value, dt);
                        Ventana_Evaluadores.Hide();
                        if (DT_Mensaje2.Rows[0]["TIPO"].Equals("3"))
                            X.Msg.Alert("Registro exitoso", DT_Mensaje2.Rows[0]["MENSAJE"].ToString(), "new function(){location.href = 'AsignarEvaluador.aspx'}").Show();
                        else
                            X.Msg.Alert("Error!", DT_Mensaje2.Rows[0]["MENSAJE"].ToString()).Show();
                    }
                }
                else if (!(bool)Session["Ev1"] && !(bool)Session["Ev2"])
                    X.Msg.Alert("Info", "Los evaluadores ya fueron asignados.").Show();
                else if (!(bool)Session["Ev1"] && CB_Evaluador_2.SelectedItem.IsEmptyObject())
                    X.Msg.Alert("Info", "Por favor, selecciona al evaluador restante.").Show();
                else
                    X.Msg.Alert("Advertencia!", "Por favor, selecciona al menos a un evaluador.").Show();
            }
            catch (Exception ex)
            {
                X.Msg.Alert("Error!", ex.Message).Show();
            }
            finally
            {
                Session.Remove("ID");
                Session.Remove("Ev1");
                Session.Remove("Ev2");
            }
        
    
        
    }
    }
}