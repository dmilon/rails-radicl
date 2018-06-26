import "bootstrap";
import "../components/flatpickr";

import { initUpdateNavbarOnScroll } from '../components/navbar';
import { loadDynamicBannerText } from '../components/banner';
import { tabsClickListener } from '../components/tab';
import { bindSweetAlertButtonDemo } from '../components/banner';
import '../components/select2';
import { scroll } from '../components/scroll';
import { confirmSent } from "../components/confirm"
import swal from 'sweetalert';


scroll();
initUpdateNavbarOnScroll();
loadDynamicBannerText();
tabsClickListener();


