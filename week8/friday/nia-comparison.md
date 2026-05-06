# Week 8 vs Week 7: What Changed and Why It Matters

## The Big Picture

Last week, deploying our payment app was a scary manual process. A developer had to type commands on their laptop, then log into a server and type more commands. If something went wrong at 2 AM, someone got a phone call.

This week, everything is automated. We push code, and the system handles the rest. If something crashes, it fixes itself in seconds.

## Two Numbers That Prove It Works

**Number 1: Image size dropped from 892MB to 84MB**

Last week's container was huge because it included compilers and tools we don't need to just run the app. This week's container only has what's necessary. Result: deployments take seconds instead of minutes. The board cares about this because faster deployments mean faster features for customers.

**Number 2: Self-healing takes 18 seconds**

We tested what happens when a container dies. Last week: someone had to notice, log in, and restart it - usually 15+ minutes. This week: Kubernetes saw the failure and started a new container in 18 seconds. No human involved. The board can sleep better knowing this.

## How They Compare

| What | Week 7 | Week 8 |
|------|--------|--------|
| **How we deploy** | Developer types commands on laptop, then SSH to server | Push to registry, Kubernetes applies the change automatically |
| **How we go back to old version** | Find old container name, stop new one, start old one by hand (10+ minutes of panic) | One command: kubectl rollout undo (5 seconds, calm) |
| **What happens when something crashes** | Alarm goes off, someone wakes up, logs in, restarts (15+ minutes of downtime) | Kubernetes restarts it automatically (18 seconds of downtime) |
| **How we handle more traffic** | Buy bigger server, move everything over (hours of work, possible downtime) | Change number from 2 to 10, traffic spreads automatically (zero downtime) |


Week 8 is a huge step forward. We went from "hope nothing breaks" to the self healing of the sysytem. The numbers prove it: 892MB → 84MB for faster deployments, and 15+ minutes → 18 seconds for recovery. The board should approve this as our new way of working. Next week we fix the remaining gaps.
