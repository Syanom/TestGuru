document.addEventListener('turbolinks:load', function () {
  document.querySelector(".dropmenubtn").addEventListener('click', handleDropdown)
})

function handleDropdown() {
  document.querySelector(".dropmenu-content").classList.toggle("show");
}
