<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="frmFacturasPendientes.aspx.cs" Inherits="SistemaVentas.frmFacturasPendientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        select{
            cursor:pointer;
        }
        .red {
  background-color: red;
}

.blue {
  background-color: blue;
}

.green {
  background-color: green;
}
        .form-control-sm {
            height: calc(1.3em + .3rem + 2px) !important;
            padding: .15rem .3rem !important;
            font-size: .875rem !important;
            line-height: 1.3 !important;
            border-radius: .2rem !important;
        }
        .col-form-label-sm {
            padding-top: calc(.25rem + 1px) !important;
            padding-bottom: calc(.25rem + 1px) !important;
            font-size: .800rem !important;
            line-height: 1.5 !important;
        }

        .btn-custom, .btn-sm-custom {
            padding: .25rem .5rem;
            font-size: .875rem;
            line-height: 1.5;
            border-radius: .2rem;
        }

        .btn-group-sm > .btn, .btn-sm {
            padding: .15rem .5rem !important;
            font-size: .750rem !important;
            line-height: 1.5 !important;
            border-radius: .2rem !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
            <div class="col-sm-12">
               <div class="card">
                  <div class="card-header">
                    Consultar Ventas
                  </div>
                  <div class="card-body p-2">
                        
                      <hr />
                        <div class="row mt-3">
                            <div class="col-sm-12">
                                <table id="tbVentas" class="table table-striped table-bordered nowrap compact" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Tipo Documento</th>
                                            <th>Codigo Documento</th>
                                            <th>Fecha Creacion</th>
                                            <th>Dias para Pagar</th>
                                            
                                            <th>Documento Cliente</th>
                                            <th>Nombre Cliente</th>
                                            <th>Total Venta</th>
                                            <th>Total Pagado</th>
                                            <th></th>
                                        </tr>
                                        
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                  </div>
                  <div class="card-footer">
                  </div>
                </div>
            </div>
    </div>
    <!--modal-->
     <div class="modal fade" id="modalrol1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Hacer Pago</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body1">
            <form>
              <input id="txtIdVenta" class="model" name="IdVenta" value="0" type="hidden" />
              <div class="form-group row">
                <label for="" style="margin-left:10px" class="col-sm-4 col-form-label col-form-label-sm">Total Pagado: $</label>
                <div class="col-sm-6">
                  <input type="text" class="form-control form-control-sm model" id="txtImporteRecibido" name="ImporteRecibido" readonly>
                </div>
                  <label for="" style="margin-left:10px" class="col-sm-4 col-form-label col-form-label-sm">Nuevo Pago: $</label>
                  <div class="col-sm-6">
                  <input type="text" class="form-control form-control-sm model" id="txtNuevoPago" name="nuevopago">
                </div>
                  <label for="" style="margin-left:10px"  class="col-sm-4 col-form-label col-form-label-sm">Nuevo Total Pago: $</label>
                  <div class="col-sm-6">
                  <input type="text" class="form-control form-control-sm model" id="txtnuevoImporteRecibido" name="nuevoImporteRecibido" readonly>
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
              <button id="btnSumar" type="button" class="btn btn-sm btn-secondary">Sumar</button>
            <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Cerrar</button>
            <button id="btnGuardarCambios" type="button" class="btn btn-sm btn-primary">Guardar Cambios</button>
          </div>
        </div>
      </div>
    </div>
    <script src="Controlador/frmFacturasPendientes/frmFacturasPendientes.js"></script>
   
    
</asp:Content>
