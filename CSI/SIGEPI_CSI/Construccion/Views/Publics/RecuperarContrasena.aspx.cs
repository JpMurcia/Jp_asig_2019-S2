using Ext.Net;
using PEPEPS.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PEPEPS.Views.Publics
{
    public partial class RecuperarContrasena : System.Web.UI.Page
    {
        PE_PERSONA Mdl_Persona = new PE_PERSONA();
        protected void Page_Load(object sender, EventArgs e)
        {
            form1.Style.Add("background-image", Page.ResolveUrl("~/Views/Publics/Content/Images/background-image.jpg"));
        }

        protected void Btn_Recuperar_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable DT_Mensaje = Mdl_Persona.RecuperarContrasena(Request.QueryString["id"].ToString(), Request.QueryString["key"].ToString(), TB_Contrasena_Nueva.Text);
                if (DT_Mensaje.Rows[0]["TIPO"].ToString().Equals("3"))
                {
                    X.Msg.Alert("Éxito", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "new function(){location.href = 'Login.aspx'}").Show();
                }
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