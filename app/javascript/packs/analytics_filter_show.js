const analyticsFilterShow = () => {
  const analyticsFilterBarShow = document.querySelector('#analytics-filter-bar-show');
  if (analyticsFilterBarShow) {
    analyticsFilterBarShow.addEventListener('click', (event) => {
      document.querySelector(".analytics-filter-menu-show").classList.toggle('hidden');
    });
  }
}

export { analyticsFilterShow };

