function ShowMessage(message, messagetype, title) {
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-bottom-center",
        "preventDuplicates": true,
        "onclick": null,
        "showDuration": "800",
        "hideDuration": "800",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
    // toastr['success'](msg, title);
    var d = Date();

    switch (messagetype) {
        case 'Success':
            toastr.success(message, title);
            break;
        case 'Error':
            toastr.error(message, title);
            break;
        case 'Warning':
            toastr.warning(message, title);
            break;
        default:
            toastr.info(message, title);
    }

   // toastr.success(message, title);

    return false;
}