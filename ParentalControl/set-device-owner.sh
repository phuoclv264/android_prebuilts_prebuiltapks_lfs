#!/system/bin/sh

if [ ! -e /data/system/device_owner_2.xml ]; then
    dpm set-device-owner foundation.e.parentalcontrol/foundation.e.parentalcontrol.DeviceAdmin
    # If there's multiple users, we won't be able to as device owner, so use profile owner.
    dpm set-profile-owner foundation.e.parentalcontrol/foundation.e.parentalcontrol.DeviceAdmin
fi
