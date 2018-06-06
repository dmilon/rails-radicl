
function scroll() {
  const anims = document.querySelectorAll('.anim-scroll')
  window.addEventListener('scroll', (event) => {
    anims.forEach((anim) => {
      if (window.scrollY >= (anim.offsetTop - ( window.innerHeight * .5))){
        anim.classList.add('fadeInUp')
      }
    })
  })
}

export { scroll }
