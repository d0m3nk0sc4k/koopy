import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koopy/main.dart';
import 'package:http/http.dart' as http;

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();

    Future getFamilies() async {
      return await http.get(
          Uri.parse(
              baseUrl + "user/families/" + storage.read("userID").toString()),
          headers: {
            'Authorization': "Bearer " + storage.read("token")
          }).then((value) {
        var data = json.decode(value.body);
        return data;
      });
    }

    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Family",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(Get.context!).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    'Izberi družino',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                FutureBuilder(
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      if (snapshot.hasData) {
                                        var data = snapshot.data as Map;
                                        List<Widget> widgets = [];
                                        if (data.isEmpty) {
                                          widgets.add(Text("Nisi član nobene družine."));
                                        }

                                        for (String key in data.keys.toList()) {
                                          widgets.add(Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 16.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  data[key]["name"],
                                                  style: TextStyle(
                                                    color:
                                                        Theme.of(Get.context!)
                                                            .colorScheme
                                                            .primary,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  data[key]["address"],
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ));
                                        }

                                        return LimitedBox(
                                          maxHeight: MediaQuery.of(Get.context!)
                                                  .size
                                                  .height /
                                              3,
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: widgets,
                                          ),
                                        );
                                      }
                                    }

                                    return Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(50),
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  },
                                  future: getFamilies(),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        "Koščak",
                        style: TextStyle(
                          fontSize: 26,
                          color:
                              Theme.of(Get.context!).colorScheme.onBackground,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FaIcon(
                        FontAwesomeIcons.caretDown,
                        color: Theme.of(Get.context!).colorScheme.primary,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
              baseUrl + "image/" + storage.read("profile_img"),
            ),
          ),
        ],
      ),
    );
  }
}
