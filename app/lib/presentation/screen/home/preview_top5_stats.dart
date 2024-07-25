// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:app/data/adapters/translation.dart';
import 'package:app/presentation/utils/app_colors.dart';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final faker = Faker();

class Top5Players extends StatefulWidget {
  Top5Players({Key? key}) : super(key: key);

  @override
  _Top5PlayersState createState() => _Top5PlayersState();
}

class _Top5PlayersState extends State<Top5Players> {
  String toBeTranslated = 'Os 5 melhores jogadores!';
  String oldText ='';

  int randomXp = faker.randomGenerator.integer(20, min: 1);

  List<Map<String, dynamic>> ranking = [
    {'name': 'Lilly James', 'xp': 13541},
    {'name': 'Mike Santiago', 'xp': 11520},
    {'name': 'Rodney Holmes', 'xp': 10548},
    {'name': 'Nicholas Russell', 'xp': 9862},
    {'name': 'Devin Lane', 'xp': 8421},
    // Adicione mais participantes conforme necessário
  ];

  List<Color> itemColors = List.filled(10, AppColors.lightNeutralColor);

  double titleRankingSize = 16;
  double starSize = 22;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      _fetchUpdatedRanking();
    });
  }

    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _translateHintText();
  }

  Future<void> _translateHintText() async {
    final languageCode = Provider.of<LanguageProvider>(context).languageCode;
    final translationService = TranslationService();
    final newText = await translationService.translateText(toBeTranslated, languageCode);
    if (mounted) {
      setState(() {
        oldText = newText;
      });
    }
  }  


  Future<void> _fetchUpdatedRanking() async {
    // Simulação de requisição HTTP
    await Future.delayed(
        Duration(seconds: 2)); // Simula o tempo de resposta da requisição

    // Aqui você trataria a resposta da requisição e atualizaria a lista de ranking
    List<Map<String, dynamic>> updatedRanking = [
      {
        'name': faker.person.name(),
        'xp': 15000 + faker.randomGenerator.integer(20, min: 1)
      },
      {
        'name': 'Lilly James',
        'xp': 13541 + faker.randomGenerator.integer(20, min: 1)
      },
      {
        'name': 'Mike Santiago',
        'xp': 11520 + faker.randomGenerator.integer(1000, min: 1)
      },
      {
        'name': faker.person.name(),
        'xp': 8421 + faker.randomGenerator.integer(200, min: 1)
      },
      {
        'name': 'Mary Gardner',
        'xp': 7562 + faker.randomGenerator.integer(10000, min: 50)
      },
      // Atualize conforme necessário
    ];

    setState(() {
      for (int i = 0; i < 3; i++) {
        if (ranking[i]['name'] != updatedRanking[i]['name']) {
          itemColors[i] = Colors.yellow;
          Timer(Duration(seconds: 1), () {
            setState(() {
              itemColors[i] = Theme.of(context).colorScheme.primary;
            });
          });
        }
      }

      ranking = updatedRanking;
      ranking.sort((a, b) => b['xp'].compareTo(a['xp']));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 420,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.transparent, Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.transparent,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              oldText,
              style: TextStyle(fontSize: titleRankingSize),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(height: 1, thickness: 1),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ranking.length,
              itemBuilder: (context, index) {
                final item = ranking[index];
                return ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: itemColors[index],
                    size: 24,
                  ),
                  title: Text(
                    item['name'],
                  ),
                  subtitle: Text(
                    '${item['xp']} XP',
                  ),
                  trailing: index == 0
                      ? Icon(Icons.star, size: starSize)
                      : index < 3
                          ? Icon(Icons.star_border, size: starSize)
                          : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
