import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
    // Ramp up needed to not overwhelm immediately, but fast enough to trigger HPA
    stages: [
        { duration: '2m', target: 5 },    // Slow ramp up to 5 users
        { duration: '2m', target: 5 },    // Maintain 5 users
        { duration: '1m', target: 0 },    // Ramp down
    ],
};

// Use internal service name
const BASE_URL = 'http://els-server.els-devops-system.svc.cluster.local:1337/_health';

export default function () {
    const res = http.get(BASE_URL);

    check(res, {
        'status is 200/204': (r) => r.status === 200 || r.status === 204,
    });

    // Minimal sleep to generate maximum CPU load
    sleep(0.1);
}
