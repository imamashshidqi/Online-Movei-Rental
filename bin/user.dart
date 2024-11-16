import 'dashboard.dart';
import 'onlinemovie.dart';
import 'film.dart';
import 'package:interact_cli/interact_cli.dart';

abstract class User {
  static int counter = 0;
  int id;
  String nama;
  String username;
  String password;
  String? statusLangganan;

  User(this.nama, this.username, this.password,
      {this.statusLangganan = 'Basic'})
      : id = counter++;

  static void login(String username, String password) {
    for (var cekMember in memberMember) {
      if (cekMember.username == username && cekMember.password == password) {
        dashboardCustomer(cekMember);
      } else if (admin1.username == username && admin1.password == password) {
        dashboardAdmin();
      } else {
        print("Username atau Password Salah!");
      }
    }
  }

  void updateProfile(covariant User user);
  void lihatFilm() {
    filmBaru.lihatFilm();
  }
}

List<Customer> memberMember = <Customer>[];

class Customer extends User {
  Customer(super.nama, super.username, super.password);

  void daftarMember(Customer member) {
    console.clearScreen();
    memberMember.add(member);
    print("Selamat datang ${member.nama}!");
  }

  @override
  void updateProfile(Customer member) {
    int index = member.id - 1;
    member = memberMember[index];
  }
}

class Admin extends User {
  Admin(super.nama, super.username, super.password);

  @override
  void updateProfile(Admin) {}

  void tambahFilm() {
    String judulBaru = Input(prompt: "Masukan Judul Film Baru: ").interact();
    String genre = Input(prompt: "Masukan Genree Film: ").interact();
    String tglRilis = Input(prompt: "Masukan Tanggal Rilis Film: ").interact();
    double rating =
        double.parse(Input(prompt: "Masukan Rating Film (1-5)").interact());
    int durasi =
        int.parse(Input(prompt: "Masukan Durasi Film (Menit): ").interact());
    filmBaru.tambahFilm(Film(judulBaru, genre, tglRilis, rating, durasi));
    print("Film $judulBaru telah ditabahkan!");
  }

  void updateFilm() {
    int id = int.parse(
        Input(prompt: "Film dengan ID berapa yang ingin kamu perbaharui: ")
            .interact());
    filmBaru.updateFilm(id);
  }

  void hapusFilm() {
    int id = int.parse(
        Input(prompt: "Film dengan ID berapa yang ingin kamu Hapus: ")
            .interact());
    filmBaru.hapusFilm(id);
  }
}
