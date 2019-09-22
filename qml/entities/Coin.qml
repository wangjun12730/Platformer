import QtQuick 2.0
import Felgo 3.0
import "../scenes"

TiledEntityBase{
    id : coin
    entityType: "coin"
    property  int coins: 0
    property bool collected: false
    property int  pictureNum: 1
    Tile{

        anchors.centerIn: parent
        //金币还没有被收集，显示false
        width:0.5*gameScene.gridSize
        height: 0.5*gameScene.gridSize
        visible: !coin.collected
        image: "../../assets/Coin/coin"+pictureNum%4+".png"
    }

    BoxCollider {
        id: collider
        anchors.horizontalCenter: parent.horizontalCenter
        width: 16
        height: 16
        //金币被收集后，不能在进行收集
        active: !collected
        //这个碰撞是静止的，只进行碰撞检测即可
        bodyType: Body.Static
        collisionTestingOnlyMode: true
        // Category6: 金币
        categories: Box.Category6
        // Category1: 玩家
        collidesWith: Box.Category1
        fixture.onBeginContact: collect()

    }
    //Toggle the image to make it look like the enemy is in motion
    Timer {
      id: switchPictureTimer
      interval: 300
      running: true
      repeat: true

      onTriggered: {
          //console.debug("pictureNum = "+pictureNum)
          pictureNum++
      }
    }

    // set collected to true
    function collect() {
        console.debug("collect coin")
        coin.coins++
        coin.collected = true
    }

    // reset coin
    function reset() {
        coin.collected = false
    }
}
