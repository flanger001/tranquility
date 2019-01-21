//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

function App() {
}

App.prototype.visitHome = function(e) {
    return (function(e) {
        // Mailchimp email signup form
        window.location.href = "/";
    }).bind(this);
};

App.prototype.removeElement = function() {
    return (function(e) {
        $(e.currentTarget).remove();
    }).bind(this);
};

App.prototype.addFields = function() {
    return (function(e) {
        e.preventDefault();
        var target = e.currentTarget;
        var time = new Date().getTime();
        var regexp = new RegExp($(target).data('id'), 'g');
        $(target).before($(target).data('fields').replace(regexp, time));
    }).bind(this);
};

App.prototype.slidePasswordField = function() {
    return (function(e) {
        $('.password-form').slideToggle();
    }).bind(this);
};

$(function() {
    var app = new App();

    $('.flash').fadeOut(1000, app.removeElement());
    $('form[name="mc-embedded-subscribe-form"]').on('submit', app.visitHome());
    $('form').on('click', '.add_fields', app.addFields());
    $('input[name="change_password"]').on('change', app.slidePasswordField());
});
