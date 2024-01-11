
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="docVenta.aspx.cs" Inherits="SistemaVentas.docVenta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>

    <div style="font-size: 11px; text-align: right;">
            <center>
                <button type="button" id="Imprimir" onclick="javascript:imprSelec('seleccion')">IMPRIMIR</button>
            </center>
            
   </div>
    <div id="seleccion">
        <center>
            <div>
                <table style="width: 10px; height: 100px; border:2px solid #000; padding: 5px;" border="0">
                    <tbody>
                        <tr align="center">
                            <td colspan="4" align="center">
                                <h2 style="color:blue; margin:1px;">
                                    REAL GAS
                                </h2> 
                               
                                RNC <span id="ructienda"></span>
                                
                                <hr />
                                <span style="margin-top: 10px;">
                                    Acomodado a tu nececidad <br />
                                    WhatsApp: 829-518-7436 <br />
                                    CEL: 829-456-3030 <br />
                                    Email: realcomp.gas@gmail.com <br />
                                    @REALGAS_RD <br />
                                    Fecha:
                                    <label id="texto_nav1">
                                        
                                </label>
                                    
                                </span>
                                <tr align="center">
                                
                            <td colspan="4"  align="center" style="vertical-align: top;">
                                <table border="1" style="width: 100%; height: 10px; font-weight: bold; ">
                                    
                                    <tr bgcolor="#D9D9D9"><td align="center"><span id="tipodocumento"></span></td></tr>
                                    <tr><td align="center">NRO - <span id="codigodocumento"></span> </td></tr>
                                </table>
                            </td>
                                     
                        </tr>
                                
                               
                                <HR />
                            </td>
                        </tr>
                       
                       <!-- <tr>
                            <td colspan="4" align="center"><span id="direcciontienda"></span></td>
                        </tr>
                        <tr style="height: 20px;"><td colspan="6"><br /></td></tr>
                        <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr> -->
                       <tr>
                           <td colspan="10">
                               <table style=" width: 50%;" border="0">
                                   <tr>
                                       <td colspan="1" style="width:50px !important">Cliente:</td>
                                       <td colspan="2" style="border-bottom:1px solid #000"><span id="nombrescliente"></span></td>
                                   </tr>
                                   <!--
                                   <tr>
                                       <td colspan="1" style="width:50px !important">Direccion:</td>
                                       <td colspan="2" style="border-bottom:1px solid #000"><span id="direccioncliente"></span></td>
                                   </tr>
                                       
                                   -->
                                   <tr>
                                       <td colspan="1" style="width:50px">Nro.Documento:</td>
                                       <td colspan="2" style="border-bottom:1px solid #000"><span id="documentocliente"></span></td>
                                   </tr>
                                   <!--
                                   <tr>
                                       <td colspan="1" style="width:50px"> Telefono:</td>
                                       <td colspan="2" style="border-bottom:1px solid #000"><span id="telefonocliente"></span></td>
                                    </tr> -->
                                    <tr>
                                       <td colspan="1" style="width:50px"> Fecha de compra:</td>
                                       <td colspan="2" style="border-bottom:1px solid #000"><span id="fecharegistro"></span></td>
                                   </tr>
                               </table>
                           </td>
                       </tr> 
                        <tr style="height: 10px;"></tr>
                        <tr>
                            <td colspan="6">
                                <table id="tbVentas" border="1" style="width: 100%;">
                                    <thead>
                                        <tr class="desc1" bgcolor="#D9D9D9">
                                            <th style="width: 15%;">Cantidad</th>
                                            <th style="width: 45%;">Descripcion</th>
                                            <th style="width: 20%;">P. Por Galon</th>
                                            <th style="width: 20%;">Importe</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 1px; margin-top: 2px;">

                                <tr>
                                        <td id="tdescuento">Desc. por Galon: <span id="descuentocliente"></span></td>
                                    
                                    <td><span>ITBIS: RD$0.00</span></td>
                       </tr>
                                </tr>
                        
                        
                        
                        <tr>
                            <td colspan="4">
                                <table width='250' border='1'>
                                    <tr style='border:1px solid black;'>
                                        
                                        <td bgcolor='#D9D9D9'>Pago con S/.</td>
                                        <td><span id="importerecibido"></span></td>
                                        <td bgcolor='#D9D9D9'>Cambio S/.</td>
                                        <td><span id="importecambio"></span></td>
                                        
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr style="height: 2px; margin-top: 2px; font-weight: bold; ">
                            <td bgcolor=red>Monto deudado S/.</td>
                                        <td><span id="txtdeuda"></span></td>
                           

                        </tr>
                   <!--     <tr style="height: 2px; margin-top: 2px; font-weight: bold; ">
                            <td bgcolor=gray>Metodo de Pago</td>
                                        <td><span id="txtmetodopago"></span></td>
                           

                        </tr>-->
                        <tr>

                            <td colspan="4" align="center">
                                <table style="font-weight: bold; width: 150px;">
                                    <tr>
                                        <td>Total S/.</td>
                                        <td bgcolor="#D9D9D9" style="font-size:22px; width:70%; border:1px solid black;"><span id="totalcosto" style="font-size:22px"></span></td>  
                                    </tr>
                                </table>
                                <br />
                                Atendido por: <span id="nombreempleado"></span><br />
                                
                                Firma de cliente: __________________________
                                <hr />
                            <!--    <tr align="center">
                            <td colspan="4" align="center">Atendido por: <span id="nombreempleado"></span></td>
                        </tr> -->
                        <h5 align="center">¡GRACIAS POR SU COMPRA!</h5>
                            </td>

                        </tr>
                        
                    </tbody>
                </table>
            </div>
        </center>
    </div>

    <script src="Assets/Plugins/jquery/jquery.3.5.1.min.js"></script>
   <script src="Controlador/Utilidades.js"></script>
   <script src="Assets/Plugins/loadingoverlay/loadingoverlay.js"></script>
    <script src="Controlador/frmCrearVenta/frmCrearVenta.js"></script>
   <script type="text/javascript" language="javascript">
       var hoy = new Date();

       // obtener la fecha de hoy en formato `MM/DD/YYYY`
       var fecha = hoy.getDate() + '-' + (hoy.getMonth() + 1) + '-' + hoy.getFullYear();
       var hora = hoy.getHours() + ':' + hoy.getMinutes() + ':' + hoy.getSeconds();
       var objetivo = document.getElementById('texto_nav1');
       objetivo.innerHTML = fecha + ' ' + hora;

       $(document).ready(function () {
            const queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            const IdVenta = urlParams.get('id')
            
           CargarDatos(IdVenta);
       }); 

       function CargarDatos($IdVenta) {
           
            $('#tbCompras tbody').html('');

            var request = {
                IdVenta: $IdVenta
           };

           AjaxPost("../frmConsultarVenta.aspx/ObtenerDetalle", JSON.stringify(request),
               function (response) {
                   $("#seleccion").LoadingOverlay("hide");
                   if (response.estado) {
                       $("#ructienda").text(response.objeto.oTienda.RUC);
                       $("#tipodocumento").text(response.objeto.TipoDocumento);
                       $("#codigodocumento").text(response.objeto.Codigo);

                       
                       $("#nombreempleado").text(response.objeto.oUsuario.Nombres + " " + response.objeto.oUsuario.Apellidos);
                       $("#direcciontienda").text(response.objeto.oTienda.Direccion);
                       $("#txtmetodopago").text(response.objeto.MetodoPago);
                       $("#nombrescliente").text(response.objeto.oCliente.Nombre);
                       $("#direccioncliente").text(response.objeto.oCliente.Direccion);
                       $("#documentocliente").text(response.objeto.oCliente.NumeroDocumento);
                       $("#telefonocliente").text(response.objeto.oCliente.Telefono);
                       $("#descuentocliente").text(response.objeto.oCliente.Descuento.toLocaleString('es-DO', { style: 'currency', currency: 'DOP' }));
                       $("#fecharegistro").text(response.objeto.FechaRegistro);

                       var descuento = (response.objeto.oCliente.Descuento);
                       if (descuento <= 0) {
                           document.getElementById('tdescuento').style.visibility = "hidden";
                           
                       }
                       $("#tbVentas tbody").html("");

                       $.each(response.objeto.oListaDetalleVenta, function (i, row) {
                           $("<tr>").append(
                               $("<td>").text(row.Cantidad),
                               $("<td>").text(row.NombreProducto),
                               $("<td>").text(row.PrecioUnidad),

                               $("<td>").text(row.ImporteTotal)
                               
                           ).appendTo("#tbVentas tbody");

                       })

                       
                       $("#importerecibido").text(response.objeto.ImporteRecibido.toLocaleString('es-DO', { style: 'currency', currency: 'DOP' }));
                       $("#importecambio").text(response.objeto.ImporteCambio.toLocaleString('es-DO', { style: 'currency', currency: 'DOP' }));//TotalCosto
                       $("#totalcosto").text(response.objeto.TotalCosto.toLocaleString('es-DO', { style: 'currency', currency: 'DOP' }));//TotalCosto


                      
                       var deuda = (response.objeto.TotalCosto > response.objeto.ImporteRecibido ? response.objeto.TotalCosto - response.objeto.ImporteRecibido : 0);
                        console.log(deuda); 
                        
                           
                       $("#txtdeuda").text(deuda.toLocaleString('es-DO', { style: 'currency', currency: 'DOP' }));

                       var date1 = Date();
                       

                       $("txtimpre").text(date1);
                       



                      
                    } 
                },
                function () {
                    $("#seleccion").LoadingOverlay("hide");
                },
                function () {
                    $("#seleccion").LoadingOverlay("show");
               })

           

       }
       

        function imprSelec(nombre) {
            var printContents = document.getElementById(nombre).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
        function hide() {
            document.getElementById('Imprimir').style.visibility = "hidden";
        }

   </script>

</body>
</html>
