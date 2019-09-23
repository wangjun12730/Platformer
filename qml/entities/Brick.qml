import QtQuick 2.0
import Felgo 3.0

//Use this brick to control the enemy's flight.

TiledEntityBase{
    id:block
    entityType: "brick"
    Rectangle{
        visible: false
        anchors.fill:parent
    }

    BoxCollider{
        id:collider

        bodyType: Body.Static
        categories: Box.Category10//BRICK
        collidesWith: Box.Category3

    }
}
