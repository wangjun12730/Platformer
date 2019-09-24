import QtQuick 2.0
import Felgo 3.0

EnemyBase{
    id : snail
    variationType: "snail"

    enemy.sprite.source:"../../assets/snail/"+pictureNum%4+".png"

    collider.onLinearVelocityChanged: {
        // 停止移动，就像相反的方向移动
        if(linearVelocity.x === 0)
         snail.direction = snail.direction*-1            //1 or -1
        // 确保速度恒定
        linearVelocity.x = direction * speed
    }


}
