import "bootstrap";

import { initUpdateNavbarOnScroll } from '../components/navbar';
import { loadDynamicBannerText } from '../components/banner';
import { tabsClickListener } from '../components/tab';

initUpdateNavbarOnScroll();
loadDynamicBannerText();
tabsClickListener();
