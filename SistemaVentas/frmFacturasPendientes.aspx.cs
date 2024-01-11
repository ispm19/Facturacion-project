using CapaDatos;
using CapaModelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaVentas
{
    public partial class frmFacturasPendientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static Respuesta<Venta> ObtenerDetalle(int IdVenta)
        {
            Venta oVenta = new Venta();
            oVenta = CD_Venta.Instancia.ObtenerDetalleVenta(IdVenta);
            if (oVenta != null)
                return new Respuesta<Venta>() { estado = true, objeto = oVenta };
            else
                return new Respuesta<Venta>() { estado = false, objeto = null };
        }

        [WebMethod]
        public static Respuesta<List<Venta>> ObtenerListaFPendientes()
        {
            List<Venta> oListaVenta = new List<Venta>();
            oListaVenta = CD_Venta.Instancia.ObtenerListaFPendientes();
            if (oListaVenta != null)
                return new Respuesta<List<Venta>>() { estado = true, objeto = oListaVenta };
            else
                return new Respuesta<List<Venta>>() { estado = false, objeto = null };
        }
        [WebMethod]
        public static Respuesta<bool> Editar(Venta oVenta)
        {
            Respuesta<bool> respuesta = new Respuesta<bool>();
            try
            {
                respuesta.estado = CD_Venta.Instancia.ModificarFPendientes(oVenta);
            }
            catch (Exception ex)
            {
                respuesta.estado = false;
                respuesta.valor = ex.Message;
            }
            return respuesta;
        }

    }
}
    