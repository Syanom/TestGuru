document.addEventListener('turbolinks:load', function () {
  if (document.querySelector('.matching-passwords')) {
    document.querySelector('.new_user').addEventListener('input', checkPasswords)
  }
})

function checkPasswords() {
  var password = document.getElementById('user_password').value
  var passwordConfirmation = document.getElementById('user_password_confirmation').value
  if ((password != '') && (passwordConfirmation != '')) {
    unhideHint(password, passwordConfirmation)
  } else {
    hideHints()
  }
}

function unhideHint(password, passwordConfirmation) {
  if (password != passwordConfirmation) {
    document.querySelector('.octicon-check').classList.add('hide')
    document.querySelector('.octicon-x').classList.remove('hide')
  } else {
    document.querySelector('.octicon-check').classList.remove('hide')
    document.querySelector('.octicon-x').classList.add('hide')
  }
}

function hideHints() {
  document.querySelector('.octicon-check').classList.add('hide')
  document.querySelector('.octicon-x').classList.add('hide')
}
