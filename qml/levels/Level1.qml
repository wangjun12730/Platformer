import Felgo 3.0
import QtQuick 2.0
import "../entities"
import "." as Levels

Levels.LevelBase {
  id: level
  // we need to specify the width to get correct debug draw for our physics
  // the PhysicsWorld component fills it's parent by default, which is the viewPort Item of the gameScene and this item uses the size of the level
  // NOTE: thy physics will also work without defining the width here, so no worries, you can ignore it untill you want to do some physics debugging
  width: 192* gameScene.gridSize // 42 because our last tile is a size 30 Ground at row 12



  // you could draw your level on a graph paper and then add the tiles here only by defining their row, column and size
 function reset(){

 }
  Ground {
    row: 0
    column: 0
    size: 6
  }
  Water{
      row: 6
      column: 0
      size: 2
  }

  Ground {
    row: 8
    column: 0
    size: 2
  }
  Water{
      row: 10
      column: 0
      size: 2
  }

  Platform {
    row: 3
    column: 3
    size: 3
  }
  Magic{
      row:3
      column: 4
      size:1
  }

//  ObstacleBase{
//      row:3
//      column:4
//      size:1
//  }

  EnemyCrystallo{
      row:7
      column: 7
      size:1
      directionTimer.interval: 3000
  }
  EnemyCrystallo{
      row:30
      column: 4
      size:1
  }

  EnemyPet{
      row:3
      column:4
      size:1
  }

  //金币
    Repeater{
        model: 6
        Coin{
            row: 17+index*1
            column: 4
            size: 1

        }
    }
  Platform {
    row: 7
    column: 6
    size: 4
  }
  EnemyFHead{
      row:12
      column: 4
      size:1
      directionTimer.interval: 6130
      directionTimer.onTriggered: collider.linearVelocity.y=-480
  }
  EnemyFHead{
      row:13
      column: 4
      size:1
      directionTimer.interval: 5582
      directionTimer.onTriggered: collider.linearVelocity.y=-480
  }


  Platform {
    row: 12
    column: 3
    size: 2
  }

//  EnemyPaopao{
//      row:50
//      column: 1
//      size:1
//  }
//  Bullet{
//      row:8
//      column: 1
//      size:1
//  }

  Ground {
    row: 12
    column: 0
    size: 5
  }
  Water{
      row: 17
      column: 0
      size: 8
  }
  Water{
      row: 29
      column: 0
      size: 5
  }
  Water{
      row: 59
      column: 0
      size: 83
  }

  Platform {
    row: 17
    column: 3
    size: 6
  }
  Brick{
      row:17
      column: 6
      size:6
  }
  EnemyDragon{
      row:17
      column: 7
      size:1
      directionTimer.interval: 4200
  }
  EnemyDragon{
      row:18
      column: 7
      size:1
       directionTimer.interval: 4200
  }
  EnemyDragon{
      row:19
      column: 7
      size:1
       directionTimer.interval: 4200
  }

  Ground{
      row:25
      column:0
      size:4
  }

  Platform{
      row:26
      column:6
      size:4
  }
  Platform{
      row:30
      column: 3
      size:3
  }
  Platform{
      row:33
      column:6
      size:4
  }

 Repeater{
     model: 4
     Coin{
         row: 33+index*1
         column: 7
         size: 1

     }

 }
  Ground{
      row:34
      column: 0
      size:25
  }
  EnemyXiezi{
      row:58
      column: 1
      size:1
  }

  Brick{
      row:52
      column:6
      size:7
  }
  EnemyDragon{
      row:52
      column: 7
      size:1
      directionTimer.interval: 5800
  }
  EnemyDragon{
      row:53
      column: 7
      size:1
      directionTimer.interval: 5800
  }
  EnemyDragon{
      row:54
      column: 7
      size:1
      directionTimer.interval: 5800
  }
  Diamond{
      row:53
      column: 6
      size:1
  }

  Platform{
      row:40
      column:6
      size:4
  }
  EnemyMonster{
      row:40
      column:7
      size:1
      directionTimer.interval: 4000
  }

  Platform{
      row:47
      column:3
      size:3
  }
  EnemyCrystallo{
      row:47
      column: 4
      size:1
      directionTimer.interval: 2500

  }

  Repeater{
      model: 3
      Coin{
          row: 47+index*1
          column: 7
          size: 1

      }

  }
  //diantiao
  Platform{
      row:61
      column: 3
      size:3
  }
  EnemySnail{
      row:61
      column: 4
      size:1
      directionTimer.interval: 3000
  }

  Platform{
      row:67
      column: 3
      size:3
  }
  Repeater{
      model: 3
      Coin{
          row: 67+index*1
          column: 4
          size: 1

      }

  }
  Platform{
      row:73
      column: 3
      size:3
  }
  EnemyMonster{
      row:73
      column: 4
      size:1
      directionTimer.interval: 3000
  }

  Platform{
      row:76
      column: 6
      size:3
  }
  Repeater{
      model: 3
      Coin{
          row: 76+index*1
          column: 7
          size: 1

      }

  }
  Platform{
      row:80
      column: 3
      size:3
  }
   EnemyPet{
       row:80
       column: 4
       size:1
       directionTimer.interval: 2500
   }

  Platform{
      row:85
      column: 6
      size:3
  }
  EnemyFHead{
      row:85
      column: 7
      size:1

  }
  EnemyFHead{
      row:86
      column: 7
      size:1
      directionTimer.interval: 2530
  }
  EnemyFHead{
      row:87
      column: 7
      size:1
      directionTimer.interval: 1620
  }
  Magic{
      row:89
      column:5
      size:1
  }

  Platform{
      row:89
      column: 8
      size:3
  }
  //金币
    Repeater{
        model: 3
        Coin{
            row: 89+index*1
            column: 9
            size: 1

        }
    }
  Platform{
      row:92
      column: 3
      size:3
  }
  EnemyIceBlock{
      row:92
      column:3
      size:1
      directionTimer.interval: 3000
  }

  Platform{
      row:95
      column: 6
      size:3
  }
  Platform{
      row:98
      column: 3
      size:3
  }
  Repeater{
      model: 3
      Coin{
          row: 98+index*1
          column: 4
          size: 1

      }

  }
  Platform{
      row:101
      column: 6
      size:3
  }
  EnemyIceBlock{
      row:101
      column: 7
      size:1
      directionTimer.interval: 2800
  }

  Platform{
      row:104
      column: 3
      size:3
  }
  Platform{
      row:107
      column: 8
      size: 3
  }
  Repeater{
      model: 3
      Coin{
          row: 107+index*1
          column: 9
          size: 1

      }

  }

  Platform{
      row:110
      column: 3
      size:3
  }
  EnemyPet{
      row:110
      column: 4
      size:1
      directionTimer.interval: 2500
  }

  Platform{
      row:113
      column: 6
      size:3
  }
  Platform{
      row:116
      column: 3
      size:3
  }
//  EnemyFHead{
//      row:116
//      column: 4
//      size:1
//      directionTimer.interval: 2100
//      directionTimer.onTriggered: {
//          collider.linearVelocity.y=-450
//      }
//  }
  Diamond{
      row:116
      column: 4
      size:1

  }

  EnemyFHead{
      row:117
      column: 4
      size:1
      directionTimer.interval: 3100
      directionTimer.onTriggered: {
          collider.linearVelocity.y=-500
      }
  }
//  EnemyFHead{
//      row:118
//      column: 8
//      size:1
//      directionTimer.interval: 1100
//  }

  Platform{
      row:119
      column: 6
      size:3
  }
  Repeater{
      model: 3
      Coin{
          row: 119+index*1
          column: 7
          size: 1

      }

  }
  Platform{
      row:122
      column: 3
      size:3
  }
  Platform{
      row:125
      column: 3
      size:3
  }
  EnemyMonster{
      row:122
      column: 4
      size:1
      directionTimer.interval: 5500
  }
  Repeater{
      model: 3
      Coin{
          row: 125+index*1
          column: 4
          size: 1

      }

  }

  Platform{
      row:125
      column: 6
      size:3
  }
  Brick{
      row:129
      column: 6
      size:12
  }
  EnemyDragon{
      row:129
      column: 7
      size:1
      directionTimer.interval: 12000
  }
  EnemyDragon{
      row:130
      column: 7
      size:1
      directionTimer.interval: 12000
  }
  EnemyDragon{
      row:131
      column: 7
      size:1
      directionTimer.interval: 12000
  }
  EnemyDragon{
      row:132
      column: 7
      size:1
      directionTimer.interval: 12000
  }

  Platform{
      row:131
      column: 3
      size:3
  }
  Diamond{
      row:135
      column: 8
      size:1
  }

  Platform{
      row:137
      column: 3
      size:3
  }
  Ground{
      row:142
      column: 6
      size:50
  }
  Repeater{
      model: 10
      Coin{
          row: 142+index*1
          column: 7
          size: 1

      }

  }
  EnemyMonster{
      row:152
      column: 7
      size:1
      directionTimer.interval: 7000
  }
  EnemyIceBlock{
      row:155
      column: 7
      size:1
      directionTimer.interval: 15000
  }
  EnemyCrystallo{
      row:157
      column: 7
      size:1
      directionTimer.interval: 25000
  }

  EnemySnail{
      row:158
      column:7
      size:1
      directionTimer.interval: 36500
  }
  EnemyPet{
      row:170
      column:7
      size:1
      directionTimer.interval: 16500
  }
  EnemyIceBlock{
      row:180
      column:7
      size:1
      directionTimer.interval: 5500
  }

  Repeater{
      model: 10
      Coin{
          row: 182+index*1
          column: 9
          size: 1

      }

  }

  Ground1{
      row:142
      column:5
      size:50
  }
  Ground1{
      row:142
      column:4
      size:50
  }
  Ground1{
      row:142
      column:3
      size:50
  }
  Ground1{
      row:142
      column:2
      size:50
  }
  Ground1{
      row:142
      column:1
      size:50
  }
  Ground1{
      row:142
      column:0
      size:50
  }
  Finish{
      row:192
      column: 0
      size:8
  }
  Finish{
      row:192
      column: 1
      size:8
  }
  Finish{
      row:192
      column: 2
      size:8
  }
  Finish{
      row:192
      column: 3
      size:8
  }
  Finish{
      row:192
      column: 4
      size:8
  }
  Finish{
      row:192
      column: 5
      size:8
  }
  Finish{
      row:192
      column: 6
      size:8
  }
  Finish{
      row:192
      column: 7
      size:8
  }
  Finish{
      row:192
      column: 8
      size:8
  }
  Finish{
      row:192
      column: 9
      size:8
  }

  Ground{
      row:0
      column: 0
      size:1000
  }
}
