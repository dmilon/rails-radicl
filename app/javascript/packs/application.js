//=require datetime_picker_input

import "bootstrap";
import "../plugins/flatpickr";

import { initUpdateNavbarOnScroll } from '../components/navbar';
import { loadDynamicBannerText } from '../components/banner';
import { tabsClickListener } from '../components/tab';
import { bindSweetAlertButtonDemo } from '../components/banner';
// import { initTooltip } from '../components/init_tooltip';
import '../components/select2';
import { scroll } from '../components/scroll';
import { confirmSent } from "../components/confirm"
import swal from 'sweetalert';


scroll();
initUpdateNavbarOnScroll();
loadDynamicBannerText();
tabsClickListener();
// initTooltip();

// const markAsDone = document.querySelectorAll(".fas.fa-check-circle");
// markAsDone.forEach((button) => {
//   button.addEventListener('click', (event) => {
//     button.classList.toggle('done');
//   });
// })
const buttons = document.querySelectorAll('#myBtnContainer .btn');

buttons.forEach((button) => {
  button.addEventListener('click', (event) => {
    const filter = event.currentTarget.dataset.filter;
    filterSelection(filter);
  });
});

filterSelection("all")
function filterSelection(c) {
  let x, i;
  x = document.getElementsByClassName("filterDiv");
  if (x) {
    if (c == "all") c = "";
      // Add the "show" class (display:block) to the filtered elements, and remove the "show" class from the elements that are not selected
    for (i = 0; i < x.length; i++) {
      w3RemoveClass(x[i], "show");
      if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
      }
    }
  }


// Show filtered elements
function w3AddClass(element, name) {
  let i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {
      element.className += " " + arr2[i];
    }
  }

}

// Hide elements that are not selected
function w3RemoveClass(element, name) {
  let i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);
    }
  }
  element.className = arr1.join(" ");
}


// Add active class to the current control button (highlight it)
const btnContainer = document.getElementById("myBtnContainer");
if (btnContainer) {
  const btns = btnContainer.getElementsByClassName("btn");

  for (let i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", function() {
      const current = document.getElementsByClassName("active");
      current[0].className = current[0].className.replace(" active", "");
      this.className += " active";
    });
  }
}
