import 'package:dart_console/dart_console.dart';
import 'package:interact_cli/interact_cli.dart';
import 'user.dart';

Console console = Console();
Customer memberBaru = Customer('', '', '');
Admin admin1 = Admin('ADMIN', 'admin', 'admin123');

void main() {
  bool menu = true;

  while (menu) {
    console.clearScreen();
    console.setBackgroundColor(ConsoleColor.blue);
    console.setTextStyle(bold: true);
    console.writeLine("Halaman Utama!", TextAlignment.center);
    console.resetColorAttributes();
    int pilihan = Select(
        prompt: "Pilih Menu",
        options: ["Daftar Member", "Login", "Keluar Program"]).interact();

    switch (pilihan) {
      case 0:
        console.clearScreen();
        String namaBaru = Input(prompt: "Masukan Nama: ").interact();
        String usernameBaru = Input(prompt: "Masukan Username: ").interact();
        String passwordBaru = Input(prompt: "Masukan Password: ").interact();
        memberBaru.daftarMember(Customer(namaBaru, usernameBaru, passwordBaru));
        break;
      case 1:
        console.clearScreen();
        String username = Input(prompt: "Masukan Username: ").interact();
        String password = Input(prompt: "Masukan Password: ").interact();

        User.login(username, password);
        break;
      case 2:
        console.clearScreen();
        menu = false;
        break;
      default:
    }
  }
}
