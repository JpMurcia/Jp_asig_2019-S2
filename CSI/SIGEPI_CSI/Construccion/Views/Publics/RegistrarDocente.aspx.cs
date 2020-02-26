using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using PEPEPS.Models;
using System.Net;
using System.Net.Mail;
using System.Data;

namespace PEPEPS.Views.Usuarios
{
    public partial class RegistrarDocente : System.Web.UI.Page
    {
        PE_PERSONA Mdl_Persona = new PE_PERSONA();
        protected void Page_Load(object sender, EventArgs e)
        {
            //CB_Rol.Select(0);
            //CB_Rol.Selectable = false;
            //CB_Vinculacion.Select(0);
        }

        protected void Btn_Registrar_Click(object sender, EventArgs e)
        {
            try
            {
                //if (TB_Correo.Text.Substring(TB_Correo.Text.LastIndexOf("@") + 1).Equals("udla.edu.co"))
                //{
                    DataTable DT_Mensaje = Mdl_Persona.RegistrarDocente(TB_Cedula.Text, TB_Nombre.Text, TB_Apellido.Text, TB_Telefono.Text, TB_Correo.Text, TB_Contrasena.Text);
                    if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
                    {
                        DataTable DT = Mdl_Persona.ConsultarCodigoActivacion(TB_Cedula.Text);

                        this.EnviarCorreoActivacion(TB_Correo.Text, DT.Rows[0]["ID"].ToString(), DT.Rows[0]["KEY"].ToString());

                        X.Msg.Alert("Registro exitoso", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "#{FormRegistro}.getForm().reset();").Show();
                    }
                    else
                        X.Msg.Alert("Error", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
                //}
                //else
                //    X.Msg.Alert("Error", "Por favor, use el correo institucional (@udla.edu.co)").Show();

                //if (CB_Rol.SelectedItem.Value.Equals("Docente"))
                //{
                //    if (TB_Correo.Text.Substring(TB_Correo.Text.LastIndexOf("@") + 1).Equals("udla.edu.co"))
                //    {
                //        DataTable DT_Mensaje = Mdl_Persona.RegistrarDocente(TB_Cedula.Text, TB_Nombre.Text, TB_Apellido.Text, TB_Telefono.Text, TB_Correo.Text, TB_Contrasena.Text);
                //        if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
                //        {
                //            DataTable DT = Mdl_Persona.ConsultarCodigoActivacion(TB_Cedula.Text);

                //            this.EnviarCorreoActivacion(TB_Correo.Text, DT.Rows[0]["ID"].ToString(), DT.Rows[0]["KEY"].ToString());

                //            X.Msg.Alert("Registro exitoso", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "#{FormRegistro}.getForm().reset();").Show();
                //        }
                //        else
                //            X.Msg.Alert("Error", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
                //    }
                //    else
                //        X.Msg.Alert("Error", "Por favor, use el correo institucional (@udla.edu.co)").Show();
                //}
                //else
                //{
                //    DataTable DT_Mensaje = Mdl_Persona.RegistrarEvaluador(TB_Cedula.Text, TB_Nombre.Text, TB_Apellido.Text, TB_Telefono.Text, TB_Correo.Text, TB_Contrasena.Text);
                //    if (DT_Mensaje.Rows[0]["TIPO"].Equals("3"))
                //    {
                //        DataTable DT = Mdl_Persona.ConsultarCodigoActivacion(TB_Cedula.Text);

                //        this.EnviarCorreoActivacion(TB_Correo.Text, DT.Rows[0]["ID"].ToString(), DT.Rows[0]["KEY"].ToString());

                //        X.Msg.Alert("Registro exitoso", DT_Mensaje.Rows[0]["MENSAJE"].ToString(), "#{FormRegistro}.getForm().reset();").Show();
                //    }
                //    else
                //        X.Msg.Alert("Error", DT_Mensaje.Rows[0]["MENSAJE"].ToString()).Show();
                //}
            }
            catch (Exception ex)
            {
                X.Msg.Alert("Error", ex.Message).Show();
            }
        }

        private bool EnviarCorreoActivacion(string Destino, string id, string codigo)
        {
            try
            {
                var fromAddress = new MailAddress("correos.pepeps@gmail.com", "Proyección y extensión social - UDLA");
                var toAddress = new MailAddress(Destino, "Proyección y extensión social - UDLA");
                string fromPassword = "PePePs2019";
                string subject = "EPS - UDLA - Verifique dirección de correo electrónico.";
                string body = String.Format("Estimado/a " + TB_Nombre.Text + ": {0}{0}Verifique su dirección " +
                    "de correo electrónico para completar el registro de su cuenta " +
                    "para la presentación de proyectos de extensión y/o proyección social. {0}" +
                    "Para confirmar su cuenta dirijase al siguiente enlace: {0}" +
                    "http://giecom.co/PEPEPS/Views/Publics/ActivarCuenta.aspx?id=" + id + "&key=" + codigo +
                    "{0}{0}", Environment.NewLine);

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                };
                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = body
                })
                {
                    smtp.Send(message);
                }
                return true;

            }catch (Exception ex)
            {
                X.Msg.Alert("Error", ex.Message).Show();
                return false;
            }
        }
    }
}