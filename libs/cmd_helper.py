import os

def execute_command(command):
    result = os.system(command)
    print('Result: ', result)

# usage example
execute_command("adb shell svc wifi disable")
execute_command("adb shell svc wifi enable")