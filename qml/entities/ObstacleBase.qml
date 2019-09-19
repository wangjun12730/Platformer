import QtQuick 2.0
import Felgo 3.0

TiledEntityBase{
    id:obstacleBase
    entityType: "obstacle"


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
