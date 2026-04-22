Started by user sheila

22:19:58 Connecting to https://api.github.com using sheilasigilai110/******
Obtained week5/friday/Jenkinsfile from c919eb494e4b35cf6ef28f3c9e17accdfaab6ef9
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins
 in /var/jenkins_home/workspace/peline_feature_week5-ci-pipeline
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
The recommended git tool is: NONE
using credential 0ca0b9ed-cb8c-4887-b2e6-01524074a740
Cloning the remote Git repository
Cloning with configured refspecs honoured and without tags
Cloning repository https://github.com/sheilasigilai110/kijaniosk-devops-foundation.git
 > git init /var/jenkins_home/workspace/peline_feature_week5-ci-pipeline # timeout=10
Fetching upstream changes from https://github.com/sheilasigilai110/kijaniosk-devops-foundation.git
 > git --version # timeout=10
 > git --version # 'git version 2.47.3'
using GIT_ASKPASS to set credentials 
 > git fetch --no-tags --force --progress -- https://github.com/sheilasigilai110/kijaniosk-devops-foundation.git +refs/heads/feature/week5-ci-pipeline:refs/remotes/origin/feature/week5-ci-pipeline # timeout=10
 > git config remote.origin.url https://github.com/sheilasigilai110/kijaniosk-devops-foundation.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/feature/week5-ci-pipeline:refs/remotes/origin/feature/week5-ci-pipeline # timeout=10
Avoid second fetch
Checking out Revision c919eb494e4b35cf6ef28f3c9e17accdfaab6ef9 (feature/week5-ci-pipeline)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f c919eb494e4b35cf6ef28f3c9e17accdfaab6ef9 # timeout=10
Commit message: "[Fault injection-Lint Failure]"
 > git rev-list --no-walk 88d62a098dce8db32583e4392c3423d67f439f01 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] isUnix
[Pipeline] withEnv
[Pipeline] {
[Pipeline] sh
+ docker inspect -f . node:18.16.0-alpine
.
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] withDockerContainer
Jenkins seems to be running inside container c3dfcc230e6b1e3c6a8dfc1bea751a79b6665b940a7b100218b868e25bba46f1
$ docker run -t -d -u 1000:1000 --network jenkins-net -u root -w /var/jenkins_home/workspace/peline_feature_week5-ci-pipeline --volumes-from c3dfcc230e6b1e3c6a8dfc1bea751a79b6665b940a7b100218b868e25bba46f1 -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** node:18.16.0-alpine cat
$ docker top 39cd700a7cdc39816f836d485e9bf59daf51b6c829aa433c7d4a78cd01629a9c -eo pid,comm
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Lint)
[Pipeline] dir
Running in /var/jenkins_home/workspace/peline_feature_week5-ci-pipeline/week5/friday/app
[Pipeline] {
[Pipeline] sh
+ exit 1
[Pipeline] }
[Pipeline] // dir
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Build)
Stage "Build" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Verify)
Stage "Verify" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Security Audit)
Stage "Security Audit" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Prepare)
Stage "Prepare" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Version)
Stage "Version" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Archive)
Stage "Archive" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Publish)
Stage "Publish" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] cleanWs
[WS-CLEANUP] Deleting project workspace...
[WS-CLEANUP] Deferred wipeout is used...
[WS-CLEANUP] done
[Pipeline] echo
NOTICE: Build status changed.
[Pipeline] echo
FAILURE: Pipeline failed. Investigate logs.
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
$ docker stop --time=1 39cd700a7cdc39816f836d485e9bf59daf51b6c829aa433c7d4a78cd01629a9c
$ docker rm -f --volumes 39cd700a7cdc39816f836d485e9bf59daf51b6c829aa433c7d4a78cd01629a9c
[Pipeline] // withDockerContainer
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
ERROR: script returned exit code 1

GitHub has been notified of this commit’s build result

Finished: FAILURE


## Lint Failure
#Fault: exit 1 injected into lint stage

#Result:
Pipeline stopped at Lint stage. All downstream stages skipped.

#Reason:
Prevents invalid code from entering build process.


Started by user sheila

