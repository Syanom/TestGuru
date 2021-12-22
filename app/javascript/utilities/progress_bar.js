document.addEventListener('turbolinks:load', function () {
  const progressBar = document.querySelector('.progress-bar')
  if (progressBar) {
    setProgress(progressBar)
  }
})

function setProgress(progressBar) {
  const questionNumber = progressBar.dataset.questionNumber
  const questionsQuantity = progressBar.dataset.questionsQuantity
  const progress = Math.round(questionNumber / questionsQuantity * 100)
  progressBar.ariaValueNow = progress
  progressBar.style.width = progress + '%'
}