import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/webtoon_detail.dart';
import 'package:toonflix/models/webtoon_episode.dart';
import 'package:toonflix/services/api_services.dart';
import 'package:toonflix/widgets/episode_button.dart';

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
  final String prefKeyLikedWebtoonIds = "liked_webton_id_list";

  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisode>> episodes;
  late SharedPreferences prefs;
  late String webtoonId;
  bool isLiked = false;

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();

    List<String>? likedWebtoonIds = prefs.getStringList(prefKeyLikedWebtoonIds);
    likedWebtoonIds ??= [];
    isLiked = likedWebtoonIds.contains(webtoonId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    webtoonId = widget.id;
    webtoon = ApiService.getWebtoonById(webtoonId);
    episodes = ApiService.getWebtoonEpisodesById(webtoonId);
    initPrefs();
  }

  void onTapLike() async {
    List<String>? likedWebtoonIds = prefs.getStringList(prefKeyLikedWebtoonIds);
    likedWebtoonIds ??= [];

    if (likedWebtoonIds.contains(webtoonId)) {
      likedWebtoonIds.remove(webtoonId);
      isLiked = false;
    } else {
      likedWebtoonIds.add(webtoonId);
      isLiked = true;
    }

    setState(() {});
    await prefs.setStringList(prefKeyLikedWebtoonIds, likedWebtoonIds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: onTapLike,
              icon: isLiked
                  ? const Icon(Icons.favorite_outlined)
                  : const Icon(Icons.favorite_outline_outlined))
        ],
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(children: [
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${snapshot.data!.genre} / ${snapshot.data!.age}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        snapshot.data!.about,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  );
                }
                return const Text('...');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: episodes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      for (var episode in snapshot.data!)
                        EpisodeButton(webtoonId: widget.id, episode: episode)
                    ],
                  );
                }
                return Container();
              },
            )
          ]),
        ),
      ),
    );
  }
}
