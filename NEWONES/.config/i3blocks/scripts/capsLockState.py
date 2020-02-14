from os import system
import subprocess

def main():
    output = subprocess.Popen(['xset', '-q'],stdout=subprocess.PIPE)
    stdout = ''.join(output.communicate())
    word = "Caps Lock:   on"
    if word in stdout:
        print("OK")
    print(stdout)

if __name__ == "__main__":
    main()