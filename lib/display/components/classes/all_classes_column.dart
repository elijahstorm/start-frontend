import 'package:flutter/material.dart';
import 'package:start_frontend/display/components/classes/temp_class_content.dart';
import 'package:start_frontend/display/components/classes/classes_row.dart';

class AllClassesColumn extends StatelessWidget {
  const AllClassesColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ClassesRow(
            name: 'Top 10 Hits',
            classes: [
              ClassContent(
                image: 'assets/imports/classes/newjeans.png',
                title: 'Hype Boy',
                group: 'NewJeans',
                tags: [
                  'Advanced',
                  'Pop',
                ],
                timeLength: 23,
                likes: 321,
                ranking: 1,
              ),
              ClassContent(
                image: 'assets/imports/classes/lesserafim.png',
                title: 'ANTIFRAGILE',
                group: 'KE SSERAFIM',
                tags: [
                  'Advanced',
                  'Powerful',
                ],
                timeLength: 35,
                likes: 655,
                ranking: 2,
              ),
              ClassContent(
                image: 'assets/imports/classes/gidle.png',
                title: 'Nxde',
                group: 'G-IDLE',
                tags: [
                  'Advanced',
                  'Powerful',
                ],
                timeLength: 27,
                likes: 512,
                ranking: 3,
              ),
            ],
          ),
          ClassesRow(
            name: 'Popular Right Now',
            classes: [
              ClassContent(
                image: 'assets/imports/classes/ive.png',
                title: 'After Like',
                group: 'IVE',
                tags: [
                  'Intermediate',
                  'Pop',
                ],
                timeLength: 45,
                likes: 776,
                ranking: 1,
              ),
              ClassContent(
                image: 'assets/imports/classes/straykids.png',
                title: 'CASE 143',
                group: 'Stray Kids',
                tags: [
                  'Beginner',
                  'Hip-Hop',
                ],
                timeLength: 24,
                likes: 158,
                ranking: 2,
              ),
              ClassContent(
                image: 'assets/imports/classes/bts.png',
                title: 'Dynamite',
                group: 'BTS',
                tags: [
                  'Advanced',
                  'Powerful',
                ],
                timeLength: 27,
                likes: 542,
                ranking: 3,
              ),
            ],
          ),
          ClassesRow(
            name: 'Popular Choruses',
            shortClasses: true,
            classes: [
              ClassContent(
                image: 'assets/imports/classes/newjeans_tall.png',
                title: 'Hype Boy',
                group: 'NewJeans',
                tags: [
                  'New Age',
                  'R&B',
                ],
                timeLength: 15,
                likes: 512,
                ranking: 1,
                locked: true,
              ),
              ClassContent(
                image: 'assets/imports/classes/seventeen.png',
                title: 'Rock With You',
                group: 'SEVENTEEN',
                tags: [
                  'Fast Paced',
                  'Pop',
                ],
                timeLength: 15,
                likes: 651,
                ranking: 2,
              ),
              ClassContent(
                image: 'assets/imports/classes/txt.png',
                title: 'Good Boy',
                group: 'TXT',
                tags: [
                  'New Age',
                  'Pop',
                ],
                timeLength: 12,
                likes: 542,
                ranking: 3,
              ),
            ],
          ),
          ClassesRow(
            name: 'Girl-Group Dance',
            classes: [
              ClassContent(
                image: 'assets/imports/classes/blackpink.png',
                title: 'How You Like That',
                group: 'BlackPink',
                tags: [
                  'Beginner',
                  'Pop',
                ],
                timeLength: 23,
                likes: 512,
                ranking: 1,
              ),
              ClassContent(
                image: 'assets/imports/classes/newjeans2.png',
                title: 'Attention',
                group: 'NewJeans',
                tags: [
                  'Advanced',
                  'Pop',
                ],
                timeLength: 35,
                likes: 651,
                ranking: 2,
              ),
              ClassContent(
                image: 'assets/imports/classes/newjeans.png',
                title: 'Funky Glitter Christmas',
                group: 'MNIXX',
                tags: [
                  'Beginner',
                  'Cute',
                ],
                timeLength: 15,
                likes: 638,
                ranking: 3,
              ),
            ],
          ),
        ],
      );
}
