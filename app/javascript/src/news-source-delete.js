document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll(".news-delete").forEach(node => {
    node.addEventListener("click", event => {
      event.preventDefault();

      // console.log("click delete button!");
      const { currentTarget } = event;
      const newsId = currentTarget.dataset.id;
      newsId.remove();
      
    });
  });
});