using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using PEPEPS.Models;
using System.Data;
using System.IO;

namespace PEPEPS.Views.Privates.Proyectos
{
    public partial class VerProyectosUsuario : System.Web.UI.Page
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
                    string us = Session["Usuario"].ToString();
                    if (us.Equals("r.lopez@udla.edu.co") || us.Equals("edwa.perdomo@udla.edu.co") ||
                        us.Equals("a.guayara@udla.edu.co") || us.Equals("d.giraldo@udla.edu.co") ||
                        us.Equals("cesar.jaramillo@udla.edu.co") || us.Equals("do.castano@udla.edu.co") ||
                        us.Equals("ju.garcia@udla.edu.co") || us.Equals("jac.vega@udla.edu.co") ||
                        us.Equals("jos.sanchez@udla.edu.co") || us.Equals("p.franco@udla.edu.co") ||
                        us.Equals("m.saldana@udla.edu.co") || us.Equals("n.baldrich@udla.edu.co") ||
                        us.Equals("a.jurado@udla.edu.co") || us.Equals("jua.montoya@udla.edu.co"))
                        FC_Propuesta.Visible = true;

                    DT_Proyecto = Mdl_Proyecto.ConsultarProyectosCoordinador(Session["Usuario"].ToString());
                    if (DT_Proyecto.Rows.Count > 0)
                    {
                        if (DT_Proyecto.Rows[0]["PARCIAL2"].ToString().Length != 0)
                        {
                            FU_Archivo.FieldLabel = "Actualizar informe parcial #2";
                            HL_Informe_Parcial2.NavigateUrl = DT_Proyecto.Rows[0]["PARCIAL2"].ToString();
                            HL_Informe_Parcial2.Target = "_blank";
                        }
                        HL_Proyecto.Text = DT_Proyecto.Rows[0]["PROYECTO"].ToString();
                        HL_Proyecto.NavigateUrl = DT_Proyecto.Rows[0]["ARCHIVO"].ToString();
                        HL_Informe_Parcial.NavigateUrl = DT_Proyecto.Rows[0]["PARCIAL"].ToString();
                        Session["Proyecto"] = DT_Proyecto.Rows[0]["PROYECTO_ID"].ToString();
                    }

                    //if (DT_Proyecto.Rows.Count == 1)
                    //{
                    //    FC_Presupuesto.Visible = true;
                    //}
                    //else if (DT_Proyecto.Rows.Count == 2)
                    //{
                    //    HL_Presupuesto.Visible = true;
                    //    HL_Presupuesto.Text = "Ver presupuesto";
                    //    HL_Presupuesto.NavigateUrl = DT_Proyecto.Rows[1]["ARCHIVO"].ToString();
                    //}
                }
            }
            catch
            {
                X.Redirect("~/Views/Publics/Login.aspx");
            }
        }

        protected void Btn_Guardar_Archivo_Click(object sender, DirectEventArgs e)
        {
            try
            {
                if (FU_Archivo.HasFile)
                {
                    string tipo_archivo = Path.GetExtension(FU_Archivo.FileName);
                    DataTable DT_Mensaje = Mdl_Proyecto.RegistrarInformeParcial(Session["Proyecto"].ToString(), tipo_archivo);
                    if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
                    {
                        FU_Archivo.PostedFile.SaveAs(Server.MapPath(DT_Mensaje.Rows[0]["RUTA"].ToString()));
                        X.Msg.Alert("Registro exitoso", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "new function(){location.href = 'VerProyectosUsuario.aspx'}").Show();
                    }
                    else
                        X.Msg.Alert("Error!", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
                }
                else
                    X.Msg.Alert("Error", "Por favor, seleccione el archivo.").Show();
            }
            catch (Exception ex)
            {
                X.Msg.Alert("Error", "Lo sentimos, hubo un error inesperado en el registro. " + ex.Message).Show();
            }
        }

        //protected void Btn_Guardar_Presupuesto_Click(object sender, DirectEventArgs e)
        //{
        //    try
        //    {
        //        if (FU_Presupuesto.HasFile)
        //        {
        //            string tipo_archivo = Path.GetExtension(FU_Presupuesto.FileName);
        //            DataTable DT_Mensaje = Mdl_Proyecto.RegistrarPresupuesto(Session["Proyecto"].ToString(), tipo_archivo);
        //            if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
        //            {
        //                FU_Presupuesto.PostedFile.SaveAs(Server.MapPath(DT_Mensaje.Rows[0]["RUTA"].ToString()));
        //                X.Msg.Alert("Registro exitoso", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "new function(){location.href = 'VerProyectosUsuario.aspx'}").Show();
        //            }
        //            else
        //                X.Msg.Alert("Error!", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
        //        }
        //        else
        //            X.Msg.Alert("Error", "Por favor, seleccione el archivo.").Show();
        //    }
        //    catch (Exception ex)
        //    {
        //        X.Msg.Alert("Error", "Lo sentimos, hubo un error inesperado en el registro. " + ex.Message).Show();
        //    }
        //}
    }
}