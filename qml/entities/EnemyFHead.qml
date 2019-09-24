import QtQuick 2.0
import Felgo 3.0

EnemyBase{
    id : fhead
    variationType: "fhead"

     //Make the monster jump
    directionTimer.onTriggered:collider.linearVelocity.y = -320
    enemy.sprite.source:"../../assets/ironhead/ironhead.png"

    collider.onLinearVelocityChanged: {

    }



}
