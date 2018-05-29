import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["manage", "learn", "spread", "harvest"],
    typeSpeed: 50,
    loop: true,
    showCursor: false,
    fadeOut: true,
  });
}

export { loadDynamicBannerText };
