using System.Collections.Generic;
using System.Data;
using Construccion.Models.conexion;


namespace Construccion.Models.Modelos_chaira
{
    public class USUARIOS
    {

        private Conexion conect = new Conexion();


        public string id { get; set; }
        public string nombre { get; set; }
        public string correo { get; set; }
        public string contra { get; set; }
        public string rol { get; set; }




        public DataTable Login(USUARIOS obj)
        {
            List<Parametro> p = new List<Parametro>();
            p.Add(new Parametro(
                "email_usuari",
                obj.correo,
                "VARCHAR",
                ParameterDirection.Input
                ));

            p.Add(new Parametro(
               "contra",
               obj.contra,
               "VARCHAR",
               ParameterDirection.Input
               ));

            return conect.ExecuteProcedure("login", p);

        }

        public DataTable consul_Par_Evaluador()
        {
            //List<Parametro> p = new List<Parametro>();



            return conect.ExecuteProcedure("consul_Par_Evaluador_Docentes", null);

        }

        public DataTable Consul_Es_par(USUARIOS obj)
        {
            List<Parametro> p = new List<Parametro>();
            p.Add(new Parametro(
                "ID_PER",
                obj.id,
                "VARCHAR",
                ParameterDirection.Input
                ));



            return conect.ExecuteProcedure("Consul_Es_par", p);

        }
    }
}