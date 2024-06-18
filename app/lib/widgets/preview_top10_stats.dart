import 'dart:async';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

final faker = Faker();

class Top10Players extends StatefulWidget {
  Top10Players({Key? key}) : super(key: key);

  @override
  _Top10PlayersState createState() => _Top10PlayersState();
}

class _Top10PlayersState extends State<Top10Players> {




  int randomXp = faker.randomGenerator.integer(20, min: 1);

  
  
  List<Map<String, dynamic>> ranking = [
    {'name': 'Lilly James', 'xp': 13541},
    {'name': 'Mike Santiago', 'xp': 11520},
    {'name': 'Rodney Holmes', 'xp': 10548},
    {'name': 'Nicholas Russell', 'xp': 9862},
    {'name': 'Devin Lane', 'xp': 8421},
    {'name': 'Mary Gardner', 'xp': 7562},
    // Adicione mais participantes conforme necessário
  ];

  List<Color> itemColors = List.filled(10, Colors.white);

  double titleRankingSize = 18;
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

  Future<void> _fetchUpdatedRanking() async {
    // Simulação de requisição HTTP
    await Future.delayed(Duration(seconds: 2)); // Simula o tempo de resposta da requisição

    // Aqui você trataria a resposta da requisição e atualizaria a lista de ranking
    List<Map<String, dynamic>> updatedRanking = [
      {'name': faker.person.name(), 'xp': 15000 + faker.randomGenerator.integer(20, min: 1)},
      {'name': 'Lilly James', 'xp': 13541 + faker.randomGenerator.integer(20, min: 1)},
      {'name': 'Mike Santiago', 'xp': 11520 + faker.randomGenerator.integer(1000, min: 1)},
      {'name': faker.person.name(), 'xp': 10548 + faker.randomGenerator.integer(100, min: 1)},
      {'name': 'Nicholas Russell', 'xp': 9862 + faker.randomGenerator.integer(5000, min: 1)},
      {'name': faker.person.name(), 'xp': 8421 + faker.randomGenerator.integer(200, min: 1)},
      {'name': 'Mary Gardner', 'xp': 7562 + faker.randomGenerator.integer(10000, min: 50)},
      // Atualize conforme necessário
    ];

    setState(() {
      for (int i = 0; i < 3; i++) {
        if (ranking[i]['name'] != updatedRanking[i]['name']) {
          itemColors[i] = Colors.yellow;
          Timer(Duration(seconds: 1), () {
            setState(() {
              itemColors[i] = Colors.white;
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
      height: 520,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black87, Colors.grey.shade800],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
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
              'Top 10',
              style: TextStyle(color: Colors.white, fontSize: titleRankingSize),
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
                  leading:  Icon(
                    Icons.account_circle,
                    color: itemColors[index],
                    size: 24,
                  ),
                  title: Text(
                    item['name'],
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '${item['xp']} XP',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: index == 0
                      ? Icon(Icons.star, color: Colors.limeAccent, size: starSize)
                      : index < 3
                          ? Icon(Icons.star_border, color: Colors.grey, size: starSize)
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
