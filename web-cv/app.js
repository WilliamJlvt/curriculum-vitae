document.documentElement.classList.add("js-ready");

const defaultTitle = document.title;

window.addEventListener("beforeprint", () => {
  document.title = "CV_William_Jolivet_2026";
});

window.addEventListener("afterprint", () => {
  document.title = defaultTitle;
});
