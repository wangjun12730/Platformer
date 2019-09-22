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
      row:4
      column: 8
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
  EnemyXiezi{
      row:12
      column: 4
      size:1
      directionTimer.interval: 1000
  }
  EnemyXiezi{
      row:7
      column: 2
      size:1
      directionTimer.interval:5000
  }
   EnemyDragon{
       row:12
       column: 2
       size:1
       directionTimer.interval: 5000
   }
   EnemyMonster{
       row:20
       column: 2
       size:1
       directionTimer.interval: 5000
   }
   EnemySnail{
       row:30
       column: 2
       size:1
       directionTimer.interval: 5000
   }
   EnemyIceBlock{
       row:32
       column: 2
       size:1
       directionTimer.interval: 5000
   }
   Diamond{
       row:35
       column: 1
       size:1
   }
   Magic{
       row:38
       column: 1
       size:1
   }
   EnemyFHead{
       row:48
       column: 1
       size:1
   }

  Platform {
    row: 11
    column: 3
    size: 2
  }

  EnemyPaopao{
      row:50
      column: 1
      size:1
  }
  Bullet{
      row:8
      column: 1
      size:1
  }

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

  Platform{
      row:40
      column:6
      size:4
  }
  Platform{
      row:47
      column:3
      size:3
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
  Platform{
      row:85
      column: 6
      size:3
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
  Platform{
      row:125
      column: 6
      size:3
  }
  Repeater{
      model: 3
      Coin{
          row: 125+index*1
          column: 7
          size: 1

      }

  }
  Platform{
      row:131
      column: 3
      size:3
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

//  Ground{
//      row:0
//      column: 0
//      size:1000
//  }
}
