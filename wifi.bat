@echo off
echo Displaying saved WiFi networks
echo ------------------------------
color c
:: Get the list of all saved WiFi profiles
for /f "tokens=2 delims=:" %%a in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
    echo %%a
)

:: Ask the user to choose a WiFi network
set /p "profile=Enter the name of the WiFi profile: "

:: Display the password for the selected profile
netsh wlan show profile name="%profile%" key=clear | findstr "Key Content"

pause
