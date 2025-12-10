import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
    stages: [
        { duration: '30s', target: 5 },   // Ramp up
        { duration: '2m', target: 10 },   // Stay at 10 users
        { duration: '10s', target: 0 },   // Ramp down
    ],
};

// IMPORTANT: Use internal service name, not external URL
// This runs from inside the cluster, so fault injection works!
const BASE_URL = 'http://els-server.els-devops-system.svc.cluster.local:1337/_health';

function randomIntBetween(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
}

export default function () {
    const rand = randomIntBetween(1, 100);
    let headers = {};
    let expectedStatus;

    // Distribution: 55% success, 15% 500, 5% 302, 15% 404, 10% 400
    if (rand <= 55) {
        // 55% - Normal request (no header)
        expectedStatus = 204;
    } else if (rand <= 70) {
        // 15% - 500 error
        headers = { 'x-test-scenario': '500' };
        expectedStatus = 500;
    } else if (rand <= 75) {
        // 5% - 302 redirect
        headers = { 'x-test-scenario': '302' };
        expectedStatus = 302;
    } else if (rand <= 90) {
        // 15% - 404 error
        headers = { 'x-test-scenario': '404' };
        expectedStatus = 404;
    } else {
        // 10% - 400 error
        headers = { 'x-test-scenario': '400' };
        expectedStatus = 400;
    }

    const res = http.get(BASE_URL, { headers });

    check(res, {
        'status is expected': (r) => r.status === expectedStatus,
    });

    sleep(0.5);
}
