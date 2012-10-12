// Generated by CoffeeScript 1.3.3
(function() {

  jQuery(function() {
    var errors, removeError, throwError, validate;
    errors = 0;
    $('.validate').on("blur", function() {
      var input;
      input = $(this);
      return validate(input);
    });
    validate = function(input) {
      var inputLen, inputVal, isInteger, validations;
      inputVal = input.val();
      inputLen = inputVal.length;
      validations = input.data();
      if (validations.notblank === true) {
        if (inputLen <= 0) {
          console.log("Error, not blank");
          throwError("This field can't be blank", input);
        } else {
          removeError(input);
        }
      }
      if (validations.minchars > 0) {
        if (inputLen < validations.minchars) {
          console.log("Error, chars not > 5");
          throwError("You need at least 5 chars", input);
        } else {
          removeError(input);
        }
      }
      if (validations.isinteger === true) {
        isInteger = /^\d+$/;
        if (isInteger.test(inputVal) !== true) {
          console.log("Not an int!!");
          return throwError("Must be a whole number", input);
        } else {
          return removeError(input);
        }
      }
    };
    throwError = function(message, input) {
      if (!input.hasClass('has-error')) {
        input.addClass("has-error");
        return input.nextAll('.errorContainer').empty().append(message);
      }
    };
    return removeError = function(input) {
      if (input.hasClass('has-error')) {
        console.log("removing error class");
        input.removeClass("has-error");
        return input.nextAll('.errorContainer').empty();
      }
    };
  });

}).call(this);
