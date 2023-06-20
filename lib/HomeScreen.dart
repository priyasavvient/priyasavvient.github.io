/*
import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({Key? key}) : super(key: key);

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Message")));
        },
            child: const Text("Show BottomSheet")),
      ),
    );
  }

}

*/

import 'package:flutter/material.dart';

import 'model/data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  static List<ItemList> details = [
    ItemList(
        images:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPRm-12Z60fbUZMO6fKSAQbXXMlV1D3veQiw&usqp=CAU",
        movies: "Pathan",
        movieDate: '25 January 2023'),
    ItemList(
        images:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPRm-12Z60fbUZMO6fKSAQbXXMlV1D3veQiw&usqp=CAU",
        movies: "Pushpa",
        movieDate: '17 December 2021'),
    ItemList(
        images:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPRm-12Z60fbUZMO6fKSAQbXXMlV1D3veQiw&usqp=CAU",
        movies: "Badhai Ho",
        movieDate: '18 October 2018'),
    ItemList(
        images:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPRm-12Z60fbUZMO6fKSAQbXXMlV1D3veQiw&usqp=CAU",
        movies: "Circus",
        movieDate: '23 December 2022'),
    ItemList(
        images:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPRm-12Z60fbUZMO6fKSAQbXXMlV1D3veQiw&usqp=CAU",
        movies: "Hera Feri",
        movieDate: '31 March 2000'),
    ItemList(
        images:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPRm-12Z60fbUZMO6fKSAQbXXMlV1D3veQiw&usqp=CAU",
        movies: "Hungama2",
        movieDate: '23 July 2021'),
  ];

  List<ItemList> displayList = List.from(details);

  void updateList(String value) {
    setState(() {
      displayList = details
          .where((element) =>
              element.movies.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  bool order = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "ListView Demo",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            updateList(value);
                          },
                          controller: _searchController,
                          style: const TextStyle(
                              fontFamily: 'Roboto-Thin',
                              fontSize: 20,
                              color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black26,
                              hintText: "Search here",
                              hintStyle: const TextStyle(color: Colors.grey),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 28,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  updateList("");
                                  _searchController.clear();
                                },
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.black,
                                  size: 28,
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _filterSheet(context);
                        },
                        tooltip: "Filter",
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: const Icon(
                          Icons.menu,
                          size: 24,
                        ),
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    reverse: order,
                    itemCount: displayList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.amber.shade50,
                                Colors.blue,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: const [0.0, 1.0],
                              //tileMode: TileMode.clamp),
                            ),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(displayList[index].images)),
                            title: Text(
                              displayList[index].movies,
                              style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              displayList[index].movieDate,
                              style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: const Text("10:22"),
                          ),
                        ),
                      );
                    }),
              )
            ]),
      ),
    );
  }

  void _filterSheet(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text(
                    "Accending Order",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    setState(() {
                      displayList.sort((a, b) => a.movies.compareTo(b.movies));
                      displayList;
                      Navigator.pop(context);
                    });
                  }),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text(
                  "Descending Order",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  setState(() {
                    displayList.sort((a, b) => b.movies.compareTo(a.movies));
                    displayList;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }
}
