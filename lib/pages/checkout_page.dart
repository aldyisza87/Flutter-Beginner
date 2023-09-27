import 'package:flutter/material.dart';

import 'package:djistore/data/models.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String getFirstTwoWords(String text) {
    // Memisahkan teks menjadi kata-kata berdasarkan spasi
    List<String> words = text.split(' ');

    // Mengambil dua kata pertama dan menggabungkannya kembali
    if (words.length >= 2) {
      return '${words.sublist(0, 5).join(' ')}...';
    } else {
      return text; // Mengembalikan teks asli jika hanya ada satu kata atau kurang
    }
  }

  int jumlah = 1;

  void tambahJumlah() {
    setState(() {
      jumlah++;
    });
  }

  void kurangJumlah() {
    setState(() {
      if (jumlah > 0) {
        jumlah--;
      }
    });
  }

  dynamic total() {
    setState(() {
      if (jumlah > 1) {
        jumlah * int.parse(widget.product.price);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Beli Langsung',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 70,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(106, 200, 238, 201)
                  ]),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/ck.png'),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    'Ini halaman terakhir dari proses belanjamu.\nPastikan semua sudah benar, ya. :)',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 16,
            color: Color.fromARGB(215, 247, 246, 246),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Barang yang dibeli',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('DJI Official Store',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text('Kab. Kebumen',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 12)),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 80,
                    child: Row(
                      children: [
                        Image.asset(widget.product.img),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              getFirstTwoWords(widget.product.name),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Sisa ${widget.product.qty}',
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Rp${widget.product.price}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Jumlah',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    trailing: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black, // Warna border hitam
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              kurangJumlah();
                            },
                            icon: const Icon(
                              Icons.remove,
                              size: 15,
                            ),
                          ),
                          Text(jumlah.toString()),
                          IconButton(
                            onPressed: () {
                              tambahJumlah();
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 16,
            color: Color.fromARGB(215, 247, 246, 246),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            title: const Text("Total bayar", style: TextStyle(fontSize: 15)),
            subtitle: Text("Rp${widget.product.price} ",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            trailing: SizedBox(
              width: 170,
              height: 45,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shield_outlined),
                label: const Text('Bayar',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.green[700]),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
