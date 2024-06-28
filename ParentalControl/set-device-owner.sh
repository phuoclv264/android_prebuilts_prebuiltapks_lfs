#!/system/bin/sh

dpm set-device-owner foundation.e.parentalcontrol/foundation.e.parentalcontrol.DeviceAdmin
# If there's multiple users, we won't be able to as device owner, so use profile owner.
dpm set-profile-owner foundation.e.parentalcontrol/foundation.e.parentalcontrol.DeviceAdmin
