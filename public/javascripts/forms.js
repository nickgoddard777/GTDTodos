$(document).ready(function(){
      // Regular Expression to test whether the value is valid
    $.tools.validator.fn("[type=time]", "Please supply a valid time", function(input, value) {
      return /^\d\d:\d\d$/.test(value);
    });
    $.tools.validator.fn("[data-equals]", "Value not equal with the $1 field", function(input) {
      var name = input.attr("data-equals"),
      field = this.getInputs().filter("[name=" + name + "]");
      return input.val() == field.val() ? true : [name];
    });
    $.tools.validator.fn("[minlength]", function(input, value) {
      var min = input.attr("minlength");
      return value.length >= min ? true : {
      en: "Please provide at least " +min+ " character" + (min > 1 ? "s" : "")
    };
    });
    $.tools.validator.localizeFn("[type=time]", {
    en: 'Please supply a valid time'
    });
    $("#form").validator({
    position: 'left',
    offset: [25, 10],
    messageClass:'form-error',
    message: '<div><em/></div>' // em element is the arrow
    }).attr('novalidate', 'novalidate');
});

