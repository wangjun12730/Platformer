import QtQuick 2.0
import Felgo 3.0
import "../commond"
import QtQuick.Layouts 1.0
SceneBase{
    id:scoresranking
    signal backMainMenu//Used to return to the main menu
   Rectangle{
       anchors.fill:parent

       MultiResolutionImage{
           anchors.fill:parent
           source: "../../assets/menu/highscore.png"
       }
       ListView{
            id:view;
            width: parent.width-64-64;
            height: parent.height;
            x:32+32;
            y:32;
            model:model1.players;
            delegate:Rectangle {
                width:parent.width;
                height:32;
                color: "transparent";
                RowLayout{
                    Rectangle{
                        width: 100;
                        height: parent.height;
                        Text {
                            anchors.fill: parent;
                            text:name;
                            horizontalAlignment:Text.AlignVCenter;

                        }
                    }
                    Rectangle{
                        width: 100;
                        height: parent.height;
                        Text {
                            anchors.fill: parent;
                            text: grade;
                        }
                    }


                }

            }



            }

       }

   Item{
       z:100
      x:404;y:32
       width:32;height: 32
       MultiResolutionImage{
           anchors.fill:parent
           source:"../../assets/menu/back.png"

       }
       MouseArea{
           anchors.fill: parent
           onClicked: {
               backMainMenu()
               console.log("clicked")
           }
           onPressed:  parent.opacity = 0.5
           onReleased:{ parent.opacity = 1
                       console.log("released")
           }

       }

   }

}

