# Tutorial 3

Muhammad Kenshin Himura Mahmuddin - 2006473844

## Fitur Baru
### Double jump
Implementasi double jump hanya perlu menambahkan variable tracker yang menandakan apakah karakter bisa double jump atau tidak. Variable ini akan menjadi false setelah pemain menekan tombol jump saat tidak menyentuh ground, lalu variable akan direset lagi setelah player menyentuh ground
### Dash
Kali ini mencoba dengan hanya memanfaatkan variabel timestamp dan delta (mungkin akan lebih baik jika menggunakan bantuan node timer).  
Implementasi memanfaatkan 3 variable timestamp untuk mencatat waktu cooldown dash, waktu interval dua kali tap untuk dash, dan waktu dashing berlangsung.  
Setiap kali player menekan tombol kiri atau kanan, akan dicatat jenis tombol yang ditekan dan akan memulai timestamp dash yang akan membantu menghitung interval pada penekanan tombol yang sama untuk kedua kalinya. Jika tekanan kedua berada pada interval yang sesuai, akan ditandai bahwa player sedang dashing dan velocity x nya akan dikali 10 selama dashing = true, setelah itu dimulai timestamp durasi dashing dan durasi cooldown. Sistem timestampnya sendiri memanfaatkan argumen delta pada _physics_process yang akan terus mengurangi semua timestamp. Menurut saya ini bukanlah implementasi yang paling bagus untuk fitur ini dan saya berencana untuk membuat implementasi yang lebih baik pada individual game jam.

Seluruh implementasi ini memang hasil eksperimen sendiri tanpa mencoba mencari contoh implementasinya di internet. Hanya memanfaatkan docs godot.