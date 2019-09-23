import QtQuick 2.0
import Felgo 3.0

EnemyBase{
    id : crystallo
    entityType: "enemy"
    variationType: "crystallo"
//    startX: x
//    startY: y

    //-1:怪物向左移动    1：向右
    property int direction: 1
    property int speed: 35
    property alias directionTimer: directionTimer
    Tile{
        id : enemy
        property alias enemy : enemy
        sprite.visible: !hidden
        sprite.source: alive ? "../../assets/crytallo/crystallo-left-"+pictureNum%3+".png"
                            : "../../assets/crytallo/shattered-left.png"
        sprite.mirror: collider.linearVelocity.x > 0 ? true : false
    }


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

      linearVelocity: Qt.point(direction * speed, 0)

      fixture.onBeginContact: {
          var otherEntity = other.getBody().target
          if(otherEntity.entityType === "player") reset()//Reset every time  touch a player
          //collider the bullet , died
          if(otherEntity.entityType==="bullet") {

              die()

          }
      }

      onLinearVelocityChanged: {
        // 停止移动，就像相反的方向移动
        if(linearVelocity.x === 0)
         crystallo.direction = crystallo.direction*-1            //1 or -1
        // 确保速度恒定
        linearVelocity.x = direction * speed    //35
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

    // reset the opponent
    function reset() {

//      x=startX
//      y=startY
      alive=true

    }

}
