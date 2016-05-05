/**
 * Show tooltip when user hovers over check-mark in role×permission grid
 */
$(document).ready(function() {
    $('td[title!=""]').qtip({
        position: { my: 'top center', at: 'bottom center' },
        style: 'qtip-blue qtip-shadow'
    });
})

/**
 * Cread/Edit Roles
 */
var crud = new Vue({
    el: '#role-modal',
    data: {
        modal: {
            title: 'Role'
        },
        form: {
            url: "/api/v1/roles",
            method: "post",
            role: { name: null, label: null }
        }
    },
    methods: {

        /**
         * Initialize the "Create/Edit Role" modal
         */
        init: function(role) {
            if (role) {
                this.modal = {
                    title: 'Edit Role'
                };
                this.form = {
                    url: url('/api/v1/roles/' + role.id),
                    method: 'put',
                    role: role
                };
            }
            else {
                this.modal = {
                    title: 'Create Role'
                };
                this.form = {
                    url: url('/api/v1/roles'),
                    method: 'post',
                    role: { name: null, label: null }
                };
            }
        },

        /**
         * Make ajax call to save the role to db
         */
        saveRole: function(role) {
            var that = this;
            $.ajax({
                url: that.form.url,
                method: that.form.method,
                data: that.form.role,
                success: function (response, status) {
                    notification.success('Saved');
                    $('#role-modal').modal('hide');
                },
                error: function (response, status, error) {
                    notification.error('Could not save');
                },
                statusCode: {
                    201: function(response) {
                        // append to this.roles iff new role created
                        table.addRole(response);
                    }
                }
            })
        }

    }
});

/**
 * Filter roles
 */
var table = new Vue({
    el: "#roles-datatable",
    data: {
        search_term: "",
        roles: php.roles,
        permissions: php.permissions
    },
    methods: {

        /**
         * Filter rows by search term
         */
        filterRows: function(role) {
            return role.label.match(this.search_regex);
        },

        /**
         * Check if a Role has a permission
         */
        hasPermission: function (role, permission_id) {
            return _.contains(role.permission_ids, permission_id);
        },

        /**
         * Open the "Create/Edit Role" modal
         */
        openModal: function(role) {
            crud.init(role);
            $('#role-modal').modal('show');
        },

        /**
         * Toggle a role-permission
         */
        toggleRolePermission: function(role, permission_id) {
            var i = _.indexOf(role.permission_ids, permission_id);
            (i >= 0) ?
                role.permission_ids.splice(i,1) : 
                role.permission_ids.push(permission_id);
            this.saveRolePermissions(role);
        },

        /**
         * Save role-permissions
         */
        saveRolePermissions(role) {
            $.ajax({
                url: url('/api/v1/roles/' + role.id + '/permissions'),
                method: 'post',
                dataType: 'json',
                data: { permission_ids: role.permission_ids },
                success: function(response) {
                    notification.show('Ok', 'success', 500);
                },
                error: function(response, status, error) {
                    console.log(error);
                    notification.show('Could not save', 'error');
                }
            });
        },

        /**
         * Add new role to table
         */
        addRole: function(role) {
            // add expected attributes to new role object
            role.permission_ids = [];
            role.permissions = {}; // not used
            this.roles.push(role);
        }

    },

    computed: {

        /**
         * Turn the search term into a regex pattern
         */
        search_regex: function() {
            return new RegExp(this.search_term,'i');
        }
    }
});

/**
 * Open "Create Role" modal
 */
$('#new-role-btn').click(function() {
    crud.init();
    $('#role-modal').modal('show');
});