import QtQuick 2.0
import Felgo 3.0

TiledEntityBase {
    entityType: "enemyBase"

    property int startX
    property int startY

    property int pictureNum: 1

    //Determine if the monster is alive
    property bool alive: true
    //Whether to hide monsters
    property bool hidden: false
    z: 1

    // this timer hides the opponent a few seconds after its death
    Timer {
      id: hideTimer
      interval: 2000

      onTriggered: hidden = true
    }
    //Use the timer loop map to make the monster look like it's moving
    Timer {
      id: switchPictureTimer
      interval: 300
      running: true
      repeat: true

      onTriggered: {
         // console.debug("pictureNum = "+pictureNum)
          pictureNum++
      }
    }

    function die() {
      alive = false

      hideTimer.start()
    }

}
