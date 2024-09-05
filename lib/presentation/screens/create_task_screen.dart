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
  String lastSubTask = "";

  Map<String, String> textsInputs = {};

  List<TextEditingController> textControllers = [];

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
                  textControllers.add(TextEditingController());
                  textControllers[0].text = value;
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
                  controller: textControllers[index],
                  autofocus: true,
                  onChanged: (value) {
                    lastSubTask = value;
                  },
                  onFieldSubmitted: (value) {
                    lastSubTask = "";
                    if (index >= 0) {
                      tempValue = "";
                    }
                    if (value.isNotEmpty) {
                      textsInputs[index.toString()] = value;
                      setState(() {
                        subTasksCount+=1;
                        textControllers.add(TextEditingController());
                      });
                    }
                  },
                  //maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "",
                    prefixIcon: const Icon(Icons.check_box_outline_blank, size: 24,),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red,),
                      onPressed: () {
                        setState(() {
                          textsInputs.remove(index.toString());
                          textControllers.removeAt(index);
                          subTasksCount--;
                        });
                      },
                    ),
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
          setState(() {
            int lastKey = textsInputs.length+1;
            textsInputs[lastKey.toString()] = lastSubTask;
            textControllers.add(TextEditingController());
            //TODO: CREATE A FUNC TO SAVE WHEN USER CLICK IN OK
          });
        },
        child: const Text("OK"),
      ),
    );
  }
}