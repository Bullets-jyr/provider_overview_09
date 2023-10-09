import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider 09',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class Foo with ChangeNotifier {
  String value = 'Foo';

  void changeValue() {
    value = value == 'Foo' ? 'Bar' : 'Foo';
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider 09'),
      ),
      body: ChangeNotifierProvider<Foo>(
        create: (_) => Foo(),
        // builder: (BuildContext context, Widget? _) {
        //   return Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text(
        //           '${context.watch<Foo>().value}',
        //           style: TextStyle(fontSize: 40),
        //         ),
        //         SizedBox(
        //           height: 20.0,
        //         ),
        //         ElevatedButton(
        //           onPressed: () => context.read<Foo>().changeValue(),
        //           child: Text(
        //             'Change Value',
        //             style: TextStyle(fontSize: 20.0),
        //           ),
        //         ),
        //       ],
        //     ),
        //   );
        // }
        // Consumer를 사용해서 builder 패턴을 사용한 것과 동일한 결과를 가져온 것으로 이해해도 됩니다.
        // ProviderNotFoundException가 발생했을 때, 3가지 옵션을 가집니다.
        // 1. 가능하다면 위젯트리상에서 더 위로 올린다.
        // 2. builder를 사용한다.
        // 3. Consumer를 사용한다.
        // 이 중에서 상황에 맞는 옵션을 사용하면 됩니다.
        child: Consumer<Foo>(
            builder: (BuildContext context, Foo foo, Widget? _) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${foo.value}',
                      style: TextStyle(fontSize: 40),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () => foo.changeValue(),
                      child: Text(
                        'Change Value',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              );
          },
        ),
      ),
    );
  }
}
