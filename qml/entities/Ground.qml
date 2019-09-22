import QtQuick 2.0
import Felgo 3.0

TiledEntityBase {
  id: ground
  entityType: "ground"




  Row {
    id: tileRow
    Repeater{
        model:size
        Tile{
            image:"../../assets/ground/ground2.png"
        }
    }
  }

  BoxCollider {
    anchors.fill: parent
    bodyType: Body.Static
    categories: Box.Category2
    collidesWith: Box.Category1 | Box.Category3
    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") player.contacts++
    }
    fixture.onEndContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") player.contacts--
    }
  }
}
