using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using Construccion.Models.Modelos_chaira;

namespace Construccion.Views.Usuarios
{
    public partial class Login : System.Web.UI.Page
    {
         USUARIOS user = new USUARIOS();


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Session["Usuario"].ToString().Equals(null))
                {
                    X.Redirect("~/Views/Privates/Inicio.aspx");
                }
            }
            catch
            {
            }
            form1.Style.Add("background-image", Page.ResolveUrl("~/Views/Publics/Content/Images/background-image.jpg"));
        }

        protected void Btn_Ingresar_Click(object sender, EventArgs e)
        {
            try
            {
                user.contra = TB_Contrasena.Text;
                user.correo = TB_Correo.Text;
                DataTable DT_Mensaje = user.Login(user);
                if (DT_Mensaje.Rows[0]["mensaje"].ToString().Equals("si"))
                {
                  
                    Session["usuario"] = TB_Correo.Text;
                    Session["rol"] = DT_Mensaje.Rows[0]["ID_ROL"];
                    X.Redirect("~/Views/Privates/Inicio.aspx");
                }
                else
                    X.Msg.Alert("Error", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
            }
            catch (Exception ex)
            {
                X.Msg.Alert("Error", ex.Message).Show();
            }
        }

        protected void Btn_Recuperar_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    if (TF_Recuperar.Text.Length > 0)
            //    {
            //        DataTable DT_Mensaje = P.ConsultarUsuarioExistencia(TF_Recuperar.Text);
            //        if (DT_Mensaje.Rows[0]["TIPO"].ToString().Equals("3"))
            //        {

            //            var fromAddress = new MailAddress("correos.pepeps@gmail.com", "Proyección y extensión social - UDLA");
            //            var toAddress = new MailAddress(TF_Recuperar.Text, "Extensión y Proección social - UDLA");
            //            string fromPassword = "PePePs2019";
            //            string subject = "Recuperación de contraseña";
            //            string body = String.Format("Estimado/a " + DT_Mensaje.Rows[0]["NOMBRE"].ToString() + ", {0}{0}Se solicitó la " +
            //                "recuperación de contraseña de su cuenta de la plataforma para la presentación y evaluación de proyectos " +
            //                "de proyectos de extensión y/o proyección social. {0}Si usted no realizó la solicitud, haga caso omiso a este correo. " +
            //                "De lo contrario, dirijase al siguiente enlace: {0}{0}" +
            //                "http://giecom.co/PEPEPS/Views/Publics/RecuperarContrasena.aspx?id=" + DT_Mensaje.Rows[0]["ID"].ToString() + 
            //                "&key=" + DT_Mensaje.Rows[0]["CODIGO"].ToString() +
            //                "{0}{0} Cordialmente, {0} Equipo de desarrollo PEPEPS", Environment.NewLine);

            //            var smtp = new SmtpClient
            //            {
            //                Host = "smtp.gmail.com",
            //                Port = 587,
            //                EnableSsl = true,
            //                DeliveryMethod = SmtpDeliveryMethod.Network,
            //                UseDefaultCredentials = false,
            //                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            //            };
            //            using (var message = new MailMessage(fromAddress, toAddress)
            //            {
            //                Subject = subject,
            //                Body = body
            //            })
            //            {
            //                smtp.Send(message);
            //            }
            //            X.Msg.Alert("Éxito", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
            //        }
            //        else
            //            X.Msg.Alert("Error", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
            //    }
            //}
            //catch (Exception ex)
            //{
            //    X.Msg.Alert("Error", ex.Message).Show();
            //}
        }
    }
}