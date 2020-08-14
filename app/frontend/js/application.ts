function App() {}

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
        const target = e.currentTarget;
        const time = new Date().getTime();
        const regexp = new RegExp($(target).data('id'), 'g');
        $(target).before($(target).data('fields').replace(regexp, time));
    }).bind(this);
};

App.prototype.slidePasswordField = function() {
    return (function(e) {
        $('.password-form').slideToggle();
    }).bind(this);
};

$(function(): void {
    let app = new App();

    $('.flash').fadeOut(2000, app.removeElement());
    $(document).on('submit', 'form[name="mailchimp_signup"]', app.visitHome());
    $(document).on('click', 'form .add_fields', app.addFields());
    $(document).on('change', 'input[name="change_password"]', app.slidePasswordField());
});
