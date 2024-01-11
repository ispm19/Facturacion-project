using CapaModelo;
using CapaDatos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
   public class CD_Cliente
    {
        public static CD_Cliente _instancia = null;

        private CD_Cliente()
        {

        }

        public static CD_Cliente Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_Cliente();
                }
                return _instancia;
            }
        }

        public List<Cliente> ObtenerCliente()
        {
            List<Cliente> rptListaCliente = new List<Cliente>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_ObtenerClientes", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaCliente.Add(new Cliente()
                        {
                            IdCliente = Convert.ToInt32(dr["IdCliente"].ToString()),
                            Nombre = dr["Nombre"].ToString(),
                            Negocio = dr["Negocio"].ToString(),
                            TipoDocumento = dr["TipoDocumento"].ToString(),
                            NumeroDocumento = dr["NumeroDocumento"].ToString(),
                            Telefono = dr["Telefono"].ToString(),
                            Direccion = dr["Direccion"].ToString(),
                            Descuento = float.Parse(dr["Descuento"].ToString()),
                            Domicilio = float.Parse(dr["Domicilio"].ToString()),

                        });
                    }
                    dr.Close();

                    return rptListaCliente;

                }
                catch (Exception ex)
                {
                    rptListaCliente = null;
                    return rptListaCliente;
                }
            }
        }

        public bool RegistrarCliente(Cliente Cliente)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_RegistrarCliente", oConexion);
                    cmd.Parameters.AddWithValue("Nombre", Cliente.Nombre);
                    cmd.Parameters.AddWithValue("Negocio", Cliente.Negocio);
                    cmd.Parameters.AddWithValue("TipoDocumento", Cliente.TipoDocumento);
                    cmd.Parameters.AddWithValue("NumeroDocumento", Cliente.NumeroDocumento);
                    cmd.Parameters.AddWithValue("Telefono", Cliente.Telefono);
                    cmd.Parameters.AddWithValue("Descuento", Cliente.Descuento);
                    cmd.Parameters.AddWithValue("Direccion", Cliente.Direccion);
                    cmd.Parameters.AddWithValue("Domicilio", Cliente.Domicilio);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }

        public bool ModificarCliente(Cliente Cliente)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_ModificarCliente", oConexion);
                    cmd.Parameters.AddWithValue("IdCliente", Cliente.IdCliente);
                    cmd.Parameters.AddWithValue("Nombre", Cliente.Nombre);
                    cmd.Parameters.AddWithValue("Negocio", Cliente.Negocio);
                    cmd.Parameters.AddWithValue("TipoDocumento", Cliente.TipoDocumento);
                    cmd.Parameters.AddWithValue("NumeroDocumento", Cliente.NumeroDocumento);
                    cmd.Parameters.AddWithValue("Telefono", Cliente.Telefono);
                    cmd.Parameters.AddWithValue("Descuento", Cliente.Descuento);
                    cmd.Parameters.AddWithValue("Direccion", Cliente.Direccion);
                    cmd.Parameters.AddWithValue("Domicilio", Cliente.Domicilio);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;

                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }

        public bool EliminarCliente(int IdCliente)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_EliminarCliente", oConexion);
                    cmd.Parameters.AddWithValue("IdCliente", IdCliente);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }
    }
}
