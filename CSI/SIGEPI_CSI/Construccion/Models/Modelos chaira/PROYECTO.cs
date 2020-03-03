using System.Collections.Generic;
using System.Data;
using Construccion.Models.conexion;



namespace Construccion.Models.Modelos_chaira
{
    public class PROYECTO
    {

        private Conexion conect = new Conexion();


        public string id_grupo { get; set; }
        public string nombreGrupo { get; set; }
        public string siglas { get; set; }
        public string objetivo { get; set; }
        public string ProgramaGrupo { get; set; }
        public string urlLogo { get; set; }
        public string mision { get; set; }
        public string vision { get; set; }
        public string justificacion { get; set; }
        public string quienesSomos { get; set; }
        public string id_proye { get; set; }




        public DataTable consultarProyec()
        {
            List<Parametro> p = new List<Parametro>();


            return conect.ExecuteProcedure("consul_proyectos", p);

        }

        public DataTable consultarParEvaluador(PROYECTO obj)
        {
            List<Parametro> p = new List<Parametro>();


            p.Add(new Parametro(
               "id_proyec",
               obj.id_proye,
               "VARCHAR",
               ParameterDirection.Input
               ));
            return conect.ExecuteProcedure("consul_Par_Evaluador_Proye", p);

        }


        public DataTable AsignarEvaluador(string id_evaluador, PROYECTO obj)
        {
            List<Parametro> p = new List<Parametro>();


            p.Add(new Parametro(
               "id_proyec",
               obj.id_proye,
               "VARCHAR",
               ParameterDirection.Input
               ));
            p.Add(new Parametro(
             "id_par",
             id_evaluador,
             "VARCHAR",
             ParameterDirection.Input
             ));
            return conect.ExecuteProcedure("insert_par_evaluador", p);

        }

        public DataTable ConsultarProyectosEvaluacion(string id, string correo)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro(
                "PROYECTO", 
                id, "NUMBER",
                ParameterDirection.Input
                ));
            P.Add(new Parametro("ID_USER",
                correo, 
                "VARCHAR2", 
                ParameterDirection.Input
                ));
            return conect.ExecuteProcedure("consul_Proyec_Evaulacion", P);
        }

        public DataTable ConsultarProyectosParaEvaluar(string id)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro(
                "ID_PER",
                id, "NUMBER",
                ParameterDirection.Input
                ));
         
            return conect.ExecuteProcedure("consul_Proyectos_del_Par", P);
        }


        public DataTable ConsultarPuntajeItemsEvaluador(string id)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro(
                "id_Evaluacion",
                id, "NUMBER",
                ParameterDirection.Input
                ));

            return conect.ExecuteProcedure("consul_Puntaje_Items_Evaluador", P);
        }

        
             public DataTable ConsultarObservacionesEvaluacion(string id)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro(
                "ID_EVAL",
                id, "NUMBER",
                ParameterDirection.Input
                ));

            return conect.ExecuteProcedure("consultar_Observaciones_Evaluacion", P);
        }


        public DataTable AsignarPuntajeItem(string Id, string Id_Item,string Puntaje)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro(
                "id_Evaluacion",
                Id, "NUMBER",
                ParameterDirection.Input
                ));
            P.Add(new Parametro(
               "id_Item",
               Id_Item, "NUMBER",
               ParameterDirection.Input
               ));
            P.Add(new Parametro(
               "Puntaje",
               Puntaje, "NUMBER",
               ParameterDirection.Input
               ));

            return conect.ExecuteProcedure("asignar_Puntaje_Item", P);
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
            return conect.ExecuteProcedure("UPDA_EVALUACION",  P);
        }


        public DataTable ConsultarEvaluaciones()
        {
            return conect.ExecuteProcedure("consul_Evaluaciones",  null);
        }

        public DataTable ConsultarEvaluacionesReport()
        {
            return conect.ExecuteProcedure("consul_Evaluaciones_Detalle",  null);
        }


        public DataTable ConsultarPuntajeItemsEvaluador(string evaluacion, string correo)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("EVALUACION", evaluacion, "NUMBER", ParameterDirection.Input));
            P.Add(new Parametro("CORREO", correo, "VARCHAR2", ParameterDirection.Input));
            return conect.ExecuteProcedure("consul_Evaluaciones_Detalle", P);
        }

        public DataTable ConsultarPuntajeItems(string evaluacion)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("EVALUACION", evaluacion, "NUMBER", ParameterDirection.Input));
            return conect.ExecuteProcedure("consul_Puntaje_Item", P);
        }

        public DataTable ConsultarEvaluacionId(string evaluacion)
        {
            List<Parametro> P = new List<Parametro>();
            P.Add(new Parametro("EVALUACION", evaluacion, "NUMBER", ParameterDirection.Input));
            return conect.ExecuteProcedure("consul_Evaluaciones_Detalle", P);
        }

    }
}

