//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks

function App() {
}

App.prototype.visitHome = function(e) {
    return (function(e) {
        // Mailchimp email signup form
        Turbolinks.visit('/');
    }).bind(this);
};

App.prototype.removeElement = function() {
    return (function(e) {
        $(e.currentTarget).remove();
    }).bind(this);
};

App.prototype.addFields = function() {
    return (function(e) {
        var time = new Date().getTime();
        var regexp = new RegExp($(this).data('id'), 'g');
        $(this).before($(this).data('fields').replace(regexp, time));
        e.preventDefault();
    }).bind(this);
};

App.prototype.slidePasswordField = function() {
    return (function(e) {
        $('.password-form').slideToggle();
    }).bind(this);
};

$(document).on('turbolinks:load', function(load) {
    var app = new App();

    $('.flash').fadeOut(1000, app.removeElement());
    $('form[name="mc-embedded-subscribe-form"]').on('submit', app.visitHome());
    $('form').on('click', '.add_fields', app.addFields());
    $('input[name="change_password"]').on('change', app.slidePasswordField());
});
