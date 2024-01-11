using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;
using CapaModelo;

namespace SistemaVentas
{
    public partial class frmCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static Respuesta<List<Cliente>> Obtener()
        {
            List<Cliente> oListaCliente = CD_Cliente.Instancia.ObtenerCliente();
            oListaCliente = oListaCliente.ToList();


            if (oListaCliente != null)
            {
                return new Respuesta<List<Cliente>>() { estado = true, objeto = oListaCliente };
            }
            else
            {
                return new Respuesta<List<Cliente>>() { estado = false, objeto = null };
            }
        }
        [WebMethod]
        public static Respuesta<bool> Guardar(Cliente Cliente)
        {
            bool Respuesta = false;
            Respuesta = CD_Cliente.Instancia.RegistrarCliente(Cliente);
            return new Respuesta<bool>() { estado = Respuesta };
        }
        [WebMethod]
        public static Respuesta<bool> Editar(Cliente Cliente)
        {
            bool Respuesta = false;
            Respuesta = CD_Cliente.Instancia.ModificarCliente(Cliente);
            return new Respuesta<bool>() { estado = Respuesta };
        }
    }
}