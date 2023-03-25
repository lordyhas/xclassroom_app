
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:unhorizons/logic/values.dart';


class AdmissionScreen extends StatefulWidget {
  static const routeName = "admission_page";
  static const routeUrl = "admission";
  const AdmissionScreen({Key? key}) : super(key: key);

  @override
  State<AdmissionScreen> createState() => _AdmissionScreenState();
}

class _AdmissionScreenState extends State<AdmissionScreen> {
  bool isAlready = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black12,
        leading: BooleanBuilder(
          condition: () => Responsive.of(context).isPhone,
          ifTrue: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black,),
            onPressed: () {
              if(Scaffold.of(context).isDrawerOpen){
                Scaffold.of(context).closeDrawer();
              }else{
                Scaffold.of(context).openDrawer();
              }
            },
          ),
          ifFalse: const SizedBox.shrink(
            child: Icon(Icons.h_mobiledata, color: Colors.black87,),
          ),
        ),
        title: const Text(AppConstant.organisation,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade300.withOpacity(0.8),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            constraints: const BoxConstraints(maxWidth: kMedium2Dimens),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 32.0,),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [
                      ListTile(
                        title: Text("Bienvenue sur Espace Etudiant",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            //fontWeight: FontWeight.w700,
                            fontSize: 32,
                          ),
                        ),
                        subtitle: Text("Votre environnement numérique d’études",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32.0,),
                Card(
                  margin: const EdgeInsets.all(8.0),
                  child: BooleanBuilder(
                    condition: () => Responsive.of(context).isPhone,
                    ifTrue:  SizedBox(
                      child: Column(
                        children: [
                          const ListTile(
                            //horizontalTitleGap: 24.0,
                            minVerticalPadding: 16.0,

                            //minLeadingWidth: 24,
                            /*leading: Icon(
                              FontAwesomeIcons.graduationCap,
                              size: 32,
                            ),*/
                            title: Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Text("Admission",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              "L'admission est la première étape de votre parcours "
                                  "à l'${AppConstant.organisation}.",

                            ),

                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              onPressed: (){},
                              child:  Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12.0),
                                child: Text( isAlready
                                    ? "Suivre ma demande d'admission"
                                    : "Faire ma demande d'admission"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ifFalse: ListTile(
                      //horizontalTitleGap: 24.0,
                      minVerticalPadding: 16.0,

                      //minLeadingWidth: 24,
                      leading: const Icon(
                        FontAwesomeIcons.graduationCap,
                        size: 32,
                      ),
                      title: const Padding(
                        padding: EdgeInsets.only(bottom: 12.0),
                        child: Text("Admission",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      subtitle: const Text(
                        "L'admission est la première étape de votre parcours "
                            "à l'${AppConstant.organisation}.",

                      ),
                      trailing: ElevatedButton(
                        onPressed: (){},
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text( isAlready
                              ? "Suivre ma demande d'admission"
                              : "Faire ma demande d'admission"),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32.0,),
                Container(
                  child: Column(
                    children: [
                      const SizedBox(height: 16.0,),
                      const SizedBox(
                        width: 500,
                        child: SelectableText(
                          "Les différents services et informations de "
                            "${AppConstant.name}, tels que vos listes de cours, "
                            "vos travaux à venir et les messages importants, "
                            "vous seront rendus accessibles en fonction de "
                            "votre programme d’études.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 32.0,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          height: 400,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              "assets/images/col-4.jpg",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32.0,),
                      Wrap(
                        spacing: 12.0,
                        runSpacing: 12.0,
                        children: [
                          Card(
                            child: SizedBox(
                              width: 300,
                              height: 220,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const ListTile(
                                      //minVerticalPadding: 0.0,
                                      contentPadding: EdgeInsets.all(0.0),
                                      title: SelectableText(
                                        "Conditions d'admission",
                                        style: TextStyle(fontWeight: FontWeight.w700,),
                                      ),
                                      subtitle: SelectableText(
                                        "Basée avant tout sur l’excellence scolaire, "
                                            "l’admission à un programme requiert aussi "
                                            "un diplôme minimal pour formation visée "
                                            "et une maîtrise suffisante du français.",
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.chevron_right,
                                          color: Colors.blue,
                                        ),
                                        TextButton(
                                            onPressed: (){},
                                            child: const Text("En savoir plus"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: SizedBox(
                              width: 300,
                              height: 220,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const ListTile(
                                      //minVerticalPadding: 0.0,
                                      contentPadding: EdgeInsets.all(0.0),
                                      title: SelectableText(
                                        "Décision de l’${AppConstant.organisation}",
                                        style: TextStyle(fontWeight: FontWeight.w700,),
                                      ),
                                      subtitle: SelectableText("Le Service charger d'admission communique la "
                                          "décision officielle de l'${AppConstant.organisation} "
                                          "pour chacun des choix de programme par voie "
                                          "électronique.",
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.chevron_right,
                                          color: Colors.blue,
                                        ),
                                        TextButton(
                                          onPressed: (){},
                                          child: const Text("En savoir plus"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Card(
                            child: SizedBox(
                              width: 300,
                              height: 220,

                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const ListTile(
                                      //minVerticalPadding: 0.0,
                                      contentPadding: EdgeInsets.all(0.0),
                                      title: SelectableText(
                                        "Les activité estudiantine ",
                                        style: TextStyle(fontWeight: FontWeight.w700,),
                                      ),
                                      subtitle: SelectableText("La vie étudiante à l’${AppConstant.organisation} se "
                                          "décline en une multitude d’activités pour "
                                          " tous les goûts.",
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.chevron_right,
                                          color: Colors.blue,
                                        ),
                                        TextButton(
                                          onPressed: (){},
                                          child: const Text("En savoir plus"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),


                          Card(
                            child: SizedBox(
                              width: 300,
                              height: 220,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const ListTile(
                                      //minVerticalPadding: 0.0,
                                      contentPadding: EdgeInsets.all(0.0),
                                      title: SelectableText(
                                        "Conditions d'admission",
                                        style: TextStyle(fontWeight: FontWeight.w700,),
                                      ),
                                      subtitle: SelectableText(
                                        "Basée avant tout sur l’excellence scolaire, "
                                            "l’admission à un programme requiert aussi "
                                            "un diplôme minimal pour formation visée "
                                            "et une maîtrise suffisante du français.",
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.chevron_right,
                                          color: Colors.blue,
                                        ),
                                        TextButton(
                                          onPressed: (){},
                                          child: const Text("En savoir plus"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: SizedBox(
                              width: 300,
                              height: 220,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const ListTile(
                                      //minVerticalPadding: 0.0,
                                      contentPadding: EdgeInsets.all(0.0),
                                      title: SelectableText(
                                        "Décision de l’${AppConstant.organisation}",
                                        style: TextStyle(fontWeight: FontWeight.w700,),
                                      ),
                                      subtitle: SelectableText("Le Service charger d'admission communique la "
                                          "décision officielle de l'${AppConstant.organisation} "
                                          "pour chacun des choix de programme par voie "
                                          "électronique.",
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.chevron_right,
                                          color: Colors.blue,
                                        ),
                                        TextButton(
                                          onPressed: (){},
                                          child: const Text("En savoir plus"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Card(
                            child: SizedBox(
                              width: 300,
                              height: 220,

                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const ListTile(
                                      //minVerticalPadding: 0.0,
                                      contentPadding: EdgeInsets.all(0.0),
                                      title: SelectableText(
                                        "Les activité estudiantine ",
                                        style: TextStyle(fontWeight: FontWeight.w700,),
                                      ),
                                      subtitle: SelectableText  ("La vie étudiante à l’${AppConstant.organisation} se "
                                          "décline en une multitude d’activités pour "
                                          " tous les goûts.",
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.chevron_right,
                                          color: Colors.blue,
                                        ),
                                        TextButton(
                                          onPressed: (){},
                                          child: const Text("En savoir plus"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 42.0,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
