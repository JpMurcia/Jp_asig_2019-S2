using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using Ext.Net;
using PEPEPS.Models;
using System;

namespace PEPEPS.Views.Privates.Proyectos
{
    public partial class RegistrarProyecto : System.Web.UI.Page
    {
        DataTable DT_Persona;
        PE_PERSONA Mdl_Persona = new PE_PERSONA();
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
                        DT_Persona = Mdl_Persona.ConsultarUsuarioCorreo(Session["Usuario"].ToString());
                        TF_Nombre.Text = DT_Persona.Rows[0]["NOMBRES"].ToString() + " " + DT_Persona.Rows[0]["APELLIDOS"].ToString();
                        TF_Cedula.Text = DT_Persona.Rows[0]["CEDULA"].ToString();
                        TF_Telefono.Text = DT_Persona.Rows[0]["TELEFONO"].ToString();
                        TF_Correo.Text = DT_Persona.Rows[0]["CORREO"].ToString();

                        //StoreComboDependencia.DataSource = Mdl_Persona.ConsultarTipoDependenciaCB();
                        //StoreComboDependencia.DataBind();
                        //StoreComboVincular.DataSource = Mdl_Persona.ConsultarTipoVinculacionCB();
                        //StoreComboVincular.DataBind();

                    }
                    Lbl_Fecha.Text = DateTime.Today.ToString("yyyy/MM/dd");
                }
            }
            catch
            {
                X.Redirect("~/Views/Publics/Login.aspx");
            }
        }
        

        protected void Btn_Registrar_Click(object sender, DirectEventArgs e)
        {
            try
            {
                if (FU_Archivo.HasFile)
                {
                    string tipo_archivo = Path.GetExtension(FU_Archivo.FileName);
                    DataTable DT_Mensaje = Mdl_Proyecto.RegistrarProyecto(TF_Nombre_Proyecto.Text, DF_Fecha_Inicio.SelectedDate.ToString("yyyy/MM/dd"),
                        DF_Fecha_Culminacion.SelectedDate.ToString("yyyy/MM/dd"), TA_Planteamiento.Text, TA_Justificacion.Text, TA_Objetivo_General.Text, TA_Objetivo_Especifico.Text,
                        TA_Metodologia.Text, TA_Componente_Innovador.Text, TA_Resultados_Esperados.Text, tipo_archivo, TF_Correo.Text, TF_Nombre_Grupo_Ext.Text, "1", "1");
                    if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
                    {
                        FU_Archivo.PostedFile.SaveAs(Server.MapPath(DT_Mensaje.Rows[0]["RUTA"].ToString()));
                        X.Msg.Alert("Registro exitoso", "La propuesta fue registrada correctamente!", "new function(){location.href = 'RegistrarProyecto.aspx'}").Show();
                    }
                    else
                        X.Msg.Alert("Error!", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
                }
                else
                    X.Msg.Alert("Error", "Cargue el archivo de propuesta.").Show();
            }
            catch (Exception ex)
            {
                X.Msg.Alert("Error", "Lo sentimos, hubo un error inesperado en el registro. "+ex.Message).Show();
            }
        }
    }
}