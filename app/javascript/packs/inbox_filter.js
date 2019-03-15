const inboxFilter = () => {
  const filterBar = document.querySelector('#filter-bar');
  if (filterBar) {
    filterBar.addEventListener('click', (event) => {
      document.querySelector(".inbox-filter-menu").classList.toggle('hidden');
    });
  }
}

export { inboxFilter };

