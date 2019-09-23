 import Felgo 3.0
 import QtQuick 2.0
 import "../commond"

 SceneBase {
   id:menuScene

   signal startPressed
   signal selectPressed
   // background
     MultiResolutionImage{
         source: "../../assets/background/3.png"
         anchors.fill: parent.gameWindowAnchorItem
     }

     FontLoader{
         id:flubber
         source: "../../assets/font/flubber.ttf"
     }
     FontLoader{
         id:p22
         source: "../../assets/font/P22 Hopper Josephine.ttf"
     }

   // the "logo"
   Text {
     id:title
     y: 70
     x:400
     font.family: flubber.name
     font.pixelSize: 50
     color: "#e9e9e9"
     text: "Crazy charge"
   }

   //menu backgroundmusic
   BackgroundMusic{
       id:menuBackgroundMusic
       source: "../../assets/music/editMusic.mp3"
   }
   function closemusic(){
       menuBackgroundMusic.stop()
   }

   Text{
      id:content
      y:150
      x:400
      font.pixelSize: 30
      font.family:p22.name
      color: "white"
      text:"PRESS  START  BUTTON"
   }

   Row {
       id:button2
       spacing: 5
       y:200
//       anchors.horizontalCenter:  parent.horizontalCenter
       MenuButton {
         text: "score"
         onClicked: selectPressed()
       }
       MenuButton {
         text: "start"
         onClicked: startPressed()
       }
     }

    NumberAnimation{
       id:animateTX
       target: title
       properties: "x"
       from:535
       to:100
       duration:9000
       running: true


   }
    NumberAnimation{
       id:animateCX
       target: content
       properties: "x"
       from:555
       to:120
       duration:9000
       running: true


   }
    NumberAnimation{
       id:animateBX
       target: button2
       properties: "x"
       from:615
       to:180
       duration:9000
       running: true


   }
 }
