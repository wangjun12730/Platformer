import QtQuick 2.0
import Felgo 3.0

TiledEntityBase{
    id:obstacleBase
    entityType: "enemy"


    Tile{

        image:"../../assets/obstacle/6.png"
    }

    BoxCollider {
//      anchors.fill: parent
        width:16
        height: 16
        anchors.centerIn: parent
        active: parent.visible
      bodyType: Body.Static
      categories: Box.Category4
      collidesWith: Box.Category1|Box.Category2 | Box.Category3 |Box.Category5
      fixture.onBeginContact: {
        var otherEntity = other.getBody().target
        if(otherEntity.entityType === "player") parent.visible=false
      }
      fixture.onEndContact: {
        var otherEntity = other.getBody().target
        if(otherEntity.entityType === "player") player.contacts--
      }
    }
}
