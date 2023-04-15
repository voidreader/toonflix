import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'package:toonflix/screens/main_screen.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currencyCard.dart';

class Player {
  String? name; // 값을 가질 수도 있고, 안가질수도 있다. null safety.
  // Player(this.name);
  Player({this.name});
}

void main() {
  // ApiService().getTodaysToons();
  // runApp(const Pomo()); // 앱의 시작점. (Root)
  runApp(const ToonFlix());
}

class ToonFlix extends StatelessWidget {
  const ToonFlix({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

//////////////

// * 포모도로 앱 만들기 2023.04.13
class Pomo extends StatelessWidget {
  const Pomo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // ignore: deprecated_member_use
        backgroundColor: const Color(0xFFE7626C),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
            fontSize: 20,
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: const HomeScreen(),
    );
  }
}

// * Stateful 예제 만들어보기
class NewApp extends StatefulWidget {
  const NewApp({super.key});

  @override
  State<NewApp> createState() => _NewAppState();
}

class _NewAppState extends State<NewApp> {
  int counter = 0;
  List<int> numbers = [];

  void onClickCounter() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xfff4eddb),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              MyLargeTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    // 강제 아님.
    // 한번만 실행되며, build 보다 먼저 실행된다.
    super.initState();
  }

  @override
  void dispose() {
    // 위젯이 스크린에서 제거(Hide)될때 한번만 호출
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}

// 3개의 코어 위젯 중에 하나를 상속받아야한다.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // root 위젯은 둘 중에 하나를 리턴해야 한다.
    // cupertino, material 애플과 구글의 디자인 속성
    // 구글꺼라서 material 앱 스타일이 좋다(?)...

    // scaffold 규칙이 필요하다. (화면의 구조)
    // named parameter를 쓰고 있다!
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFF181818),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Hey, Selena',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Welcome back',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '\$5 194 482',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Button(
                          text: 'Transfer',
                          bgColor: Color(0xFFF1B33B),
                          textColor: Colors.black),
                      Button(
                          text: 'Request',
                          bgColor: Color(0xFF1f2123),
                          textColor: Colors.white),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Wallets',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CurrencyCard(
                    name: 'Euro',
                    code: 'EUR',
                    amount: '6 428',
                    icon: Icons.euro_rounded,
                    isInverted: false,
                  ),
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: const CurrencyCard(
                      name: 'BitCoin',
                      code: 'BTC',
                      amount: '9 785',
                      icon: Icons.currency_bitcoin,
                      isInverted: true,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -40),
                    child: const CurrencyCard(
                      name: 'Dollar',
                      code: 'USD',
                      amount: '228',
                      icon: Icons.attach_money,
                      isInverted: false,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
