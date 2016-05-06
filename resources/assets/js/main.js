$('.selectize').selectize();

$('form.ajax').submit(function(e) {

    // prevent form submission
    e.preventDefault();

    // make call via ajax instead
    $.ajax({
        url: $(this).attr('action'),

        method: $(this).attr('method'),

        data: $(this).serialize(),

        success: function(response) {
            console.log(response);
            notification.show('Changes saved', 'success');

            if (response.redirect)
            {
                window.location.replace(response.redirect);
            }
        },
        
        error: function(response, status, error) {
            console.log(response);
            notification.show('Changes could not be saved', 'error');
        }
    })
})

function url(path) {
    var prefix = '';
    return prefix + path + '?api_token=' + php.api_token;
}
