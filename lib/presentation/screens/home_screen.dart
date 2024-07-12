import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    Map<String, String> monthsMap = {
      "1": "Janeiro",
      "2": "Fevereiro",
      "3": "Março",
      "4": "Abril",
      "5": "Maio",
      "6": "Junho",
      "7": "Julho",
      "8": "Agosto",
      "9": "Setembro",
      "10": "Outubro",
      "11": "Novembro",
      "12": "Dezembro"
    };

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "${now.day} ${monthsMap[now.month.toString()]}, ${now.year}\n", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const TextSpan(text: "5 imcompletas, 5 completas")
            ]
          ),
        )        
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Atividade Imcompletas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),),
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.check_box_outline_blank, size: 30, color: Colors.black45,)
                      ),
                      const SizedBox(width: 10,),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "Atividade Numero $index\n", style: const TextStyle(fontSize: 18, color: Colors.black87)),
                            const WidgetSpan(child: Icon(Icons.lock, size: 16,)),
                            const TextSpan(text: "  Bagulho doido cara", style: TextStyle(color: Colors.black45))
                          ]
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            const Text("Atividade Completas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),),
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Atividade $index"),
                    subtitle: const Text("Fazer depois....", style: TextStyle(color: Colors.black),),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/createtask");
        },
      ),
    );
  }
}