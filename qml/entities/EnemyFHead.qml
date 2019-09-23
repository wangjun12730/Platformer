import QtQuick 2.0
import Felgo 3.0

EnemyBase{
    id : fhead
    entityType: "enemy"
    variationType: "fhead"

//    startX: row*gameScene.gridSize
//    startY: level.height - (column+1)*gameScene.gridSize

    //-1:怪物向左移动    1：向右
    property int direction: -1
    property int speed: 25
    property alias directionTimer: directionTimer
    property alias collider: collider
    Tile{
        id : enemy
        property alias enemy : enemy
        sprite.visible: !hidden
        sprite.source: "../../assets/ironhead/ironhead.png"
//        sprite.mirror: true

    }
//    Timer{
//       id:mirror
//       interval:100
//       repeat: false
//       onTriggered: {
//                console.log("mirror")
//               if(collider.linearVelocity.x<0) enemy.sprite.mirror=true
//               if(collider.linearVelocity.x>0) enemy.sprite.mirror=false
//       }
//     }


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
      //
      collidesWith: Box.Category1 | Box.Category2 | Box.Category5

      linearVelocity: Qt.point(0, direction * speed)

      fixture.onBeginContact: {
          var otherEntity = other.getBody().target
          if(otherEntity.entityType === "player") reset()//Reset every time  touch a player
          //collider the bullet , died
          if(otherEntity.entityType==="bullet") {

              die()

          }
      }

//      onLinearVelocityChanged: {
//        // 停止移动，就像相反的方向移动
//        if(linearVelocity.x === 0)
//         crystallo.direction = crystallo.direction*-1            //1 or -1
//        // 确保速度恒定
//        linearVelocity.x = direction * speed    //35
//      }
    }
    Component.onCompleted: {
        startX=x
        startY=y
    }


   //zhuan fang xiang ji shi qi
    Timer{
        id:directionTimer
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            collider.linearVelocity.y = -320
//             collider.linearVelocity.x=40
//            mirror.start()
        }
    }

    // reset the opponent
    function reset() {
        x=startX
        y=startY
        alive=true
    }

}
