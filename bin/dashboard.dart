import 'package:dart_console/dart_console.dart';
import 'user.dart';
import 'film.dart';
import 'onlinemovie.dart';
import 'package:interact_cli/interact_cli.dart';

void dashboardCustomer(Customer member) {
  bool menu = true;
  while (menu) {
    console.clearScreen();
    console.setBackgroundColor(ConsoleColor.blue);
    console.setTextStyle(bold: true);
    console.writeLine("Hallo, ${member.nama}", TextAlignment.left);
    console.writeLine("Halaman Admin!", TextAlignment.center);
    console.resetColorAttributes();
    int pilihan = Select(
            prompt: "Pilih Menu Customer!",
            options: ["Lihat Daftar Film", "Update Profile Customer", "Logout"])
        .interact();

    switch (pilihan) {
      case 0:
        filmBaru.lihatFilm();
        break;
      case 1:
        String namaBaru = Input(prompt: "Masukan Nama Baru: ").interact();
        member.nama = namaBaru;
        member.updateProfile(member);
        break;
      case 2:
        console.clearScreen();
        menu = false;
        break;
      default:
    }
  }
}

void dashboardAdmin() {
  bool menu = true;

  while (menu) {
    console.clearScreen();
    console.setBackgroundColor(ConsoleColor.yellow);
    console.setTextStyle(bold: true);
    console.writeLine("Hallo, ${admin1.nama}", TextAlignment.left);
    console.writeLine("Halaman Admin!", TextAlignment.center);
    console.resetColorAttributes();
    int pilihan = Select(prompt: "Pilih Menu ADMIN!", options: [
      "Tambah Film",
      "Lihat Daftar Film",
      "Perbaharui Film",
      "Hapus Film",
      "Logout"
    ]).interact();

    switch (pilihan) {
      case 0:
        admin1.tambahFilm();
        console.clearScreen();
        break;
      case 1:
        admin1.lihatFilm();
        console.clearScreen();
        break;
      case 2:
        admin1.updateFilm();
        console.clearScreen();
        break;
      case 3:
        admin1.hapusFilm();
        console.clearScreen();
        break;
      case 4:
        console.clearScreen();
        menu = false;
        break;
      default:
    }
  }
}
