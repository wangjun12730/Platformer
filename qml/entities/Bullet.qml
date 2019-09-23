import QtQuick 2.0
import Felgo 3.0

TiledEntityBase{
    id:bullet
    entityType: "bullet"

    Rectangle {
               id: mask
               width: 0.3*parent.width
               height: 0.3*parent.height
               radius: height/2
               color:"red"
               visible: true

           }

    BoxCollider{
        id:collider
        anchors.fill:mask
        bodyType: Body.Dynamic
        categories: Box.Category10
        collidesWith: Box.Category1 |Box.Category2 |Box.Category1
//        force: Qt.point(0,200)
        collisionTestingOnlyMode: true
        fixture.onBeginContact: console.log("nihao")
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
        from:20
        to:180
        duration:9000
        running: true
    }
}

