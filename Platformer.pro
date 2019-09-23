# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo

qmlFolder.source = qml
DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
DEPLOYMENTFOLDERS += assetsFolder

# Add more folders to ship with the application here

RESOURCES += #    resources.qrc # uncomment for publishing

# NOTE: for PUBLISHING, perform the following steps:
# 1. comment the DEPLOYMENTFOLDERS += qmlFolder line above, to avoid shipping your qml files with the application (instead they get compiled to the app binary)
# 2. uncomment the resources.qrc file inclusion and add any qml subfolders to the .qrc file; this compiles your qml files and js files to the app binary and protects your source code
# 3. change the setMainQmlFile() call in main.cpp to the one starting with "qrc:/" - this loads the qml files from the resources
# for more details see the "Deployment Guides" in the Felgo Documentation

# during development, use the qmlFolder deployment because you then get shorter compilation times (the qml files do not need to be compiled to the binary but are just copied)
# also, for quickest deployment on Desktop disable the "Shadow Build" option in Projects/Builds - you can then select "Run Without Deployment" from the Build menu in Qt Creator if you only changed QML files; this speeds up application start, because your app is not copied & re-compiled but just re-interpreted


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp

android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml
}

ios {
    QMAKE_INFO_PLIST = ios/Project-Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST
}

DISTFILES += \
    qml/commond/MenuButton.qml \
    qml/entities/Ground1.qml \
    qml/levels/Level2.qml \
    qml/entities/EnemyBase.qml \
    qml/entities/ObstacleBase.qml \
    qml/entities/Coin.qml \
    qml/entities/EnemyPet.qml \
    qml/entities/EnemyCrystallo.qml \
    qml/scenes/Scoresranking.qml \
    qml/entities/Finish.qml \
    qml/entities/EnemyXiezi.qml \
    qml/entities/EnemyDragon.qml \
    qml/entities/EnemyMonster.qml \
    qml/entities/EnemySnail.qml \
    qml/entities/EnemyIceBlock.qml \
    qml/entities/Diamond.qml \
    qml/entities/Magic.qml \
    qml/entities/EnemyFHead.qml \
    qml/entities/EnemyPaopao.qml \
    qml/entities/Bullet.qml \
    qml/entities/Water.qml \
    qml/entities/Brick.qml

