
jQuery -> # on Document ready
  
  errors = 0

  $('.validate').on "blur", ->
    input = $(this)
    validate(input)
  
  validate = (input) ->
    inputVal = input.val()
    inputLen = inputVal.length
    validations = input.data()            #cache data-xxx tags
    
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

    #errors = true

  




### Pseudo Code

query .validate-lastInpt
  attach keyup listener       # uses keyup for last input when user doesn't blur
    input = $(this)
    pause 1000 ms             # mitigates early errors ?
    validate(input)



removeError
  empty $this .errorContainer
  remove class .valError

validate(input)
  if data-isBlank exists
    if input is blank
      throwError "This field is required"

  if data-minChars exists
    minChars = input.data-minChars.value
    charCount = input.value
    if minChars is less than charCount
      throw error "You need at least #{minChars} characters"
    else
      removeError()

  if data-isInteger exists
    if data-isInteger is not integer
      throwError "You must use an whole number"
    else
      removeError()

errors = false   # Keep track of current error status for submit

submitForm
  if errors = false
    this.parent.submit


    console.log "This is val #{value}"
    console.log "errors before validation is #{errors}"
    console.log input.val().length
    if input.val().length <= 0
      errors += 1
      console.log "error length is #{errors}"
    else if input.val().length > 0
      #onsole.log input.val()
      errors -= 1
      console.log "error length is #{errors}"
    

    console.log "errors after validation is #{errors}"


###
