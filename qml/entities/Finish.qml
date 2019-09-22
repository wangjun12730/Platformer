import QtQuick 2.0
import Felgo 3.0

TiledEntityBase{
    id:finish
    entityType: "finish"

    Row{
        id:tileRow
        Repeater{
            model: size
            Tile{
                image: "../../assets/finish/finish.png"
            }
         }
      }
    //Detects if there is a collision with the player
    BoxCollider{
        id:collider
        anchors.fill:parent
        bodyType: Body.Static
        categories: Box.Category8
        collidesWith: Box.Category1
        fixture.onBeginContact: {
          var otherEntity = other.getBody().target
          if(otherEntity.entityType === "player") player.contacts++
          finishView.visible=true
        }
        fixture.onEndContact: {
          var otherEntity = other.getBody().target
          if(otherEntity.entityType === "player") player.contacts--
        }

    }
}
