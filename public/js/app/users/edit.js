console.log(php.user);
$('#pw-reset-btn').click(function(e) {
    e.preventDefault();
    $.ajax({
        url: url('/api/v1/users/' + php.user.id + '/reset'),
        method: 'POST',
        success: function(response) {
            console.log(response);
            $('#pw-reset-input').val(response.link);
            $('#pw-reset-btn').replaceWith(
                '<button id="pw-copy-btn" type="button" class="btn btn-info" data-clipboard-target="#pw-reset-input" aria-label="Copied!">'+
                '<i class="fa fa-clipboard"></i>'+
                '</button>'
            );
            new Clipboard('#pw-copy-btn');
        }
    })
})