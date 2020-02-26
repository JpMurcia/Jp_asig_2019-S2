using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using PEPEPS.Data.OracleConection;
using PEPEPS.Data;

namespace PEPEPS.Models
{
    public class PE_PROYECTO
    {
        ConexionOracle conec = new ConexionOracle();



        public DataTable RegistrarProyecto(string nombre, string fecha_inicio, string fecha_fin, string plan_problema, string justifica,
            string general, string especificos, string metodologia, string componente_inno, string result_esperado, string tipo_archivo,
            string coordinador, string grup_Exten, string poblacion, string depen)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("NOMBRE", nombre, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("FECHA_INICIO", fecha_inicio, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("FECHA_FIN", fecha_fin, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("PLANTEAMIENTO", plan_problema, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("JUSTIFICACION", justifica, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("OBJETIVO_GENERAL", general, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("OBJETIVOS_ESPECIFICOS", especificos, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("METODOLOGIA", metodologia, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("COMPONENTE_INNOVADOR", componente_inno, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("RESULTADOS_ESPERADOS", result_esperado, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("TIPO_ARCHIVO", tipo_archivo, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("COORDINADOR", coordinador, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("GRUPO_EXTENSION", grup_Exten, "VARCHAR2", ParameterDirection.Input));
            P.Add(new Parametro("POBLACION", poblacion, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("DEPENDENCIA", depen, "NUMBER", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("INSE_PROYECTO", "CR_SALIDA", P);
        }

        public DataTable RegistrarPresupuesto(string proyecto, string tipoarc)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("PROYECTO", proyecto, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("TIPO_ARCHIVO", tipoarc, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("INSE_PRESUPUESTO", "CR_SALIDA", P);
        }

        public DataTable ConsultarProyectos()
        {
            return conec.EjecutarProcedimiento("CONS_PROYECTOS_ALL", "CR_SALIDA", null);
        }

        public DataTable ConsultarProyectosEvaluacion(string id, string correo)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("PROYECTO", id, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("CORREO", correo, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("CONS_PROYECTO_EVALUACION", "CR_SALIDA", P);
        }

        public DataTable ConsultarEvaluadoresProyecto(string id)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("PROYECTO", id, "NUMBER", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("CONS_EVALUADORES_PROYECTO", "CR_SALIDA", P);
        }

        public DataTable ConsultarProyectosEvaluador(string correo)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("CORREO", correo, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("CONS_PROYECTOS_EVALUADOR", "CR_SALIDA", P);
        }

        public DataTable ConsultarProyectosCoordinador(string correo)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("CORREO", correo, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("CONS_PROYECTOS_COORDINADOR", "CR_SALIDA", P);
        }

        public DataTable ConsultarPuntajeItemsEvaluador(string evaluacion, string correo)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("EVALUACION", evaluacion, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("CORREO", correo, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("CONS_PUNTAJE_ITEMS_EVALUADOR", "CR_SALIDA", P);
        }

        public DataTable ConsultarPuntajeItems(string evaluacion)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("EVALUACION", evaluacion, "NUMBER", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("CONS_PUNTAJE_ITEMS", "CR_SALIDA", P);
        }

        public DataTable ConsultarObservacionesEvaluacion(string evaluacion, string correo)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("EVALUACION", evaluacion, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("CORREO", correo, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("CONS_OBSERVACIONES_EVALUACION", "CR_SALIDA", P);
        }

        public DataTable AsignarEvaluador(string evaluador, string proyecto)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("PROYECTO", proyecto, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("EVALUADOR", evaluador, "NUMBER", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("INSE_EVALUACION", "CR_SALIDA", P);
        }

        public DataTable AsignarPuntajeItem(string evaluacion, string item, string puntaje)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("EVALUACION", evaluacion, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("ITEM", item, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("PUNTAJE", puntaje, "NUMBER", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("UPDA_ITEM_EVALUACION", "CR_SALIDA", P);
        }

        public DataTable GuardarEvaluacion(string evaluacion, string observaciones, string plant, string justi, string obje, string meto, string impa, string resul)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("EVALUACION", evaluacion, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("PLANTEAMIENTO", plant, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("JUSTIFICACION", justi, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("OBJETIVOS", obje, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("METODOLOGIA", meto, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("IMPACTO", impa, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("RESULTADOS", resul, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("OBSERVACIONES", observaciones, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("UPDA_EVALUACION", "CR_SALIDA", P);
        }

        public DataTable ConsultarEvaluaciones()
        {
            return conec.EjecutarProcedimiento("CONS_EVALUACIONES", "CR_SALIDA", null);
        }

        public DataTable ConsultarEvaluacionesReport()
        {
            return conec.EjecutarProcedimiento("CONS_EVALUACIONES_REPORT", "CR_SALIDA", null);
        }

        public DataTable ConsultarProyectosGrupos()
        {
            return conec.EjecutarProcedimiento("CONS_PROYECTOS_GRUPOS", "CR_SALIDA", null);
        }

        public DataTable ConsultarEvaluacionId(string evaluacion)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("EVALUACION", evaluacion, "NUMBER", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("CONS_EVALUACION_ID", "CR_SALIDA", P);
        }

        public DataTable ActualizarArchivoProyecto(string proyecto, string tipo_archivo)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("PROYECTO", proyecto, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("TIPO_ARCHIVO", tipo_archivo, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("UPDA_ARCHVO_PROYECTO", "CR_SALIDA", P);

        }

        public DataTable RegistrarInformeParcial(string proyecto, string tipo_archivo)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("PROYECTO", proyecto, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("TIPO_ARCHIVO", tipo_archivo, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("INSE_INFORME_PARCIAL", "CR_SALIDA", P);

        }

        public DataTable RegistrarInformeFinal(string proyecto, string tipo_archivo)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("PROYECTO", proyecto, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("TIPO_ARCHIVO", tipo_archivo, "VARCHAR2", ParameterDirection.Input));
            return conec.EjecutarProcedimiento("INSE_INFORME_FINAL", "CR_SALIDA", P);

        }
    }
}