# file: opt/kijanikiosk/shared/logs/
# owner: kk-api
# group: kijanikiosk
# flags: -s-
user::rwx
user:kk-logs:rwx
user:kk-payments:r-x
user:kk-api:rwx
group::rwx
mask::rwx
other::---
default:user::rwx
default:user:kk-logs:rwx
default:user:kk-payments:r-x
default:user:kk-api:rwx
default:group::rwx
default:mask::rwx
default:other::---

# file: opt/kijanikiosk/health/
# owner: kk-logs
# group: kijanikiosk
user::rwx
group::r-x
other::---
