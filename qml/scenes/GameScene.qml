import Felgo 3.0
import QtQuick 2.0
import "../entities"
import "../levels"
import "../commond"

SceneBase{
  id: gameScene
  // the "logical size" - the scene content is auto-scaled to match the GameWindow size
  width: 480
  height: 320
  gridSize: 32

  property alias finishView: finishView //Used to invoke the game interface
  property int offsetBeforeScrollingStarts: 240


  signal menuBox //Used to send signal when setting is clicked
  signal backMainMenu //Used to return to the main menu

  EntityManager {
    id: entityManager
  }

  // the whole screen is filled with an incredibly beautiful blue ...
  Rectangle {
    anchors.fill: gameScene.gameWindowAnchorItem
    color: "#74d6f7"
  }

  //The Settings button in the upper right corner of the game interface
  Rectangle{
      id:setting
      z:100
      width:32;height: 32
      anchors.right:gameScene.right

      MultiResolutionImage{
          anchors.fill:parent
          source: "../../assets/menu/menu_sound.png"
      }
      MouseArea{
          anchors.fill:parent
          onClicked: {
              menuBox()
          }
          onPressed: setting.opacity=0.5

      }
  }

  // background
  ParallaxScrollingBackground {
    sourceImage: "../../assets/background/2.png"
    anchors.bottom: gameScene.gameWindowAnchorItem.bottom
    anchors.horizontalCenter: gameScene.gameWindowAnchorItem.horizontalCenter
    // we move the parallax layers at the same speed as the player
    movementVelocity: player.x > offsetBeforeScrollingStarts ? Qt.point(-player.horizontalVelocity,0) : Qt.point(0,0)
    // the speed then gets multiplied by this ratio to create the parallax effect
    ratio: Qt.point(0.3,0)
  }
//  ParallaxScrollingBackground {
//    sourceImage: "../../assets/background/layer1.png"
//    anchors.bottom: gameScene.gameWindowAnchorItem.bottom
//    anchors.horizontalCenter: gameScene.gameWindowAnchorItem.horizontalCenter
//    movementVelocity: player.x > offsetBeforeScrollingStarts ? Qt.point(-player.horizontalVelocity,0) : Qt.point(0,0)
//    ratio: Qt.point(0.6,0)
//  }

  // this is the moving item containing the level and player
  Item {
    id: viewPort
    height: level.height
    width: level.width
    anchors.bottom: gameScene.gameWindowAnchorItem.bottom
    x: player.x > offsetBeforeScrollingStarts ? offsetBeforeScrollingStarts-player.x : 0

    PhysicsWorld {
      id: physicsWorld
      gravity: Qt.point(0, 25)
//      debugDrawVisible: true // enable this for physics debugging
      z: 1000
      updatesPerSecondForPhysics : 60
      onPreSolve: {
        //this is called before the Box2DWorld handles contact events
        var entityA = contact.fixtureA.getBody().target
        var entityB = contact.fixtureB.getBody().target
        if(entityB.entityType === "platform" && entityA.entityType === "player" &&
            entityA.y + entityA.height > entityB.y) {
          //by setting enabled to false, they can be filtered out completely
          //-> disable cloud platform collisions when the player is below the platform
          contact.enabled = false
        }
      }
    }

    // you could load your levels Dynamically with a Loader component here
    Level1 {
      id: level
    }

    Player {
      id: player
      x: 20
      y: 100
    }

    ResetSensor {
      width: player.width
      height: 10
      x: player.x
      anchors.bottom: viewPort.bottom
      // if the player collides with the reset sensor, he goes back to the start
      onContact: {
        player.x = 20
        player.y = 100
      }
      // this is just for you to see how the sensor moves, in your real game, you should position it lower, outside of the visible area
      Rectangle {
        anchors.fill: parent
        color: "yellow"
        opacity: 0.5
      }
    }
  }

//  Rectangle {
//    // you should hide those input controls on desktops, not only because they are really ugly in this demo, but because you can move the player with the arrow keys there
//    //visible: !system.desktopPlatform
//    //enabled: visible
//    anchors.right: parent.right
//    anchors.bottom: parent.bottom
//    height: 50
//    width: 150
//    color: "blue"
//    opacity: 0.4

//    Rectangle {
//      anchors.centerIn: parent
//      width: 1
//      height: parent.height
//      color: "white"
//    }
//    MultiPointTouchArea {
//      anchors.fill: parent
//      onPressed: {
//        if(touchPoints[0].x < width/2)
//          controller.xAxis = -1
//        else
//          controller.xAxis = 1
//      }
//      onUpdated: {
//        if(touchPoints[0].x < width/2)
//          controller.xAxis = -1
//        else
//          controller.xAxis = 1
//      }
//      onReleased: controller.xAxis = 0
//    }
//  }

//  Rectangle {
//    // same as the above input control
//    //visible: !system.desktopPlatform
//    //enabled: visible
//    anchors.left: parent.left
//    anchors.bottom: parent.bottom
//    height: 100
//    width: 100
//    color: "green"
//    opacity: 0.4

//    Text {
//      anchors.centerIn: parent
//      text: "jump"
//      color: "white"
//      font.pixelSize: 9
//    }
//    MouseArea {
//      anchors.fill: parent
//      onPressed: player.jump()
//    }
//  }

//  Rectangle{
//      height:100
//      width: 100
//      x:20;y:170
//      opacity: 0.4


  //Setting interface keyboard
      Rectangle{
        id:top
        height: 33
        width: 33
        opacity: 0.4
        anchors.left: center.left
        anchors.bottom: center.top
        MouseArea {
          anchors.fill: parent
          onPressed:{
              top.opacity=0.2
              player.jump()
          }
          onReleased: top.opacity=0.4
        }
        MultiResolutionImage{
            anchors.fill:parent
            source: "../../assets/control/controltop.png"
        }

      }
      Rectangle{
        id:left
        height: 33
        width: 33
        opacity: 0.4
        anchors.top:center.top
        anchors.right:center.left

        MultiPointTouchArea {
          anchors.fill: parent
          onPressed: {
            if(touchPoints[0].x)
              controller.xAxis = -1
            left.opacity=0.2

          }
          onUpdated: {
            if(touchPoints[0].x)
              controller.xAxis = -1
          }
          onReleased:{
              controller.xAxis = 0
              left.opacity=0.4
          }
        }
        MultiResolutionImage{
            anchors.fill:parent
            source: "../../assets/control/controlleft.png"
        }

      }
      Rectangle{
          id:center
          y:203;x:53
          height: 33
          width: 33
          opacity: 0.4
          MultiResolutionImage{
              anchors.fill:parent
              source: "../../assets/control/controlcenter.png"
          }

      }
      Rectangle{
          id:right
          height:33;width: 33
          opacity: 0.4
          anchors.left:center.right
          anchors.top: center.top
          MultiPointTouchArea {
            anchors.fill: parent
            onPressed: {
              if(touchPoints[0].x)
                controller.xAxis = 1
              right.opacity=0.2
            }
            onUpdated: {
              if(touchPoints[0].x)
                controller.xAxis = 1
            }
            onReleased: {
                right.opacity=0.4
                controller.xAxis = 0
            }
          }
          MultiResolutionImage{
              anchors.fill:parent
              source: "../../assets/control/controlright.png"
          }

      }
      Rectangle{
            id:bottom
            height: 33
            width: 33
            opacity: 0.4
            anchors.top: center.bottom
            anchors.left: center.left
            MultiResolutionImage{
                anchors.fill:parent
                source: "../../assets/control/controlbuttom.png"
            }
            MouseArea{
                anchors.fill:parent
                onPressed: {
                    bottom.opacity=0.2
                    console.log("clicked  opacity is "+bottom.opacity)
                }

                onReleased: {
                    bottom.opacity = 0.4
                    console.log("released"+bottom.opacity)
                }
            }

      }
//  }
      FontLoader{
          id:p22H
          source: "../../assets/font/P22 Hopper Josephine.ttf"
      }

    //Game Settings menu bar
   Rectangle{
       id:gameSetting
       anchors.horizontalCenter: gameScene.horizontalCenter
       width: 300
       height: 200
       visible: false
       enabled: visible
       color: "#74d6f7"
       MultiResolutionImage{
           source: "../../assets/menu/scoreBoard.png"
           anchors.fill:parent
       }

       Column{
           spacing: 10
            y:30
           Rectangle{
                x:97;y:20
                width: 115;height: 30
//                anchors.horizontalCenter: gameSetting.horizontalCenter
                color:"green"
               Text{
                 anchors.centerIn: parent
                 font.family: p22H.name
                 text:" continue"
                 font.pixelSize: 20
                 color: "white"
               }
               MultiResolutionImage{
                   source: "../../assets/menu/menulist.png"
                   anchors.fill:parent
                   opacity: 0.5            }

               MouseArea{
                   anchors.fill:parent
                   onClicked: {
                       gameSetting.visible=false
                       setting.opacity=1 //Set the opacity to 1 for setting
                   }
               }

           }
           Rectangle{
               x:97
               width: 115;height: 30
               color:"green"
//               anchors.horizontalCenter: gameSetting.horizontalCenter
               Text{
                   anchors.centerIn: parent
                   text:"background music"
                   font.family: p22H.name
                   font.pixelSize: 20
                   color: "white"
               }
               MultiResolutionImage{
                   source: "../../assets/menu/menulist.png"
                   anchors.fill:parent
                   opacity: 0.5              }

           }
           Rectangle{
               x:97
               width: 115;height: 30
               color:"green"
//               anchors.horizontalCenter: gameSetting.horizontalCenter
               Text{
                   anchors.centerIn: parent
                   text:"game music"
                   font.family: p22H.name
                   font.pixelSize: 20
                   color: "white"
               }
               MultiResolutionImage{
                   source: "../../assets/menu/menulist.png"
                   anchors.fill:parent
                   opacity: 0.5              }
           }
           Rectangle{
               x:97
               width: 115;height: 30
               color:"green"
//               anchors.horizontalCenter: parent.horizontalCenter
               Text{
                   anchors.centerIn: parent
                   font.family: p22H.name
                   font.pixelSize: 20
                   text:"Back to main menu"
                   color: "white"
               }
               MultiResolutionImage{
                   source: "../../assets/menu/menulist.png"
                   anchors.fill:parent
                   opacity: 0.5             }
               MouseArea{
                   anchors.fill:parent
                   onClicked:{
                       gameSetting.visible=false
                       backMainMenu()
                       setting.opacity=1 //Set the opacity to 1 for setting
                   }
               }
           }
       }
   }
   //The interface that pops up after the game is finished
   Rectangle{
       id:finishView
       anchors.fill:parent
       opacity: visible? 1:0
       visible: false
       enabled: visible

       MultiResolutionImage{
           anchors.fill: parent
           source: "../../assets/menu/win.png"
       }
       Column{
           spacing: 10
             y:180
           MenuButton{

               x:200
               text:"play again"
               buttonText.font.family: p22H.name
               onClicked:{
                    player.x=20
                   player.y=20
                   finishView.visible=false
               }
           }
           MenuButton{
               x:192
               text:"back to menu"
               buttonText.font.family: p22H.name
               onClicked:{
                   player.x=20
                   player.y=20
                  finishView.visible=false
                   backMainMenu()
               }
           }
        }
//       Timer{
//           interval:100
//           repeat: true
//           running: true

//           onTriggered: {
//               parent.visible=true
//           }
//       }

   }

   //An interface that pops up when a character dies
//   Rectangle{
//       id:playerDie
//       opacity: visible? 1:0
//       visible: true
//       enabled: visible
//       z:1000
//       color: "#e9e9e9"
//       anchors.fill: parent
//       Item{
//            width:parent.width
//            height: 1/3*parent.width
//            anchors.top:parent.top
//            Rectangle{
//                anchors.fill:parent
//                MultiResolutionImage{
//                    anchors.fill:parent
//                    source: "../../assets/menu/gameOver.png"
//                }
//           }
//       }
//       Item{
//           height: 0.5*parent.height
//           width: parent.width
//           anchors.bottom: parent.bottom
//           Rectangle{
//               anchors.fill:parent
//               color: "blue"
//           }
//       }
//   }

   onMenuBox: {
       gameSetting.visible=true

   }

  // on desktops, you can move the player with the arrow keys, on mobiles we are using our custom inputs above to modify the controller axis values. With this approach, we only need one actual logic for the movement, always referring to the axis values of the controller
  Keys.forwardTo: controller
  TwoAxisController {
    id: controller
    onInputActionPressed: {
      console.debug("key pressed actionName " + actionName)
      if(actionName == "up") {
        player.jump()
      }
    }
  }
}

