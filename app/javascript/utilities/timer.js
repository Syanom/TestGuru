var testCompletionTimerId

document.addEventListener('turbolinks:load', function () {
  const timer = document.querySelector('.timer')
  clearInterval(testCompletionTimerId)
  if (timer) { createTimer(timer) }

})

function createTimer(timer) {
  if (timer.dataset.deadline) {
    timer.classList.remove('hide')
    updateTimer()
    testCompletionTimerId = setInterval(updateTimer, 1000)
  }
}

function updateTimer() {
  const timer = document.querySelector('.timer')
  const timeLeft = document.querySelector('.time-left')
  const deadline = new Date(timer.dataset.deadline)
  const testCompletionID = timer.dataset.testCompletionId
  if (deadline - new Date() <= 0) { window.location.href = '/test_completions/' + testCompletionID + '/result' }
  timeLeft.innerHTML = calculateTimeLeft(deadline)
}

function calculateTimeLeft(deadline) {
  const totalSeconds = Math.round((deadline - new Date()) / 1000)
  if (totalSeconds < 0) { return '00:00' }
  let hours = Math.floor(totalSeconds / 3600)
  if (hours < 1) { hours = '' } else { hours = hours + ':' }
  let minutes = Math.floor((totalSeconds % 3600) / 60)
  if (minutes < 10) { minutes = '0' + minutes + ':' } else { minutes = minutes + ':' }
  let seconds = totalSeconds % 60
  if (seconds < 10) { seconds = '0' + seconds }
  return hours + minutes + seconds
}
