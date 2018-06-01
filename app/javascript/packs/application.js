//= require datetime_picker_input

import "bootstrap";
//import "../plugins/flatpickr";

import { initUpdateNavbarOnScroll } from '../components/navbar';
import { loadDynamicBannerText } from '../components/banner';
import { tabsClickListener } from '../components/tab';
import { bindSweetAlertButtonDemo } from '../components/banner';
import '../components/select2';

initUpdateNavbarOnScroll();
loadDynamicBannerText();
tabsClickListener();
