import Typed from 'typed.js';

function loadDynamicBannerText() {
  if (document.querySelector('#banner-typed-text')) {
    new Typed('#banner-typed-text', {
      strings: ["Gérez", "Cultivez", "Enrichissez", "Développez" ],
      typeSpeed: 50,
       loop: true,
      showCursor: false,
      fadeOut: true,
    });
  }
}

export { loadDynamicBannerText };


