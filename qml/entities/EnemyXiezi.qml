import QtQuick 2.0
import Felgo 3.0

EnemyBase{
    id : xiezi
    variationType: "xiezi"

    //When the scorpion's horizontal distance from the player is less than 320, the scorpion starts to move to the left
    directionTimer.onTriggered: {
         if(xiezi.x-player.x<320) collider.linearVelocity.x=-30
    }
    directionTimer.interval: 100

    direction: -1//-1 left
    enemy.sprite.source:"../../assets/xiezi/"+pictureNum%6+".png"

    collider.onLinearVelocityChanged: {
    }



}
