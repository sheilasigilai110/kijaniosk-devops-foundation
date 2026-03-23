# Regions and availability zones
For us in Kenya we will choose Regions and availability zones within Africa(East Africa)region to ensure low latency and compliance with local data residency preferences

# Multi-AZ Strategy
We will adopt a Multi-AZ architecture for all production workloads:
Redundancy- Resources are duplicated across at least two Availability Zones.
Failover- In the event of an AZ outage, traffic is automatically rerouted to the healthy zone.
