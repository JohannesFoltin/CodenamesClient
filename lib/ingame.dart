import 'package:codenames_client/Controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:provider/provider.dart';
import 'package:codenames_client/Models/datalayer.dart' as myCard;
import 'package:flutter/services.dart';

class Ingame extends StatefulWidget {
  const Ingame({Key? key}) : super(key: key);

  @override
  State<Ingame> createState() => _IngameState();
}

class _IngameState extends State<Ingame> {
  myCard.Card? selectable;

  void selectCard(myCard.Card card) {
    selectable?.selected = false;
    card.selected = true;
    selectable = card;
  }

  Color colorSelector(myCard.Card card) {
    switch (card.Owner) {
      case "Blue":
        return Colors.blue.shade900;
      case "Red":
        return Colors.red.shade900;
      case "Grey":
        return Colors.grey;
      case "Black":
        return Colors.black;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
      ]);
    var gameCon = Provider.of<Controller>(context).game;
    var provider = Provider.of<Controller>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.spielerName),
        centerTitle: true,
        backgroundColor: (provider.spielerRole == "AgentB") ||
                (provider.spielerRole == "GCB")
            ? Colors.blue.shade900
            : Colors.red.shade900,
        leadingWidth: 300,
        leading: Center(
          child: Text(
            gameCon.WinCase == ""?
              gameCon.CurrentTeam == true ? "Blau ist dran" : "Rot ist dran":"${gameCon.WinCase} hat gewonnen. Grund: ${gameCon.WinReason}"),
        ),
        actions: [
          isGeheimdienstChef(provider)
              ? const SizedBox.shrink()
              : TextButton(
                  onPressed: () => {
                    Provider.of<Controller>(context, listen: false)
                        .sendCardSelection(myCard.Card("Pass", "", false))
                  },
                  child: Text(provider.cardSelectedFrom("Pass") != ""
                      ? "Pass!"
                      : "Pass"),
                )
        ],
      ),
      body:LayoutGrid(
              columnSizes: [1.fr, 1.fr, 1.fr, 1.fr, 1.fr],
              rowSizes: [1.fr, 1.fr, 1.fr, 1.fr, 1.fr],
              children: List.generate(gameCon.Cards.length, (index) {
                myCard.Card card = gameCon.Cards[index];
                if (card.selected == false) {
                  return isGeheimdienstChef(provider) && card.Coverd == false
                  ? const SizedBox.shrink()
                  :GestureDetector(
                        onTap: () => {
                          setState(() {
                            if ((provider.spielerRole == "AgentR") ||
                                (provider.spielerRole == "AgentB")) {
                              if (((gameCon.CurrentTeam == true) &&
                                      (provider.spielerRole == "AgentB")) ||
                                  ((gameCon.CurrentTeam == false) &&
                                      (provider.spielerRole == "AgentR"))) {
                                if (card.Coverd == true) {
                                  selectCard(card);
                                }
                              } else {
                                //ToDo
                              }
                            }
                          })
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: card.Coverd == false || (isGeheimdienstChef(provider))
                              ? colorSelector(card)
                              : Colors.white,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    provider.cardSelectedFrom(card.Word) != ""
                                        ? "Is selected From: ${provider.cardSelectedFrom(card.Word)}"
                                        : "",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  card.Word,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: (card.Owner == "Black" &&
                                              card.Coverd == false) || (isGeheimdienstChef(provider)&&card.Owner == "Black")
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                } else {
                  return Card(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red),
                                      onPressed: () => {
                                            setState(() {
                                              card.selected = false;
                                            })
                                          },
                                      child: const Icon(Icons.close)),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                      height: double.infinity,
                                      child: ElevatedButton(
                                          onPressed: () => {
                                                  Provider.of<Controller>(
                                                          context,
                                                          listen: false)
                                                      .sendCardSelection(card),
                                                  card.selected = false,
                                                
                                              },
                                          child: const Icon(Icons.check))))
                            ],
                          ),
                        ),
                      );
                }
              }),
            ),
    );
  }

  bool isGeheimdienstChef(Controller provider) => provider.spielerRole == "GCB"|| provider.spielerRole == "GCR";
}
