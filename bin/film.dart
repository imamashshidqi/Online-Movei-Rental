import 'package:dart_console/dart_console.dart';
import 'package:interact_cli/interact_cli.dart';
import 'dart:io';
import 'onlinemovie.dart';

Film filmBaru = Film('', '', '', 0, 0);

List<Film> filmFilm = <Film>[];

class Film {
  static int counter = 0;
  int id;
  String judul;
  String genre;
  String tglRilis;
  double rating;
  int durasi;

  Film(this.judul, this.genre, this.tglRilis, this.rating, this.durasi)
      : id = counter++;

  void tambahFilm(Film filmBaru) {
    filmFilm.add(filmBaru);
    print("Film ${filmBaru.judul} telah ditambahkan");
  }

  void lihatFilm() {
    Table tabel = Table()
      ..insertColumn(header: "ID", alignment: TextAlignment.center)
      ..insertColumn(header: "Judul", alignment: TextAlignment.center)
      ..insertColumn(header: "Genre", alignment: TextAlignment.center)
      ..insertColumn(header: "Tanggal Rilis", alignment: TextAlignment.center)
      ..insertColumn(header: "Rating", alignment: TextAlignment.center)
      ..insertColumn(header: "Durasi", alignment: TextAlignment.center)
      ..borderColor = ConsoleColor.cyan
      ..borderStyle = BorderStyle.square
      ..borderType = BorderType.grid
      ..headerColor = ConsoleColor.blue
      ..headerStyle = FontStyle.bold;

    console.clearScreen();
    if (filmFilm.isEmpty) {
      tabel.insertRow(["-", "-", "-", "-", "-", "-"]);
    } else {
      for (var filmku in filmFilm) {
        tabel.insertRow([
          filmku.id,
          filmku.judul,
          filmku.genre,
          filmku.tglRilis,
          filmku.rating,
          filmku.durasi
        ]);
      }
    }
    print(tabel);
    stdout.write("Lanjut? (Enter)");
    stdin.readLineSync();
  }

  void updateFilm(int id) {
    int index = id - 1;

    if (index < 0 || index >= filmFilm.length) {
      print("Masukan ID Film yang benar!");
    } else {
      String judul = filmFilm[index].judul;
      print("Ganti Judul Film $judul");
      String judulBaru = Input(prompt: "Masukan Judul baru: ").interact();
      filmFilm[index].judul = judulBaru;
      print("Judul Film telah berhasil diperbaharui!");
    }
  }

  void hapusFilm(int id) {
    int index = id - 1;
    if (index < 0 || index >= filmFilm.length) {
      print("Tidak ada Film yang dapat dihapus!");
    } else {
      String judul = filmFilm[index].judul;
      int hapus = Select(
          prompt: "Apakah kamu yakin ingin menghapus Film $judul?",
          options: ["YA!", "TIDAK!"]).interact();

      if (hapus == 0) {
        filmFilm.removeAt(index);
        print("Film $judul telah berhasil dihapus!");
      }
    }
  }
}
