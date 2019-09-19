 import Felgo 3.0
 import QtQuick 2.0
 import "../commond"

 SceneBase {
   id:menuScene

   signal startPressed
   signal selectPressed
   // background
     MultiResolutionImage{
         source: "../../assets/background/1.png"
         anchors.fill: parent.gameWindowAnchorItem
     }

   // the "logo"
   Text {
     id:title
     y: 30
     x:400
     font.pixelSize: 30
     color: "#e9e9e9"
     text: "MultiSceneMultiLevel"
   }

   Text{
      id:content
      y:150
      x:400
      font.pixelSize: 20
      color: "white"
      text:"PRESS  START  BUTTON"
   }

   Row {
       id:button2
       spacing: 5
       y:200
//       anchors.horizontalCenter:  parent.horizontalCenter
       MenuButton {
         text: "select"
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
       from:480
       to:115
       duration:10000
       running: true
       easing: {type:Easing.OutBack}

   }
    NumberAnimation{
       id:animateCX
       target: content
       properties: "x"
       from:515
       to:150
       duration:10000
       running: true
       easing: {type:Easing.OutBack}

   }
    NumberAnimation{
       id:animateBX
       target: button2
       properties: "x"
       from:545
       to:180
       duration:10000
       running: true
       easing: {type:Easing.OutBack}

   }
 }
