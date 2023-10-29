import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {
    this.apply();
  }

  connect() { }

  apply() {
    document.documentElement.setAttribute("data-bs-theme", this.theme === "auto" ? this.systemDefault : this.theme);

    const themeSwitcher = document.querySelector("#bd-theme");
    const themeSwitcherText = document.querySelector("#bd-theme-text");
    const themeSwitcherLabel = `${themeSwitcherText.textContent} (${this.theme})`;
    const activeThemeIcon = document.querySelector(".theme-icon-active");
    const btnToActive = document.querySelector(`[data-theme-value="${this.theme}"]`);

    document.querySelectorAll('[data-theme-value]').forEach(element => {
      element.classList.remove("active");
      element.setAttribute("aria-pressed", "false");
      activeThemeIcon.classList.remove(element.dataset.themeIcon);
    });

    btnToActive.classList.add("active");
    btnToActive.setAttribute("aria-pressed", "true");

    activeThemeIcon.classList.add(btnToActive.dataset.themeIcon);
    themeSwitcher.setAttribute("aria-label", themeSwitcherLabel);
  }

  switch(event) {
    this.theme = event.target.dataset.themeValue;
    this.apply();
  }

  get systemDefault() {
    return window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
  }

  get theme() {
    return window.localStorage.getItem("theme") || (this.theme = "auto");
  }

  set theme(value) {
    window.localStorage.setItem("theme", value);
  }
}
