using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using PEPEPS.Models;
using System.Data;

namespace PEPEPS.Views.Usuarios
{
    public partial class ActivarCuenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Btn_Activar_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable DT_Mensaje = new PE_PERSONA().ActivarCuenta(Request.QueryString["id"].ToString(), Request.QueryString["key"].ToString());
                if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
                {
                    X.Msg.Alert("Éxito", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "new function(){location.href = 'Login.aspx'}").Show();
                }
                else
                {
                    X.Msg.Alert("Error", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "new function(){location.href = 'Login.aspx'}").Show();
                }
            }
            catch (Exception ex)
            {
                X.Msg.Alert("Error", ex.Message).Show();
            }
        }
        
    }
}