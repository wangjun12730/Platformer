import QtQuick 2.0
import Felgo 3.0
import "../scenes"

TiledEntityBase{
    id : coin
    entityType: "coin"
    property  int coins: 0
    property bool collected: false
    Tile{

        //金币还没有被收集，显示false
        property alias sprite: sprite
        visible: !coin.collected
        image: "../../assets/Coin/coin.png"
    }

    BoxCollider {
        id: collider
        anchors.fill: sprite
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
