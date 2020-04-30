from appium.webdriver.appium_service import AppiumService

def start_appium_server():
    appium_service = AppiumService()
    appium_service.start()
    print("Server Started")

def stop_appium_server():
    appium_service = AppiumService()
    appium_service.stop()
    print("Server Stoped")

start_appium_server()
stop_appium_server()