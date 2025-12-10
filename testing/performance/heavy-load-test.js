import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
    // Ramp up needed to not overwhelm immediately, but fast enough to trigger HPA
    stages: [
        { duration: '2m', target: 50 },   // Slow ramp up to 50 users (2 mins)
        { duration: '2m', target: 50 },   // Maintain 50 users (2 mins)
        { duration: '1m', target: 0 },    // Ramp down (1 min)
    ],
    thresholds: {
        http_req_duration: ['p(95)<500'], // 95% of requests should be below 500ms
    },
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
