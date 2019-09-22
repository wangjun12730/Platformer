import QtQuick 2.0
import Felgo 3.0
import "../commond"

SceneBase{
    id:scoresranking

   signal backMainMenu//Used to return to the main menu

   Rectangle{
       anchors.fill:parent

       MultiResolutionImage{
           anchors.fill:parent
           source: "../../assets/menu/highscore.png"
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

