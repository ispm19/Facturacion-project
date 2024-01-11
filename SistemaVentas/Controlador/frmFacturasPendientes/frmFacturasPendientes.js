
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2)
        month = '0' + month;
    if (day.length < 2)
        day = '0' + day;

    return [year, month, day].join('/');
}


$(document).ready(function () {
    var dat = new Date();
    $("#txtFechaInicio").datepicker();
    $("#txtFechaFin").datepicker();
    $("#txtFechaInicio").val(formatDate(dat));
    $("#txtFechaFin").val(formatDate(dat));

    CargarDatos();
});

    

function CambiarColores() {
    
    // Buscar todos los td con la clase "valor"
    $("td.valor").each(function () {
        // Obtener el valor del td
        var valor = parseFloat($(this).text().trim());


        // Establecer el color del tr padre basado en el valor
        if (valor >= -1 && valor <= -5) {
            $(this).parent().css("background-color", "red");
        } else if (valor >= -6 && valor <= -10) {
            $(this).parent().css("background-color", "yellow");
        } else if (valor >= -11 && valor <= -15) {
            $(this).parent().css("background-color", "green");
        }
    }
    )
};

function CargarDatos(FechaRegistro) {

    if ($.fn.DataTable.isDataTable('#tbVentas')) {
        $('#tbVentas').DataTable().destroy();
    }

    $('#tbVentas tbody').html('');
    AjaxPost("../frmFacturasPendientes.aspx/ObtenerListaFPendientes", JSON.stringify(),
        function (response) {
            $(".mt-3").LoadingOverlay("hide");
            if (response.estado) {
                $("#tbVentas tbody").html("");
                $.each(response.objeto, function (i, row) {
                    var fechaCreacion = new Date(row.FechaRegistro); // Crea un objeto Date() a partir de la "fecha de creación"
                    var fechaActual = new Date(); // Obtén la fecha actual
                    var diferenciaDias = Math.floor((fechaActual - fechaCreacion) / (1000 * 60 * 60 * 24)); // Calcula la diferencia en días
                    diferenciaDias -= 7; // Resta 15 días
                    var valorNumero = parseFloat(diferenciaDias);
                    $("<tr>").append(
                        $("<td>").append(
                            $("<button>").addClass("btn btn-sm btn-primary").text("Ver detalle").data("venta", row)
                        ),
                        $("<td>").text(row.TipoDocumento),
                        $("<td>").text(row.Codigo),
                        $("<td>").text(row.FechaRegistro),
                        $("<td>").addClass("valor").text(valorNumero), // Agregar la nueva columna con el valor de la diferencia
                        $("<td>").text(row.oCliente.NumeroDocumento),
                        $("<td>").text(row.oCliente.Nombre),
                        $("<td>").text(row.TotalCosto),
                        $("<td>").text(row.ImporteRecibido),
                        $("<td>").append(
                            $("<button>").addClass("btn btn-success").text("Nuevo Pago").data("facturapago", row)
                        )

                    ).appendTo("#tbVentas tbody");

                    CambiarColores($("#tbVentas tbody tr:last-child"));
                    console.log("Diferencia de días: " + diferenciaDias);
                    console.log("Valor de la columna 'Días para Pagar': " + valorNumero);

                })
            }
            table = $('#tbVentas').DataTable({
                responsive: true
            });

        },
        
        function () {
            $(".mt-3").LoadingOverlay("hide");
        },
        function () {
            $(".mt-3").LoadingOverlay("show");
        }
    )
}


$('#tbVentas tbody').on('click', 'button[class="btn btn-success"]', function () {

    var model = $(this).data("facturapago")

    $("#txtIdVenta").val(model.IdVenta);
    $("#txtImporteRecibido").val(model.ImporteRecibido);
    

    $('#modalrol1').modal('show');
})

$('#btnSumar').on('click', function () {
    var nuevoPago = parseFloat($("#txtNuevoPago").val());
    var importeRecibido = parseFloat($("#txtImporteRecibido").val());
    var nuevoImporteRecibido = nuevoPago + importeRecibido;

    $("#txtnuevoImporteRecibido").val(nuevoImporteRecibido);
})

$('#btnGuardarCambios').on('click', function () {
    var nuevoPago = parseFloat($("#txtNuevoPago").val());
    var importeRecibido = parseFloat($("#txtImporteRecibido").val());
    var nuevoImporteRecibido = nuevoPago + importeRecibido;

    var camposvacios = false;
    if (!camposvacios) {
        var request = {
            oVenta: {
                IdVenta: parseInt($("#txtIdVenta").val()),
                ImporteRecibido: parseFloat($("#txtnuevoImporteRecibido").val()),
            }
        }

        if (parseInt($("#txtIdVenta").val()) == 0) {
            AjaxPost("../frmFacturasPendientes.aspx/Guardar", JSON.stringify(request),
                function (response) {
                    $(".modal-body1").LoadingOverlay("hide");
                    if (response.estado) {
                        cargarDatos();
                        $('#modalrol1').modal('hide');
                    } else {
                        swal("Mensaje", "No se pudo registrar el usuario", "warning")
                    }
                },
                function () {
                    $(".modal-body1").LoadingOverlay("hide");
                },
                function () {
                    $(".modal-body1").LoadingOverlay("show");
                })
        } else {
            AjaxPost("../frmFacturasPendientes.aspx/Editar", JSON.stringify(request),
                function (response) {
                    $(".modal-body1").LoadingOverlay("hide");
                    if (response.estado) {

                        CargarDatos();
                        $('#modalrol1').modal('hide');
                    } else {
                        swal("Mensaje", "No se pudo editar el precio", "warning")
                    }
                },
                function () {
                    $(".modal-body1").LoadingOverlay("hide");
                },
                function () {
                    $(".modal-body1").LoadingOverlay("show");
                })
        }
    } else {
        swal("Mensaje!", "Es necesario completar todos los campos", "warning")
    }


})

$('#tbVentas tbody').on('click', 'button[class="btn btn-sm btn-primary"]', function () {
    var venta = $(this).data("venta");
    var url = 'docVenta.aspx?id=' + venta.IdVenta;
    window.open(url, '', 'height=600,width=800,scrollbars=0,location=1,toolbar=0');
})





