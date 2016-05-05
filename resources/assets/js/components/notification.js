var notification = {
    show: function(msg, type, duration) {
        type = type ? type : 'info';

        var id = 'noti_'+Math.random().toString(36).substring(7);
        duration = duration ? duration : 3000;

        $('.notification-container').append(
            '<div id="'+id+'" class="notification notification-'+type+'">'+msg+'</div>'
        );
        setTimeout(function() {
            $('#'+id).slideUp('fast', function(){
                $('#'+id).remove();
            })
        }, duration);
    },
    error: function(msg, duration) {
        this.show(msg, 'error', duration);
    },
    success: function(msg, duration) {
        this.show(msg, 'success', duration);
    },
    info: function(msg, duration) {
        this.show(msg, 'info', duration);
    },
    warning: function(msg, duration) {
        this.show(msg, 'warning', duration);
    }
}