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
  Ground {
    row: 8
    column: 0
    size: 2
  }
  Platform {
    row: 3
    column: 3
    size: 4
  }
  ObstacleBase{
      row:3
      column:4
      size:1
  }

  Platform {
    row: 7
    column: 6
    size: 4
  }
  Platform {
    row: 11
    column: 3
    size: 2
  }

  Ground {
    row: 12
    column: 0
    size: 5
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
  Ground{
      row:0
      column: 0
      size:1000
  }
}
