import http from 'k6/http';
import { check, sleep } from 'k6';
import { Counter } from 'k6/metrics';

// Custom metrics
const requestCounter = new Counter('custom_requests_total');

export const options = {
    // Enhanced load profile for better autoscaling demonstration
    stages: [
        { duration: '1m', target: 10 },   // Fast ramp up to 10 users
        { duration: '3m', target: 10 },   // Maintain 10 users (triggers scaling)
        { duration: '1m', target: 5 },    // Gradual scale down
        { duration: '1m', target: 0 },    // Complete ramp down (observe scale-in)
    ],
    thresholds: {
        http_req_duration: ['p(95)<500'],  // 95% of requests should be below 500ms
        'http_req_failed': ['rate<0.1'],    // Error rate should be below 10%
    },
};

// Use internal service name
const BASE_URL = 'http://els-server.els-devops-system.svc.cluster.local:1337/_health';

export default function () {
    const res = http.get(BASE_URL);
    
    requestCounter.add(1);

    check(res, {
        'status is 200/204': (r) => r.status === 200 || r.status === 204,
    });

    // Minimal sleep to generate CPU load
    sleep(0.1);
}

// Setup function runs once at the start
export function setup() {
    console.log('🚀 Starting enhanced autoscaling load test');
    console.log('📊 Watch HPA with: kubectl get hpa -n els-devops-system -w');
    console.log('🔍 Watch pods with: kubectl get pods -n els-devops-system -w');
}

// Teardown function runs once at the end
export function teardown(data) {
    console.log('✅ Load test completed - watch for scale-down!');
}
