# URL de la imagen
$imageUrl = "https://konachan.com/image/6624d58245b5fcd5b1598c7e4263e795/Konachan.com%20-%20385716%203d%20ass%20barefoot%20blush%20breasts%20building%20cum%20flowers%20foxgirl%20green_eyes%20long_hair%20moon%20night%20nipples%20nude%20petals%20pussy%20sky%20tail%20tree%20uncensored.jpg"

# Ruta temporal donde se descargará la imagen
$tempImagePath = "$env:TEMP\imagen_descargada.jpg"

# Descargar la imagen desde la URL
Invoke-WebRequest -Uri $imageUrl -OutFile $tempImagePath

# Cambiar el fondo de pantalla
Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class Wallpaper {
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@

# Establecer la imagen como fondo de pantalla
[Wallpaper]::SystemParametersInfo(20, 0, $tempImagePath, 0x01 | 0x02)
