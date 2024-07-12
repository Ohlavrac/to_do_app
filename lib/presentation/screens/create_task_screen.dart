import 'package:flutter/material.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _controller = TextEditingController();

  bool enableSubTaks = false;
  int subTasksCount = 0;
  String title = "";
  String tempValue = "";

  Map<String, String> textsInputs = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova Tarefa", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _controller,
            onFieldSubmitted: (value) {
              if (enableSubTaks == false && value.isNotEmpty) {
                if (value.isNotEmpty) {
                  tempValue = value;
                  _controller.clear();
                }
                setState(() {
                  enableSubTaks = true;
                  subTasksCount+=1;
                });
              }
            },
            onChanged: (value) {
              title = value;
            },
            maxLines: 1,
            decoration: InputDecoration(
              hintText: enableSubTaks ? "Titulo" : "Aperte ENTER para criar sub-tarefas",
              prefixIcon: enableSubTaks ? const SizedBox(height: 0,) : const Icon(Icons.check_box_outline_blank, size: 24,),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: subTasksCount,
              itemBuilder: (context, index) {
                return TextFormField(
                  initialValue: tempValue.isEmpty ? "" : tempValue,
                  autofocus: true,
                  onFieldSubmitted: (value) {
                    if (index >= 0) {
                      tempValue = "";
                    }
                    if (value.isNotEmpty) {
                      textsInputs[index.toString()] = value;
                      setState(() {
                        subTasksCount+=1;
                      });
                    }
                  },
                  //maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "",
                    prefixIcon: const Icon(Icons.check_box_outline_blank, size: 24,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none),
                  ),
                ); 
              }
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(enableSubTaks);
          print(subTasksCount);
          print(textsInputs);
        },
        child: const Text("OK"),
      ),
    );
  }
}