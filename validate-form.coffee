
jQuery -> # on Document ready
  
  errors = 0

  $('.validate').on "blur", ->
    input = $(this)
    validate(input)
###
  validate = (input) ->
    value = input.val()
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
###

  




### Pseudo Code

query .validate inputs 
  attach on blur listener
    input = $(this)
    validate(input)

query .validate-lastInpt
  attach keyup listener       # uses keyup for last input when user doesn't blur
    input = $(this)
    pause 1000 ms             # mitigates early errors ?
    validate(input)

throwError(message)
  errors = true
  append message to .errorContainer
  add class .valError

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
