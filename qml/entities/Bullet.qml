import QtQuick 2.0
import Felgo 3.0

TiledEntityBase{
    id:bullet
    entityType: "bullet"

    Rectangle {
               id: mask
               width: parent.width
               height: parent.height
               radius: height/2
               color:"red"
               visible: true

           }

    BoxCollider{
        id:collider
        bodyType: Body.Static
    }
}

