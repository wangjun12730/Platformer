import Felgo 3.0
import QtQuick 2.0

Item {
  width: gameScene.gridSize
  height: gameScene.gridSize
  property alias image: sprite.source
  property alias sprite:sprite

  MultiResolutionImage {
    id: sprite
    // the anchoring is needed because the start and end tile are actually bigger than the gridSize, because they have some grass hanging from the edge, which we will (for the sake of simplicity) ignore when it comes to collision detection
    anchors.fill: parent
  }
}

