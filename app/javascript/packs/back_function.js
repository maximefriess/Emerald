const backArrow = () => {
  const backButton = document.querySelector('#backBtn');
  if (backButton) {
    backButton.addEventListener('click', (event) => {
      window.history.back()
    });
  }
}

export { backArrow };
