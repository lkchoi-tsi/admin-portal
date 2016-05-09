$(function() {
    new Clipboard('#pw-copy-btn', { target: '#pw-reset-input' });
})
$('#pw-reset-btn').click(function(e) {
    e.preventDefault();
    $.ajax({
        url: url('/api/v1/users/' + php.user.id + '/reset'),
        method: 'POST',
        success: function(response) {
            console.log(response);
            $('#pw-reset-input').val(response.link);
            $('#pw-reset-btn').replaceWith(
                '<button id="pw-copy-btn" type="button" class="btn btn-info">'+
                '<i class="fa fa-clipboard"></i>'+
                '</button>'
            );
            new Clipboard('#pw-copy-btn', { target: '#pw-reset-input' });
        }
    })
})