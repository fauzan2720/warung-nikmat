import 'package:flutter/material.dart';
import '/core.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: radiusPrimary,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: radiusPrimary,
            child: Image.network(
              "http://sman1kalitidu.sch.id/storage/sman1kalitidu.sch.id/editor/cNsm93uuyvvEjipYc6gzkDcsMCNaTN4QnzrZ0M6v.jpeg",
              width: 70.0,
              height: 70.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 14.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "12 Desember 2022",
                style: TextStyle(
                  fontSize: 12.0,
                  color: secondaryColor,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(
                width: Get.width - 152.0,
                child: Text(
                  "Bupati menghimbau untuk seluruh instansi Pemkab Jember benar-benar peduli dengan sumber daya yang ada diantaranya dengan cara mematikan",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: medium,
                    color: darkColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
