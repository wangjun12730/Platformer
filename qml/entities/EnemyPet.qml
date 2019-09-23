import QtQuick 2.0
import Felgo 3.0

EnemyBase{
    id : pet
    variationType: "pet"
    directionTimer.interval: 2500
    enemy.sprite.source:"../../assets/bighead/bigheadlive.png"

    collider.onLinearVelocityChanged: {
        // 停止移动，就像相反的方向移动
        if(linearVelocity.x === 0)
         pet.direction =pet.direction*-1            //1 or -1
        // 确保速度恒定
       linearVelocity.x = direction * speed    //35
    }
    Component.onCompleted: {
        startX=x
        startY=y
    }


    // reset the opponent
    function reset() {
        x=startX
        y=startY
        direction=1
        alive=true
    }

}
