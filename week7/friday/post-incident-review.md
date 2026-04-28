Post-Incident Review: Wrong Environment Deployment

Section 1: Incident Summary
During an investor demonstration, the pipeline targeted the wrong environment, causing 48 seconds of unavailability.
 Section 2: Timeline
09:55 Walkthrough begins
09:58 Pipeline triggered
09:58 Wrong environment targeted
09:59 Incident detected
10:00 Service restored

 Section 3: Root Cause
Pipeline lacked environment verification before deployment.

 Section 4: Contributing Factors
No verification step, similar naming conventions, no mandatory parameters.

 Section 5: What Went Well
Detection within 30 seconds, successful manual rollback.

 Section 6: Action Items
1. Add mandatory environment parameter (Pipeline Engineer, Week 7)
2. Add pre-deployment confirmation (Frontend Team, Week 8)
3. Create runbook (DevOps Lead, Week 7)
EOF

# Create demo-script.md
cat > demo-script.md << 'EOF'
# Board Demo Script

*Stage Direction: Nia at f
