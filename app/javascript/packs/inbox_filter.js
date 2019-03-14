
const fliterBar = document.querySelector('.filter-bar')

filterBar.addEventListener('click', (event) => {
  event.currentTarget.classList.toggle("inbox-filter-menu");
}
