*** Variables ***
# instance info
${REMOTE_URL}    http://localhost:4723/wd/hub

# device info
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    10
${DEVICE_NAME}     emulator-5554

# app related info
${NEARBUY_APP}    ${EXECDIR}${/}apk${/}nearbuy.apk
${NEARBUY_APP_PACKAGE}    com.nearbuy.nearbuymobile
${NEARBUY_APP_ACTIVITY}    com.nearbuy.nearbuymobile.modules.sf_module.sf.SFActivity

# supported time in milliseconds
${APP_WAIT_TIME_OUT}    30000
${ELEMENT_TIME_OUT}    20s