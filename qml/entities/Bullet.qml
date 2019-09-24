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
        active: visible
//        force: Qt.point(0,200)
        collisionTestingOnlyMode: true
        fixture.onBeginContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType === "enemy"){
                bullet.visible=false
                collider.active=false
                console.log("monster die")
            }
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
        from:bullet.x
        to:bullet.x+10000;
        duration:49000
        running: true
    }


}

