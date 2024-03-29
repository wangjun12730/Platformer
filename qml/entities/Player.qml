import Felgo 3.0
import QtQuick 2.0

EntityBase {
  id: player
  entityType: "player"
  width: 50
  height: 50

  // add some aliases for easier access to those properties from outside
  property alias collider: collider
  property alias horizontalVelocity: collider.linearVelocity.x

  // the contacts property is used to determine if the player is in touch with any solid objects (like ground or platform), because in this case the player is walking, which enables the ability to jump. contacts > 0 --> walking state
  property int contacts: 0
  // property binding to determine the state of the player like described above
  state: contacts > 0 ? "walking" : "jumping"
  onStateChanged: console.debug("player.state " + state)

  // here you could use a SpriteSquenceVPlay to animate your player
  MultiResolutionImage {
    id:mul
    source: "../../assets/player/run.png"
    mirror: false
  }
//Used to determine whether the image of a person should be mirrored
 Timer{
    id:mirror
    interval:100
    repeat: false
    onTriggered: {
            if(collider.linearVelocity.x<0) mul.mirror=true
            if(collider.linearVelocity.x>0) mul.mirror=false
    }
  }
  BoxCollider {
    id: collider
    height: parent.height
    width: 30
    anchors.horizontalCenter: parent.horizontalCenter
    // this collider must be dynamic because we are moving it by applying forces and impulses
    bodyType: Body.Dynamic // this is the default value but I wanted to mention it ;)
    fixedRotation: true // we are running, not rolling...
    bullet: true // for super accurate collision detection, use this sparingly, because it's quite performance greedy
    sleepingAllowed: false
    categories: Box.Category1
//    1 plater  2 ground   3 platform  4 enemy   5  a entity below the ground  6  coins  7 plant 8 finish
    //9 resetSensor
    collidesWith: Box.Category2 | Box.Category3 | Box.Category4 | Box.Category5 |Box.Category6 |Box.Category8 |Box.Category9 |Box.Category10
//    // apply the horizontal value of the TwoAxisController as force to move the player left and right
    force: Qt.point(controller.xAxis*10*32,0)

    //collision detection
    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "enemy"){
          console.log("player die")
          gameScene.score=0
          gameScene.bullet=0
          die()
      }
      if (otherEntity.entityType==="coin") gameScene.score+=100
      if(otherEntity.entityType==="diamond") gameScene.score+=1000
      if(otherEntity.entityType==="resetSensor") {
          console.log("player die")
          gameScene.score=0
          gameScene.bullet=0
          die()
      }
      if(otherEntity.entityType==="magic") {
          gameScene.bullet+=30
          gameScene.score+=100
      }
    }

    // limit the horizontal velocity
    onLinearVelocityChanged: {
      if(linearVelocity.x > 170) linearVelocity.x = 170
      if(linearVelocity.x < -170) linearVelocity.x = -170
      mirror.start()
    }
  }

  // this timer is used to slow down the players horizontal movement. the linearDamping property of the collider works quite similar, but also in vertical direction, which we don't want to be slowed
  Timer {
    id: updateTimer
    // set this interval as high as possible to improve performance, but as low as needed so it still looks good
    interval: 60
    running: true
    repeat: true
    onTriggered: {
      var xAxis = controller.xAxis;
      // if xAxis is 0 (no movement command) we slow the player down until he stops
      if(xAxis === 0) {
        if(Math.abs(player.horizontalVelocity) > 10) player.horizontalVelocity /= 1.5
        else player.horizontalVelocity = 0
      }
    }
  }

  function jump() {
    console.debug("jump requested at player.state " + state)
    if(player.state == "walking") {
      console.debug("do the jump")
      // for the jump, we simply set the upwards velocity of the collider
      collider.linearVelocity.y = -420
    }
  }
  function die(){
      playerDie.visible=true
      player.x=15
      player.y=100
      //After the player dies, the level will be closed
      gameScene.viewPort.closelevel()
      gameScene.viewPort.openlevel()

//      reloadlevel.start()

  }

//  //Used after the level is closed, fast reloading level,To reach all the monsters, gold coins, etc. back to the original
//  Timer{
//      id:reloadlevel
//      interval:10
//      repeat: false
//      running: false
//      onTriggered: {
//          gameScene.viewPort.openlevel()
//      }

//  }
}

