# Robotframework Appium Sample (nearbuy app)

Sample scripts to automate nearbuy app using robotframework + appium

---

## Framework

 - apk --> Consist apk under test

 - common --> Reusable keywords

 - lib --> useful python codes

 - screens (pom concept)
   - locators --> page level locators
   - keywords --> page level keyword

 - test_data --> test data like appActivity, credentials etc.,

 - tests --> collection of test suites

---

## Installation

 - Download node.exe

 - Install appium
   `npm install -g appium`

 - Download & Install Andriod Studio (.zip file)

 - Add SDK, Tools, Platform-Tools, bin location in PATH environment variable

 - Download & Install Appium Desktop

 - Download & Install Appium Doctor

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

## Helpful Links

 - [Awesome Appium](https://github.com/SrinivasanTarget/awesome-appium)