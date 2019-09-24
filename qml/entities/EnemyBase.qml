import QtQuick 2.0
import Felgo 3.0

TiledEntityBase {
     entityType: "enemy"

    property int startX
    property int startY

    property int pictureNum: 1

    //Determine if the monster is alive
    property bool alive: true
    //Whether to hide monsters
    property bool hidden: false
    z: 1

    //-1:怪物向左移动    1：向右
    property int direction: 1
    property int speed: 25

    //Aliases are used to change properties that have been set
    property alias directionTimer: directionTimer
    property alias enemy: enemy
    property alias collider:collider
    property alias linearVelocity: collider.linearVelocity

    // main collider
    BoxCollider {
      id: collider
      bodyType: Body.Dynamic

      // when dead
      //当dead的时候   为false
      active: !alive ? false : true
      anchors.fill:parent
      //移动的怪物
      categories: Box.Category3
      //1为玩家  2为地面
      // Category1: 玩家, Category2: 地面
      // Category5: 玩家脚下的那部分区域
      //Category10: Brick
      collidesWith: Box.Category1 | Box.Category2 | Box.Category5 |Box.Category10

      linearVelocity: Qt.point(direction * speed, 0)

      fixture.onBeginContact: {
          var otherEntity = other.getBody().target
          //collider the bullet , died
          if(otherEntity.entityType==="bullet") {
              gameScene.score+=200

              die()

          }
      }

    }

    //picture
    Tile{
        id : enemy
        property alias enemy : enemy
        sprite.visible: !hidden
        sprite.mirror: collider.linearVelocity.x > 0 ? true : false
    }

//    // this timer hides the opponent a few seconds after its death
//    Timer {
//      id: hideTimer
//      interval: 10

//      onTriggered: hidden = true
//    }
    //Use the timer loop map to make the monster look like it's moving
    Timer {
      id: switchPictureTimer
      interval: 300
      running: true
      repeat: true

      onTriggered: {
         // console.debug("pictureNum = "+pictureNum)
          pictureNum++
      }
    }
    //zhuan fang xiang ji shi qi
     Timer{
         id:directionTimer
         interval: 2000
         running: true
         repeat: true
         onTriggered: {
             collider.linearVelocity.x=0
         }
     }

    function die() {
      directionTimer.stop()
      alive = false
      hidden=true
//      hideTimer.start()
    }

}
