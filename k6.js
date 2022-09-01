import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 100,
  duration: '60s',
};

export default function () {
  http.get('http://myserverlessappsa2x51pal-sillydemo.functions.fnc.fr-par.scw.cloud');
  sleep(1);
}
