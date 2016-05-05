$(document).ready(function() {

    // init the datatable
    $('#users-datatable').DataTable({
        serverSide: php.usersDatatable.serverSide,
        ajax: php.usersDatatable.ajax,
        deferRender: true,
        pageLength: 20,
        ext: { errMode: 'throw' },
        dom: 'Bfrtip',
        // lengthMenu: [[10,20,50,100,-1],[10,20,50,100,'All']],
        buttons: [
            'copy',
            { extend: 'csv', title: "tsi-employee-list" },
            { extend: 'excel', title: "tsi-employee-list" }
        ],
        columns: [
            { data: 'id' },
            { data: 'full_name' },
            { data: 'employee_id' },
            { data: 'email' },
            { data: 'extension', orderable: false },
            { data: 'work_phone', orderable: false },
            { data: 'cell_phone', orderable: false },
            { data: 'manager.full_name' },
        ]
    })

    // add search fields per column
    $('#users-datatable thead tr:last-child th').each(function() {
        $(this).append('<input type="text"/>')
    })
    // apply the search
    $('#users-datatable').DataTable().columns().every(function() {
        var that = this;
        $('input', this.header()).on('keyup change', function() {
            if (that.search()!==this.value) {
                that.search(this.value).draw();
            }
        })
    })
})
