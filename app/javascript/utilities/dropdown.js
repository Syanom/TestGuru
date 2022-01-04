document.addEventListener('turbolinks:load', function () {
  document.querySelector(".dropmenubtn").addEventListener('click', handleDropdown)
  window.onclick = closeDropdown
})

function handleDropdown() {
  document.querySelector(".dropmenu-content").classList.toggle("show");
}

function closeDropdown(event) {
  if (!event.target.matches('.dropmenubtn,.octicon-three-bars')) {
    const dropdowns = document.getElementsByClassName("dropmenu-content");
    for (let i = 0; i < dropdowns.length; i++) {
      const openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}