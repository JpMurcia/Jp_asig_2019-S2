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


    }
}

