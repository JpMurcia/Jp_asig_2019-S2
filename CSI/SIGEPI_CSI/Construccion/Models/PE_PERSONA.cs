using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Construccion.Models.conexion;


namespace PEPEPS.Models
{
    public class PE_PERSONA
    {
        private Conexion conect = new Conexion();

        ConexionOracle conec = new ConexionOracle();

        public DataTable RegistrarDocente(string cedula, string nombres, string apellidos, string telefono, string correo, string contrasena)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("CEDULA", cedula, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("NOMBRES", nombres, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("APELLIDOS", apellidos, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("TELEFONO", telefono, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("CORREO", correo, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("CONTRASENA", contrasena, "VARCHAR2", ParameterDirection.Input));
            return conect.EjecutarProcedimiento("INSE_DOCENTE", "CR_SALIDA", P);
        }

        public DataTable RegistrarEvaluador(string cedula, string nombres, string apellidos, string telefono, string correo, string contrasena)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("CEDULA", cedula, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("NOMBRES", nombres, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("APELLIDOS", apellidos, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("TELEFONO", telefono, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("CORREO", correo, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("CONTRASENA", contrasena, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("INSE_EVALUADOR", "CR_SALIDA", P);
        }

        public DataTable ConsultarCodigoActivacion(string cedula)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("CEDULA", cedula, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("CONS_CODIGO_ACTIVACION", "CR_SALIDA", P);
        }

        public DataTable ConsultarInicioSesion(string correo, string contrasena)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("CORREO", correo, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("CONTRASENA", contrasena, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("CONS_LOGIN", "CR_SALIDA", P);
        }

        public DataTable ActivarCuenta(string usuario, string codigo)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("USUARIO", usuario, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("CODIGO", codigo, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("ACTIVAR_CUENTA", "CR_SALIDA", P);
        }

        public DataTable ConsultarTipoVinculacionCB()
        {
            return conec.EjecutarProcedimiento("CONS_TIPO_VINCULACION_CB", "CR_SALIDA", null);
        }

        public DataTable ConsultarTipoDependenciaCB()
        {
            return conec.EjecutarProcedimiento("CONS_TIPO_DEPENDENCIA_CB", "CR_SALIDA", null);
        }
        
        public DataTable ConsultarEvaluadoresCB()
        {
            return conec.EjecutarProcedimiento("CONS_EVALUADOR_CB", "CR_SALIDA", null);
        }

        public DataTable ConsultarUsuarioCorreo(string correo)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("CORREO", correo, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("CONS_USUARIO_CORREO", "CR_SALIDA", P);
        }

        public DataTable ConsultarUsuarioExistencia(string correo)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("CORREO", correo, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("CONS_USUARIO_EXISTENCIA", "CR_SALIDA", P);
        }

        public DataTable ConsultarUsuariosAll(string correo)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("CORREO", correo, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("CONS_USUARIOS_ALL", "CR_SALIDA", P);
        }

        public DataTable ConsultarUsuariosRol(string correo, string rol)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("CORREO", correo, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("ROL", rol, "NUMBER", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("CONS_USUARIOS_ROL", "CR_SALIDA", P);
        }

        public DataTable ConsultarRoles()
        {
            return conec.EjecutarProcedimiento("CONS_ROL_CB", "CR_SALIDA", null);
        }

        public DataTable ActualizarContrasena(string correo, string actual, string nueva)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("CORREO", correo, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("CONTRASENA_ACTUAL", actual, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("CONTRASENA_NUEVA", nueva, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("UPDA_CONTRASENA", "CR_SALIDA", P);
        }

        public DataTable RecuperarContrasena(string usuario, string key, string contrasena)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("USUARIO", usuario, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("CODIGO", key, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("CONTRASENA", contrasena, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("RECUPERAR_CONTRASENA", "CR_SALIDA", P);
        }

        public DataTable ActualizarPersona(string correo, string nombres, string apellidos, string telefono)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("CORREO", correo, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("NOMBRES", nombres, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("APELLIDOS", apellidos, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("TELEFONO", telefono, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("UPDA_PERSONA", "CR_SALIDA", P);
        }
    }
}