function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  if (tabcontent) {
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
  }

  tablinks = document.getElementsByClassName("tablinks");
  if (tablinks) {
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
  }

  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

function tabsClickListener() {
  const tabLinks = document.querySelectorAll('.tablinks');
  const tabDefault = document.querySelector('.tablinks.default');
  if (tabLinks && tabDefault) {
    setTimeout(function() {
      tabDefault.click();
    }, 100);
    tabLinks.forEach((tabLink) => {
      tabLink.addEventListener('click', (event) => {
        openCity(event, event.currentTarget.dataset.tab);
      });
    });
  }
}

export { tabsClickListener };
