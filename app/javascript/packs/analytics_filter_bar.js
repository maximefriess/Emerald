const analyticsFilterShow = () => {
  const analyticsFilterBar = document.querySelector('#analytics-filter-bar-show');
  if (analyticsFilterBar) {
    analyticsFilterBar.addEventListener('click', (event) => {
      document.querySelector(".analytics-filter-menu-show").classList.toggle('hidden');
    });
  }
}

export { analyticsFilterShow };

