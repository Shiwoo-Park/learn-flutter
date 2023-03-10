import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail.dart';
import 'package:toonflix/models/webtoon_episode.dart';
import 'package:toonflix/services/api_services.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    required this.title,
    required this.thumb,
    required this.id,
    super.key,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final String userAgent =
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';

  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisode>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getWebtoonById(widget.id);
    episodes = ApiService.getWebtoonEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
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
              tag: widget.id,
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
                  widget.thumb,
                  headers: {'User-Agent': userAgent},
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        FutureBuilder(
          future: webtoon,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data!.about,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      '${snapshot.data!.genre} / ${snapshot.data!.age}',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              );
            }
            return const Text('...');
          },
        ),
      ]),
    );
  }
}
