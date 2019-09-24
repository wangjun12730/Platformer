import QtQuick 2.0
import Felgo 3.0

EnemyBase{
    id : crystallo
    variationType: "crystallo"
    speed: 35
    enemy.sprite.source:"../../assets/crytallo/crystallo-left-"+pictureNum%3+".png"
    // reset the opponent

    collider.onLinearVelocityChanged: {
        // 停止移动，就像相反的方向移动
        if(linearVelocity.x === 0)
         crystallo.direction = crystallo.direction*-1            //1 or -1
        // 确保速度恒定
       linearVelocity.x = direction * speed
    }


}
