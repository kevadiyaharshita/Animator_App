import 'package:animator_app/helper/json_helper.dart';
import 'package:animator_app/modals/planetmodal.dart';
import 'package:flutter/material.dart';

class PlanetHomePage extends StatefulWidget {
  const PlanetHomePage({super.key});

  @override
  State<PlanetHomePage> createState() => _PlanetHomePageState();
}

class _PlanetHomePageState extends State<PlanetHomePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://i.pinimg.com/564x/e2/15/9d/e2159ddc554a0f0b9aa64ed16346311c.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: FutureBuilder(
            future: JsonHelper.jsonhelper.getPlanetData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    PlanetModal pm = snapshot.data![index];
                    return Card(
                      child: ListTile(
                        title: Text('${pm.name}'),
                      ),
                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
