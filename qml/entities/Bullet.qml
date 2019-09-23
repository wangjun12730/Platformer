import QtQuick 2.0
import Felgo 3.0

//bullet
TiledEntityBase{
    id:bullet
    entityType: "bullet"
    z:100
    Tile{
        image: "../../assets/paopao/paopao.png"
    }

    BoxCollider{
        id:collider
        bodyType: Body.Dynamic
        categories: Box.Category10
        collidesWith:Box.Category3
//        force: Qt.point(0,200)
        collisionTestingOnlyMode: true
        fixture.onBeginContact: {
            bullet.visible=false
            collider.active=false
            console.log("nihao")
        }
    }
//    Timer{
//        id:directionTimer
//        interval: 1000
//        running: true
//        repeat: true
//        onTriggered: {
//            collider.linearVelocity.x=40
//            console.log(bullet.x)
//            collider.linearVelocity.y=-60
//        }
//    }
    NumberAnimation{
        id:animateBX
        target: bullet
        properties: "x"
        from:x
        to:player.x+480
        duration:9000
        running: true
    }
}

