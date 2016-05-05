// RBAC (Role-Based Access Control)
var rbac = {

    /**
     * Get the set of Role-Granted Permissions
     */
    rgp: function() {
        rgp = [];
        $('.role-checkbox:checked').each(function(i,e) {
            rgp = rgp.concat($(e).data('permission_ids'));
        });
        return _.uniq(rgp);
    },

    /**
     * 
     */
    render: function() {
        // reset green/blue/red to gray
        $('.permission button').removeClass('btn-warning').addClass('btn-default');

        // paint
        this.rgp().forEach(function(pid,i) {
            rbac.setAccess(pid,'role');
        });
    },

    /**
     * Set the "access" for a permission
     */
    setAccess: function(pid, access) {

        var permission = $('#permission-'+pid);
        var input = permission.children('input.access').first();
        var grant_button = $('#permission-'+pid+' button.grant');
        var deny_button = $('#permission-'+pid+' button.deny');

        grant_button.removeClass('btn-warning btn-success btn-danger btn-default');
        deny_button.removeClass('btn-warning btn-success btn-danger btn-default');

        switch (access)
        {
            case 'grant':
                grant_button.addClass('btn-success');
                deny_button.addClass('btn-default');
                input.val('grant');
            break;

            case 'deny':
                grant_button.addClass('btn-default');
                deny_button.addClass('btn-danger');
                input.val('deny');
            break;

            default:
                if (rbac.rgp().indexOf(pid) < 0)
                {
                    // if pid is not in rgp "unassigned"
                    grant_button.addClass('btn-default');
                    deny_button.addClass('btn-default');
                    input.val('');
                    break;
                }
                // else, fall through to "role" case

            case 'role':
                grant_button.addClass('btn-warning');
                deny_button.addClass('btn-default');
                input.val('');
            break;
        }
    }
}

$(function() {
    // loop through permissions and pain the button appropriately
    $('.permission input').each(function(i,e) {
        rbac.setAccess(
            $(e).closest('.permission').data('id'),
            $(this).val()
        );
    })

    // role de/selected
    $('.role-checkbox').change(function () {
        rbac.render();
    });

    // permission granted/denied/reset
    $('.permission button').click(function() {
        var button = $(this);
        var permission = button.closest('.permission');
        var input = permission.children('input.access').first();
        var pid = permission.data('id'); // permission id
        var p_access = input.val(); // permission access
        var b_access = button.data('access'); // button access

        switch (p_access+'/'+b_access)
        {
            case '/grant': // role->grant
            case 'deny/grant': // deny->grant
            rbac.setAccess(pid, 'grant');
            break;

            case 'deny/deny': // deny->role
            case 'grant/grant': // grant->role
            rbac.setAccess(pid, '');
            break;

            case 'grant/deny': // grant->deny
            case '/deny': // role->deny
            rbac.setAccess(pid, 'deny');
            break;
        }
    });
});
