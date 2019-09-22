import QtQuick 2.0
import Felgo 3.0

TiledEntityBase{
    id:diamond
    entityType: "diamond"
    property bool collected: false
    property int  pictureNum: 1

    visible: !collected

    Tile{
        visible: !collected
        image:"../../assets/bullet/magic.png"
    }
    BoxCollider{
        id:collider
        bodyType: Body.Static
        categories: Box.Category6
        collidesWith: Box.Category1

        active: parent.visible
        fixture.onBeginContact:collected=true
    }
    // reset diamond
    function reset() {
        coin.collected = false
    }
}
