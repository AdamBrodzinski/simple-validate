
jQuery -> # on Document ready
  
  errors = 0

  $('.validate').on "blur", ->
    input = $(this)
    validate(input)
  
  validate = (input) ->
    inputVal = input.val()
    inputLen = inputVal.length
    validations = input.data()         #cache data-xxx tags
    
    if validations.isinteger is on
      isInteger = /^\d+$/
      if isInteger.test(inputVal) isnt true
        console.log "Not an int!!"
        throwError("Must be a whole number", input)
      else
        removeError(input)

    if validations.notblank is on
      if inputLen <= 0
        console.log "Error, not blank"
        throwError("This field can't be blank", input)
      else
        removeError(input)

    if validations.minchars > 0
      if inputLen < validations.minchars
        console.log "Error, chars not > 5"
        throwError("You need at least 5 chars", input)
      else
        removeError(input)

  throwError = (message, input) ->
    input.addClass "has-error"
    input.nextAll('.errorContainer').empty().append(message)

  removeError = (input) ->
    console.log "removing error class"
    input.removeClass("has-error")
    input.nextAll('.errorContainer').empty()


# Match multiple conditions
#if validations.minchars > 0 and !input.hasClass('has-error')