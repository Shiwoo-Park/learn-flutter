import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;
  final String userAgent =
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';

  const DetailScreen({
    required this.title,
    required this.thumb,
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Column(children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: id,
              child: Container(
                width: 250,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        offset: const Offset(5, 10),
                        color: Colors.black.withOpacity(0.5),
                      )
                    ]),
                child: Image.network(
                  thumb,
                  headers: {'User-Agent': userAgent},
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
