KijaniKiosk Payments Service - SLI/SLO Document

 1. Availability SLI
Percentage of successful health check requests measured every 5 seconds
2. Latency SLI
Response time for payment processing requests (p95)
3. Payment Error Rate SLI
Percentage of payment attempts that fail
 SLO Targets

| SLI | SLO Target |
 Availability | 99.9% |
 Latency (p95) | 500ms |
 Payment Error Rate | 0.5% |

 Rollback Threshold Table

| SLI | Short Window | Trigger Action |
|-----|--------------|----------------|
| Availability | 3 consecutive failures | Immediate rollback |
| Latency | >1000ms for 10 checks | Rollback within 90s |
| Error Rate | 2% over 1 minute | Rollback within 90s |
What We Do NOT Commit To

1. Third-party Payment Gateway Latency
2. Network Infrastructure Outside Our VPC
EOF


