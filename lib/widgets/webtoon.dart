import 'package:flutter/material.dart';
import 'package:toonflix/screens/webtoon/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;
  final String userAgent =
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  const Webtoon({
    required this.title,
    required this.thumb,
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            fullscreenDialog: true, // 아래에서 튀어나오게 할지 여부
          ),
        );
      },
      child: Column(
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
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
