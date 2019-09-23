import QtQuick 2.0
import Felgo 3.0

EnemyBase{
    id : iceBlock
    variationType: "iceBlock"

    enemy.sprite.source:"../../assets/iceblock/left-"+pictureNum%3+".png"

    collider.onLinearVelocityChanged: {
        // 停止移动，就像相反的方向移动
        if(linearVelocity.x === 0)
         iceBlock.direction = iceBlock.direction*-1            //1 or -1
        // 确保速度恒定
        linearVelocity.x = direction * speed    //35
    }
     // reset the opponent
    function reset() {
//        x=startX
//        y=startY
        alive=true
    }

}
