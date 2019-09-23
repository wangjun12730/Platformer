import QtQuick 2.0
import Felgo 3.0

TiledEntityBase{
    id:water
    entityType: "water"

    Row {
      id: tileRow

          Repeater{
              model:size
              Tile{
                  image:"../../assets/water/water1.png"
              }
          }

    }

    BoxCollider{
        id:collider
        bodyType: Body.Static

        categories: Box.Category3
        collidesWith: Box.Category1
        collisionTestingOnlyMode: true
    }
}
