const analyticsFilter = () => {
  const analyticsFilterBar = document.querySelector('#analytics-filter-bar');
  if (analyticsFilterBar) {
    analyticsFilterBar.addEventListener('click', (event) => {
      document.querySelector(".analytics-filter-menu").classList.toggle('hidden');
    });
  }
}

export { analyticsFilter };

