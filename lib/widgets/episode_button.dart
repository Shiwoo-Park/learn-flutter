import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_episode.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EpisodeButton extends StatelessWidget {
  final String webtoonId;
  final WebtoonEpisode episode;

  const EpisodeButton({
    Key? key,
    required this.webtoonId,
    required this.episode,
  }) : super(key: key);

  void onButtonTap() async {
    await launchUrlString(
        "http://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
  }

  String getRefinedTitle(String title) {
    if (title.length > 20) {
      return '${title.substring(0, 19)}...';
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.green.shade500,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getRefinedTitle(episode.title),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
