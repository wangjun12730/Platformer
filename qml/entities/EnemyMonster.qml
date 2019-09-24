import QtQuick 2.0
import Felgo 3.0

EnemyBase{
    id : monster
    variationType: "monster"

    enemy.sprite.source:"../../assets/monster/"+pictureNum%6+".png"

    collider.onLinearVelocityChanged: {
        // 停止移动，就像相反的方向移动
        if(linearVelocity.x === 0)
         monster.direction = monster.direction*-1            //1 or -1
        // 确保速度恒定
       linearVelocity.x = direction * speed
    }
    }
