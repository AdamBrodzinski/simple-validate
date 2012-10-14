
jQuery -> # on Document ready

  errorCount = null
  
  valEl = $('.validate')  # cache .validate elements
  submitBtn = valEl.parent().parent().find('input[type=submit]')

  valEl.on "blur", ->
    input = $(this)
    validate(input)
  
  validate = (input) ->
    inputVal = input.val()
    inputLen = inputVal.length
    validations = input.data()         #cache data-xxx tags

    if validations.notblank is on
      if inputLen <= 0
        throwError("This field can't be blank", input)
      else
        removeError(input)

    if validations.minchars > 0
      if inputLen < validations.minchars
        throwError("You need at least 5 chars", input)
      else
        removeError(input)

    if validations.isinteger is on
      isInteger = /^\d+$/
      if isInteger.test(inputVal) is false
        throwError("Must be a whole number", input)
      else
        removeError(input)

  throwError = (message, input) ->
    if !input.hasClass('has-error')
      errorCount += 1
      input.addClass "has-error"
      input.nextAll('.errorContainer').append(message)

  removeError = (input) ->
    if input.hasClass('has-error')
      errorCount -= 1
      input.removeClass("has-error")
      input.nextAll('.errorContainer').empty()

  submitBtn.on "click", (e) ->
    e.preventDefault()
    if errorCount is 0
      valEl.parent().parent().submit()

