
var table
$(document).ready(function () {
    cargarDatos();
});


function cargarDatos() {

    if ($.fn.DataTable.isDataTable('#tbCliente')) {
        $('#tbCliente').DataTable().destroy();
    }

    $('#tbCliente tbody').html('');

    AjaxGet("../frmCliente.aspx/Obtener",
        function (response) {
            $(".card-body").LoadingOverlay("hide");
            if (response.estado) {

                $.each(response.objeto, function (i, row) {
                    $("<tr>").append(
                        $("<td>").text(i + 1),
                        $("<td>").text(row.TipoDocumento),
                        $("<td>").text(row.NumeroDocumento),
                        $("<td>").text(row.Telefono),
                        $("<td>").text(row.Descuento),
                        $("<td>").text(row.Direccion),
                        $("<td>").text(row.Domicilio),
                        $("<td>").append(
                            $("<button>").addClass("btn btn-sm btn-primary mr-1").text("Editar").data("cliente", row),
                            $("<button>").addClass("btn btn-sm btn-danger").text("Eliminar").data("cliente", row.IdUsuario)
                        )
                    ).appendTo("#tbCliente tbody");

                })
            }

            table = $('#tbCliente').DataTable({
                responsive: true
            });
        },
        function () {
            $(".card-body").LoadingOverlay("hide");
        },
        function () {
            $(".card-body").LoadingOverlay("show");
        })
}


$('#tbCliente tbody').on('click', 'button[class="btn btn-sm btn-primary mr-1"]', function () {

    var model = $(this).data("cliente")
    $("#txtIdCliente").val(model.IdCliente);
    $("#txtNombre").val(model.Nombre);
    $("txtNegocio").val(model.Negocio);
    $("select#cboTipoDocumento").val(model.TipoDocumento);
    $("#txtNumeroDocumento").val(model.NumeroDocumento);

    $("#txtTelefono").val(model.Telefono);
    $("#txtDescuento").val(model.Descuento);
    $("#txtDireccion").val(model.Direccion);
    $("#txtDomicilio").val(model.Domicilio);

    $('#modalrol').modal('show');
})

$('#tbCliente tbody').on('click', 'button[class="btn btn-sm btn-danger"]', function () {

    var request = { IdCliente: String($(this).data("cliente")) };

    swal({
        title: "Mensaje",
        text: "¿Esta seguro de eliminar el cliente?",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: '#DD6B55',
        cancelButtonColor: '#d33',
        confirmButtonText: "Si",
        cancelButtonText: "No",
        closeOnConfirm: false,
    }, function () {


        AjaxPost("../frmCliente.aspx/Eliminar", JSON.stringify(request),
            function (response) {
                if (response.estado) {
                    cargarDatos();
                    swal.close();
                } else {
                    swal("oops!", "No se pudo eliminar el usuario", "warning")
                }
            },
            function () {
            },
            function () {
            })
    }
    )
})


$('#btnNuevoRol').on('click', function () {

    $("#txtIdCliente").val(0);
    $("#txtNombre").val("");
    $("#txtNegocio").val("");
    $("select#cboTipoDocumento").val("");
    $("#txtNumeroDocumento").val("");
    $("#txtTelefono").val("");
    $("#txtDescuento").val("");
    $("#txtDireccion").val("");
    $("#txtDomicilio").val("");

    $('#modalrol').modal('show');
})

$('#btnGuardarCambios').on('click', function () {
    var camposvacios = false;
    var fields = $(".model").serializeArray();


    $.each(fields, function (i, field) {
        if (!field.value) {
            camposvacios = true;
            return false;
        }
    });


    if (!camposvacios) {

        var request = {
            Cliente: {
                IdCliente: parseInt($("#txtIdCliente").val()),
                Nombre: $("#txtNombre").val(),
                Negocio: $("#txtNegocio").val(),
                TipoDocumento: $("#cboTipoDocumento").val(),
                NumeroDocumento: $("#txtNumeroDocumento").val(),
                Telefono: $("#txtTelefono").val(),
                Descuento: parseFloat($("#txtDescuento").val()),
                Direccion: $("#txtDireccion").val(),
                Domicilio: parseFloat($("#txtDomicilio").val()),
            }
        }


        if (parseInt($("#txtIdCliente").val()) == 0) {

            AjaxPost("../frmCliente.aspx/Guardar", JSON.stringify(request),
                function (response) {
                    $(".modal-body").LoadingOverlay("hide");
                    if (response.estado) {
                        cargarDatos();
                        $('#modalrol').modal('hide');
                    } else {
                        swal("Mensaje", "No se pudo registrar el usuario", "warning")
                    }
                },
                function () {
                    $(".modal-body").LoadingOverlay("hide");
                },
                function () {
                    $(".modal-body").LoadingOverlay("show");
                })
        } else {
            AjaxPost("../frmCliente.aspx/Editar", JSON.stringify(request),
                function (response) {
                    $(".modal-body").LoadingOverlay("hide");
                    if (response.estado) {
                        cargarDatos();
                        $('#modalrol').modal('hide');
                    } else {
                        swal("Mensaje", "No se pudo editar el usuario", "warning")
                    }
                },
                function () {
                    $(".modal-body").LoadingOverlay("hide");
                },
                function () {
                    $(".modal-body").LoadingOverlay("show");
                })
        }
    } else {
        swal("Mensaje!", "Es necesario completar todos los campos", "warning")
    }


})
