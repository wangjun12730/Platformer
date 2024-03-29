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
  property int score: 0//record scores
  property int bullet:0//record bullets


  signal menuBox //Used to send signal when setting is clicked
  signal backMainMenu //Used to return to the main menu

  EntityManager {
    id: entityManager
    entityContainer: gameScene

    }

//gameBackGroundMusic
  BackgroundMusic{
      id:gameBackgroundMusic
      autoPlay: false
      source: "../../assets/music/game.mp3"
  }
  function closemusic(){
      gameBackgroundMusic.stop()
  }
  function playmusic(){
     gameBackgroundMusic.play()
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

  //Record the score
  Text{
       id:scores
        z:10
        anchors.left:bullets.right
        y:0
        color: "white"
        font.family: p22H.name
        font.pixelSize: 30
        text:"Score:"+score
  }

  //Record the Scoresranking

  Text{
      id:bullets
      z:10
      x:0
      y:0
      color:"white"
      font.family: p22H.name
      font.pixelSize: 30
      text:"bullets:"+bullet+"  "
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

  property alias viewPort: viewPort
  // this is the moving item containing the level and player
  Item {
    id: viewPort
    height: 320
    width: 480
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
//    Level1 {
//      id: level
//    }

    Loader{
        id:level
//        source: "../levels/Level1.qml"
    }
    //used to load levels
    function openlevel(){
        level.source="../levels/Level1.qml"
    }
    //Used to reload levels
    function closelevel(){
        level.source=""
    }

//    property alias loader: loader.source
//    Loader{
//        id:loader
////        source: Level1
//    }

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
//      Rectangle {
//        anchors.fill: parent
//        color: "yellow"
//        opacity: 0.5
//      }
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
//      //Player's Attack Voice
//      SoundEffect {
//           id: clickSound
//           source: "../../assets/music/jump.mp3"
//           loops:1
//         }

    //The player fires and puts bullets
      Rectangle{
          id:a
          y:215;x:360

          width:32
          height: 20
          radius: 10
          opacity: 0.5
          color: "#e9e9e9"
          Text {
              anchors.centerIn: parent
              text: qsTr("O")
          }
          MouseArea{
              id:area
              anchors.fill:parent
              enabled: gameScene.bullet<=0?false:true

              onClicked: {

//                  clickSound.play()
                  var newEntityProperties = {

//                                      x:player.x > offsetBeforeScrollingStarts ?player.x/2+32:player.x+32,
                                        x:player.x>offsetBeforeScrollingStarts?(offsetBeforeScrollingStarts-player.width/2):player.x,
                                      y:player.y+16,
                                  }
                  console.log(player.x+"")
                   entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/Bullet.qml"),newEntityProperties)
                  bullet-=1
              }

              onPressed: {
                  a.opacity=0.3
              }

              onReleased: {
                  a.opacity = 0.5
              }
          }

      }
      //Player jump key
      Rectangle{
          id:jump
          y:215;x:402
          width:32
          height: 20
          radius: 10
          color: "#e9e9e9"
          opacity: 0.5
          Text {
              anchors.centerIn: parent
              text: qsTr("Jump")
          }
          MouseArea{
              anchors.fill:parent
              onPressed: {
                  player.jump()
                  jump.opacity=0.3
              }

              onReleased: {
                  jump.opacity = 0.5
              }
          }
      }


//  }

      // Load the fonts
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
               id:continue1
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
                   onPressed: continue1.opacity=0.5
                   onReleased: continue1.opacity=1
               }

           }


           Rectangle{
               id:bgMusic
               x:97
               width: 115;height: 30
               color:"green"
               opacity: 1
//               anchors.horizontalCenter: gameSetting.horizontalCenter
//               Text {
//                   id:text1
//                   anchors.centerIn: parent
//                   visible: false
//                   text: gameBackgroundMusic.playing?"on":"off"
//               }
               Text{
                   visible: true
                   anchors.centerIn: parent
                   text:"background music"
                   font.family: p22H.name
                   font.pixelSize: 20
                   color: "white"
               }
               MouseArea{
                   anchors.fill:parent
                   onClicked:{
                       if(gameBackgroundMusic.playing===true)
                        { closemusic()
                       }else playmusic()
                   }
                   onPressed: bgMusic.opacity=0.5
                   onReleased: bgMusic.opacity=1
               }

               MultiResolutionImage{
                   source: "../../assets/menu/menulist.png"
                   anchors.fill:parent
                   opacity: 0.5              }

           }
           Rectangle{
               id:gameMusic
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
               MouseArea{
                   anchors.fill:parent
//                   onClicked:{
//                       if(gameBackgroundMusic.playing===true)
//                        { closemusic()
//                       }else playmusic()
//                   }
                   onPressed: gameMusic.opacity=0.5
                   onReleased: gameMusic.opacity=1
               }
               MultiResolutionImage{
                   source: "../../assets/menu/menulist.png"
                   anchors.fill:parent
                   opacity: 0.5              }
           }
           Rectangle{
               id:back
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
                   onPressed: back.opacity=0.5
                   onReleased: back.opacity=1
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
                   viewPort.closelevel()
                   viewPort.openlevel()
               }
           }
           MenuButton{
               x:192
               text:"back to menu"
               buttonText.font.family: p22H.name
               onClicked:{
                   player.x=20
                   player.y=20
                   //Record score
                    model1.append("game"+1,gameScene.score);
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
   property alias playerDie: playerDie
   //An interface that pops up when a character dies
   Rectangle{
       id:playerDie
       opacity: visible? 1:0
       visible:false
       enabled: visible
       z:1000
       color: "#e9e9e9"
       anchors.fill: parent
       Item{
            width:parent.width
            height: 1/3*parent.width
            anchors.top:parent.top
            Rectangle{
                anchors.fill:parent
                MultiResolutionImage{
                    anchors.fill:parent
                    source: "../../assets/menu/gameOver.png"
                }
           }
       }
       Item{
           height: 0.5*parent.height
           width: parent.width
           anchors.bottom: parent.bottom
           Text {
               anchors.horizontalCenter: parent.horizontalCenter
               font.family: p22H.name
               font.pixelSize: 30
               text: qsTr("would you want play again?")
           }
           Row{
               anchors.horizontalCenter: parent.horizontalCenter
               y:50
               spacing: 10
                  Rectangle{
                    width: 32
                    height: 32
                    color:"#5151A2"
                    Text{
                        anchors.centerIn: parent
                        text:"again"
                    }
                    MouseArea{
                        anchors.fill:parent
                        onClicked:{
                            playerDie.visible=false
//                            viewPort.closelevel()
//                            reloadlevel.start()
                        }

                    }

                  }
                  Rectangle{
                      width: 32
                      height: 32
                      color: "#5151A2"
                      Text{
                          anchors.centerIn: parent
                          text:"back"
                      }
                      MouseArea{
                          anchors.fill: parent
                          onClicked: backMainMenu()
                      }
                  }
       }
   }
   }

   onMenuBox: {
       gameSetting.visible=true

   }

  // on desktops, you can move the player with the arrow keys, on mobiles we are using our custom inputs above to modify the controller axis values. With this approach, we only need one actual logic for the movement, always referring to the axis values of the controller
  Keys.forwardTo: controller
  TwoAxisController {
    id: controller
    inputActionsToKeyCode: {
                            "up": Qt.Key_W,
                           "down": Qt.Key_S,
                           "left": Qt.Key_A,
                           "right": Qt.Key_D,
                           "fire": Qt.Key_O
                   }
    onInputActionPressed: {
      console.debug("key pressed actionName " + actionName)
      if(actionName == "up") {
        player.jump()
      }
      if(actionName==="fire"){
          var newEntityProperties = {

//                                      x:player.x > offsetBeforeScrollingStarts ?player.x/2+32:player.x+32,
                                x:player.x>offsetBeforeScrollingStarts?(offsetBeforeScrollingStarts-player.width/2):player.x,
                              y:player.y+16,
                          }
          console.log(player.x+"")
           entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/Bullet.qml"),newEntityProperties)
          bullet-=1

      }
    }
  }
}

