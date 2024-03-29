import QtQuick 2.0
import Felgo 3.0

TiledEntityBase {
  id: platform
  entityType: "platform"

  size: 2 // must be >= 2 and even (2,4,6,...), because we got a sprite for the start, one for the end and 2 center sprites that are only repeatable if both are used

  property alias collider: collider
  Row {
    id: tileRow

        Repeater{
            model:size
            Tile{
                image:"../../assets/platform/platform1.png"
            }
        }

  }

  BoxCollider {
    id: collider
    anchors.fill:parent
    bodyType: Body.Static

    categories: Box.Category2
    collidesWith: Box.Category1 | Box.Category3
    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") {
        console.debug("contact platform begin")

        // increase the number of active contacts the player has
        player.contacts++
      }
    }

    fixture.onEndContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") {
        console.debug("contact platform end")

        // if the player leaves a platform, we decrease its number of active contacts
        player.contacts--
      }
    }
  }
}
