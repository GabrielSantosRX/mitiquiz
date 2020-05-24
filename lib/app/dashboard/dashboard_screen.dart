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
  int _nextIndex = 0;
  bool _backgroundVisible = true;

  final List<QuizCard> _quizCards = [
    QuizCard(title: 'Egito Antigo', subtitle: 'Isis, Osiris, Horus, ...', filename: 'egypt'),
    QuizCard(title: 'Grecia Antiga', subtitle: 'Athena, Zeus, Hades, ...', filename: 'greek'),
    QuizCard(title: 'Roma Antiga', subtitle: 'Minerva, Jupiter, Marte, ...', filename: 'rome'),
    QuizCard(title: 'Nordica', subtitle: 'Frigga, Odin, Thor, ...', filename: 'nordic'),
    // QuizCard(title: 'Africana', subtitle: 'Anubis', filename: 'egypt'),
  ];

  void changeBackground(int index, CarouselPageChangedReason reason) {
    if (index != _currentIndex) {
      setState(() {
        _backgroundVisible = false;
        _nextIndex = index;
      });
    }
  }

  void onEndBackgroundEffect() {
    setState(() {
      _backgroundVisible = true;
      _currentIndex = _nextIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    );

    return Stack(
      children: <Widget>[
        AnimatedOpacity(
          opacity: _backgroundVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 369),
          onEnd: onEndBackgroundEffect,
          child: Image.asset(
            'assets/${_quizCards[_currentIndex].filename}.png',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
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
