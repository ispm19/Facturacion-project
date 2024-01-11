<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="frmCliente.aspx.cs" Inherits="SistemaVentas.frmCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="row">
            <div class="col-sm-12">
               <div class="card">
                  <div class="card-header">
                    Mantenedor Clientes
                  </div>
                  <div class="card-body">
                        <div class="row">
                            <div class="col-sm-2">
                                <button id="btnNuevoRol" type="button" class="btn btn-sm btn-success">Nuevo</button>
                            </div>
                        </div>
                      <hr />
                        <div class="row mt-3">
                            <div class="col-sm-12">
                                <table id="tbCliente" class="table table-striped table-bordered nowrap" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre</th>
                                            <th>Negocio</th>
                                            <th>Tipo de Documento</th>
                                            <th>Numero de Documento</th>
                                            <th>Telefono</th>
                                            <th>Descuento</th>
                                            <th>Direccion</th>
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

    <!-- Modal -->
    <div class="modal fade" id="modalrol" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Cliente</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <input id="txtIdCliente" class="model" name="IdUsuario" value="0" type="hidden" />
              <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label col-form-label-sm">Nombre</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control form-control-sm model" id="txtNombre" name="Nombres">
                </div>
              </div>
                <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label col-form-label-sm">Negocio</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control form-control-sm model" id="txtNegocio" name="Negocio">
                </div>
              </div>
              <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label col-form-label-sm">Tipo de Documento</label>
                <div class="col-sm-10">
                    <select class="form-control form-control-sm model" id="cboTipoDocumento" name="Tipo de Documento">
                  <option value="Cedula">Cedula</option> 
                  <option value="RNC">RNC</option>
                 </select>
                </div>
                </div>
              <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label col-form-label-sm">Numero de Documento</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control form-control-sm model" id="txtNumeroDocumento" name="Usuario">
                </div>
              </div>
              <div class="form-group row">
                <label for="inputPassword" class="col-sm-2 col-form-label col-form-label-sm">Telefono</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control form-control-sm model" id="txtTelefono" name="Telefono">
                </div>
              </div>
                <div class="form-group row">
                <label for="inputPassword" class="col-sm-2 col-form-label col-form-label-sm">Descuento</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control form-control-sm model" id="txtDescuento" name="Telefono">
                </div>
              </div>
              <div class="form-group row">
                <label for="inputPassword" class="col-sm-2 col-form-label col-form-label-sm">Direccion</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control form-control-sm model" id="txtDireccion" name="Clave">
                </div>
             </div>
                <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label col-form-label-sm">Domicilio</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control form-control-sm model" id="txtDomicilio" name="Domicilio">
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Cerrar</button>
            <button id="btnGuardarCambios" type="button" class="btn btn-sm btn-primary">Guardar Cambios</button>
          </div>
        </div>
      </div>
    </div>
    <script src="Controlador/frmCliente/frmCliente.js"></script>
</asp:Content>
