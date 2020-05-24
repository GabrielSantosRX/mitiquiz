import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final List<QuizCard> _quizCards = [
    QuizCard(title: 'Grecia Antiga', subtitle: 'Athena, Zeus, Hades, ...', filename: 'greek'),
    QuizCard(title: 'Egito Antigo', subtitle: 'Isis, Osiris, Horus, ...', filename: 'egypt'),
    // QuizCard(title: 'Roma Antiga', subtitle: 'Anubis', filename: 'egypt'),
    // QuizCard(title: 'Africana', subtitle: 'Anubis', filename: 'egypt'),
    // QuizCard(title: 'Nordica', subtitle: 'Anubis', filename: 'egypt'),
  ];

  void changeBackground(int index, CarouselPageChangedReason reason) {
    _currentIndex = index;
    print('-- ${_quizCards[index].filename}');
  }

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    );

    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/${_quizCards[_currentIndex].filename}.png',
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // ListTile(
            //   leading: Text(
            //     'text asdf',
            //     style: TextStyle(fontSize: 16.0),
            //   ),
            //   title: Text('Login'),
            //   subtitle: Text('adsf'),
            //   trailing: Icon(Icons.arrow_back_ios),
            // ),
            const SizedBox(height: 1),
            const SizedBox(height: 1),
            CarouselSlider(
              options: CarouselOptions(
                height: 123,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                onPageChanged: changeBackground,
              ),
              items: _quizCards
                  .map((currentCard) => Builder(
                        builder: (BuildContext context) => Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(22, 22, 22, 22),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              )),
                          child: Center(
                            child: ListTile(
                              leading: Image.asset('assets/${currentCard.filename}_icon.png'),
                              title: Text(currentCard.title, style: TextStyle(color: Colors.white)),
                              subtitle:
                                  Text(currentCard.subtitle, style: TextStyle(color: Colors.white)),
                              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }
}

class QuizCard {
  final String title;
  final String subtitle;
  final String filename;

  QuizCard({
    this.title,
    this.subtitle,
    this.filename,
  });
}
