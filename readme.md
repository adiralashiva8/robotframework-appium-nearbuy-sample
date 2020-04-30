# Robotframework Appium Sample (nearbuy app)

Sample scripts to automate nearbuy app using robotframework + appium

---

## Framework

 - common --> Reusable keywords

 - libs --> useful python codes

 - screens (pom concept)
   - locators --> page level locators
   - keywords --> page level keyword

 - test_data --> test data like appActivity, credentials, webdriver, apk etc.,

 - tests --> collection of test suites

---

## Installation

 - Download node.exe

 - Install appium
   > `npm install -g appium`

 - Download & Install Andriod Studio (.zip file)

 - Add SDK, Tools, Platform-Tools, bin location in PATH environment variable

 - Download & Install Appium Desktop

 - Download & Install Appium Doctor

 - Install robotframework, robotframework-appium (project root folder)
   > `pip install -r requirements.txt`

   > Validate installation at every step

---

## Execution of tests

 Appium server will be started & stopped through code. For code refer `appium_helper.py`

 - Execute all suites (all suites present under tests folder)
   > `robot tests`

 - Execute specific suite
   > `robot tests/home_tests.robot`

 - Execute specific test in suite
   > `robot -t "Validate Available Standard Icons In Home Screen" tests/home_tests.robot`

 - Execute by tag name
   > `robot -i home tests`

### Executes all tests using .bat file

  To avoid typing command, created bat file to execute all suites. This includes

  > `run.bat`

  - Executes all tests
  - Live results
    <img src="/results/Live_View.png" alt="LiveLogs">

  - Send email after complete execution
    <img src="/results/email_view.png" alt="Email">

  - Create metrics report after execution
    <img src="/results/Metrics_View.png" alt="Metrics">

### Pre-requisties

 - Neabuy app should be installed in emulator / device
 - Select location
 - Skip login

---

## Other helpfull commands

 - Common Andriod installation path
    ```
    C:\Users\<user>\AppData\Local\Android\Sdk\
    ```

 - Get list of connceted devices
    ```
    adb devices
    ```

 - Get appPackage & appActivity
    > Open app in mobile & execute following command

    ```
    adb shell "dumpsys activity activities | grep mResumedActivity"
    ```

 - Validate appActivity (execute following commands)
   ```
   adb shell
   am start -n appPackage/appActivity
   ```

 - Kill open instances
   ```
   taskkill /F /IM node.exe
   ```

 - Start emulator
   > Point to emulator path SDK/emulator/ & execute command
   ```
   emulator -avd avd_name
   ```

 - Install app in emulator (check version comaptiable)
   ```
   adb -e install apkfile.apk
   ```

---
## Helpful Links

 - [Awesome Appium](https://github.com/SrinivasanTarget/awesome-appium)
 - [Robotframework](https://github.com/robotframework/robotframework)
 - [Robotframework Appium](https://github.com/serhatbolsu/robotframework-appiumlibrary)
 - [Email Listener](https://github.com/adiralashiva8/robotframework-email)
 - [Robotframework Metrics](https://github.com/adiralashiva8/robotframework-metrics)
 - [Live Logs](https://github.com/adiralashiva8/robotframework-live-logs)