23:00:59 Connecting to https://api.github.com using sheilasigilai110/******
Obtained week5/friday/Jenkinsfile from 3979aea6df814566eed574343438091301895233
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins
 in /var/jenkins_home/workspace/peline_feature_week5-ci-pipeline
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
The recommended git tool is: NONE
using credential 0ca0b9ed-cb8c-4887-b2e6-01524074a740
Cloning the remote Git repository
Cloning with configured refspecs honoured and without tags
Cloning repository https://github.com/sheilasigilai110/kijaniosk-devops-foundation.git
 > git init /var/jenkins_home/workspace/peline_feature_week5-ci-pipeline # timeout=10
Fetching upstream changes from https://github.com/sheilasigilai110/kijaniosk-devops-foundation.git
 > git --version # timeout=10
 > git --version # 'git version 2.47.3'
using GIT_ASKPASS to set credentials 
 > git fetch --no-tags --force --progress -- https://github.com/sheilasigilai110/kijaniosk-devops-foundation.git +refs/heads/feature/week5-ci-pipeline:refs/remotes/origin/feature/week5-ci-pipeline # timeout=10
 > git config remote.origin.url https://github.com/sheilasigilai110/kijaniosk-devops-foundation.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/feature/week5-ci-pipeline:refs/remotes/origin/feature/week5-ci-pipeline # timeout=10
Avoid second fetch
Checking out Revision 3979aea6df814566eed574343438091301895233 (feature/week5-ci-pipeline)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 3979aea6df814566eed574343438091301895233 # timeout=10
Commit message: "Fault injection - Build stage failure"
 > git rev-list --no-walk a5777c3ce961c8ba4a920856b0175a4646692e19 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] isUnix
[Pipeline] withEnv
[Pipeline] {
[Pipeline] sh
+ docker inspect -f . node:18.16.0-alpine
.
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] withDockerContainer
Jenkins seems to be running inside container c3dfcc230e6b1e3c6a8dfc1bea751a79b6665b940a7b100218b868e25bba46f1
$ docker run -t -d -u 1000:1000 --network jenkins-net -u root -w /var/jenkins_home/workspace/peline_feature_week5-ci-pipeline --volumes-from c3dfcc230e6b1e3c6a8dfc1bea751a79b6665b940a7b100218b868e25bba46f1 -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** node:18.16.0-alpine cat
$ docker top a51221a13d1b52cd20650e859e955273f34a2f6e62c95aa8de47d410de70dbed -eo pid,comm
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Lint)
[Pipeline] dir
Running in /var/jenkins_home/workspace/peline_feature_week5-ci-pipeline/week5/friday/app
[Pipeline] {
[Pipeline] sh
+ npm run lint

> app@1.0.0 lint
> echo linting...

linting...
[Pipeline] }
[Pipeline] // dir
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Build)
[Pipeline] dir
Running in /var/jenkins_home/workspace/peline_feature_week5-ci-pipeline/week5/friday/app
[Pipeline] {
[Pipeline] sh
+ npm run build

> app@1.0.0 build
> exit 1

[Pipeline] }
[Pipeline] // dir
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Verify)
Stage "Verify" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Security Audit)
Stage "Security Audit" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Prepare)
Stage "Prepare" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Version)
Stage "Version" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Archive)
Stage "Archive" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Publish)
Stage "Publish" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] cleanWs
[WS-CLEANUP] Deleting project workspace...
[WS-CLEANUP] Deferred wipeout is used...
[WS-CLEANUP] done
[Pipeline] echo
FAILURE: Pipeline failed. Investigate logs.
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
$ docker stop --time=1 a51221a13d1b52cd20650e859e955273f34a2f6e62c95aa8de47d410de70dbed
$ docker rm -f --volumes a51221a13d1b52cd20650e859e955273f34a2f6e62c95aa8de47d410de70dbed
[Pipeline] // withDockerContainer
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
ERROR: script returned exit code 1

GitHub has been notified of this commit’s build result

Finished: FAILURE

**Observed behavior:**

#Lint stage completed successfully
#Build stage failed intentionally using exit 1
#All downstream stages were skipped automatically

