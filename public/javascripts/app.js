window.App = Ember.Application.create();

App.resultsController = Ember.ArrayController.create()

$(document).ready(function() {
    $('#scrambled_submit').click(function() {
        $.ajax({
            url: '/descramble/' + $('#scrambled_input').val() + '.json',
            success: function(data) {
                App.resultsController.set('content', data);
                $('#results').removeClass('hidden');
            }
        });
        return false;
    });
});
