# Tutorial 3

Muhammad Kenshin Himura Mahmuddin - 2006473844

## Fitur Baru
### Double jump
Implementasi double jump hanya perlu menambahkan variable tracker yang menandakan apakah karakter bisa double jump atau tidak. Variable ini akan menjadi false setelah pemain menekan tombol jump saat tidak menyentuh ground, lalu variable akan direset lagi setelah player menyentuh ground
### Dash
Kali ini mencoba dengan hanya memanfaatkan variabel timestamp dan delta (mungkin akan lebih baik jika menggunakan bantuan node timer). Implementasi memanfaatkan 3 variable timestamp untuk mencatat waktu cooldown dash, waktu interval dua kali tap untuk dash, dan waktu dashing berlangsung.

Seluruh implementasi ini memang hasil eksperimen sendiri tanpa mencoba mencari contoh implementasinya di internet. Hanya memanfaatkan docs godot.