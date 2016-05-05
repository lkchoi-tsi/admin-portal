// $('#create-team-form').submit(function(e) {

//     // prevent form submission
//     e.preventDefault();

//     var form = this;

//     // make call via ajax instead
//     $.ajax({

//         url: $(this).attr('action'),

//         method: $(this).attr('method'),

//         data: $(this).serialize(),

//         success: function(response) {

//             var team = response;

//             notification.show('Changes saved', 'success');

//             // change "create" form to "edit" form
//             $(form).attr('action', url('/api/v1/teams/' + team.id));
//             $(form).attr('method','put');
//             $(form).attr('id', '#edit-team-form');
//             $(form).addClass('ajax');
//         },
        
//         error: function(response, status, error) {

//             notification.show('Changes could not be saved', 'error');
//         }
//     })
// })