# Tugas 7

### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateful Widget memiliki State yang bisa berubah setelah dibuat, Stateless Widget memiliki State yang tidak bisa berubah setelah dibuat.

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
`MaterialApp`: Widget untuk membuat aplikasi material

`Scaffold`: Widget untuk mengimplementasikan layout Material Design

`AppBar`: Widget untuk bar yang ada di atas layar

`Center`: Widget untuk meletakkan child widget di tengah-tengah parent

`Column`: Widget untuk menaruh widget children di suatu kolom

`Text`: Widget untuk menaruh teks

`Padding`: Widget untuk memberi padding pada childnya

`Row`: Widget untuk menaruh widget children di suatu baris

`FloatingActionButton`: Widget untuk menampilkan button lingkaran

`Spacer`: Widget untuk memberi spasi pada flex container

### Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Memberi tahu framework bahwa State pada `this` object telah berubah, yang akan mengakibatkan framework membangun object yang baru sesuai State.

### Jelaskan perbedaan antara const dengan final.
const immutable sejak compile-time, final tidak harus (bisa dieksekusi saat runtime).
const immutable secara rekursif (semua object didalam object bersifat immutable), final tidak.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
Membuat app baru dengan `flutter create counter_7`

Mengedit `floatingActionButton`

Membuat method untuk menghitung decrement counter

Menambahkan conditional untuk menghilangkan tombol `-` apabila nilai counter == 0

Menambahkan conditional untuk mengecek counter apakah genap atau ganjil untuk di-render

# Tugas 8

### Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.

Navigator.push menambahkan route ke dalam stack tanpa membuang route sebelumnya

Navigator.pushReplacement menambahkan route ke dalam stack dan route sebelumnya juga dihapus

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
Drawer = Layar samping yang mengandung link penting pada aplikasi.

Navigator = Widget yang membantu user menavigasi ke rute-rute lain.

ListTile = Widget yang mengisi ListView.

DropdownButton = Widget yang memiliki pilihan item yang bisa dipilih user.

TextFormField = Form TextField.

TextButton = Class yang digunakan untuk menampilkan text label.

### Sebutkan jenis-jenis event yang ada pada Flutter
onPressed
onChange
onSaved
onTap
onHover

### Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Navigator berfungsi dengan menyimpan stack dari route-route yang merupakan page. 

Method push untuk berpindah ke route yang ditentukan dengan builder yang diberikan, yang menghasilkan widget page yang dituju. 

Pop atau back button berguna untuk kembali ke page sebelumnya.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
Menambahkan drawer

Membuat page untuk form beserta statenya

Membuat page untuk memunculkan data
