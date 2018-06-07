import { autocomplete } from '../components/autocomplete';
import { drawMap } from '../components/map';

autocomplete();
drawMap();

global.drawMap = drawMap;

