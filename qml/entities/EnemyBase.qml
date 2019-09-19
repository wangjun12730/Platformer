import QtQuick 2.0
import Felgo 3.0

TiledEntityBase {
    entityType: "enemyBase"

    property int startX
    property int startY

    property int pictureNum: 1

    //怪物是否活着
    property bool alive: true
    //是否隐藏
    property bool hidden: false
    z: 1 // 让怪物显示在最前面

    // this timer hides the opponent a few seconds after its death
    Timer {
      id: hideTimer
      interval: 2000

      onTriggered: hidden = true
    }
    //用一个计时器   来处理怪物的移动的   循环贴图
    Timer {
      id: switchPictureTimer
      interval: 300
      running: true
      repeat: true

      onTriggered: {
          console.debug("pictureNum = "+pictureNum)
          pictureNum++
      }
    }

    function die() {
      alive = false

      hideTimer.start()
    }

}
