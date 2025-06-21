import QtQuick
import QtQuick.Controls.Imagine

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    property variant places: ["Indian", "Mexican", "Italian", "Chinese","Russian", "Pakistani"]

    MouseArea{
        id: area
        anchors.fill: parent
        onClicked: {
            antStart.stop()
            aniFadeOut.stop()
            lblPlace.font.pixelSize = 45
            lblPlace.opacity = 1
            lblPlace.rotation = 0.0
            aniFadeOut.start()
        }

        Label{
            id: lblPlace
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize: 25  // Changed from pointSize to pixelSize
            text:"Tap Me"
        }
    }

    function pick(){
        var i = Math.floor(Math.random() * places.length)
        lblPlace.text = places[i]
        aniSelection.start()
    }

    SequentialAnimation {
        id: antStart
        running: true
        loops: Animation.Infinite
        NumberAnimation {target: lblPlace; property: "font.pixelSize"; to: 45; duration: 1000}
        NumberAnimation {target: lblPlace; property: "font.pixelSize"; to: 25; duration: 1000}  // Fixed typo
    }

    OpacityAnimator{
        id: aniFadeOut
        running: false
        from: 1
        to: 0
        target: lblPlace
        duration: 500
        onFinished: pick()
    }

    ParallelAnimation{
        id: aniSelection
        running: false  // Changed to false so it doesn't auto-start

        NumberAnimation {target: lblPlace; property: "font.pixelSize"; from: 0; to: 45; duration: 2000}

        OpacityAnimator{
            from: 0  // Changed to fade in instead of out
            to: 1
            target: lblPlace
            duration: 2000
        }

        RotationAnimation{
            from: 0      // Changed for more visible rotation
            to: 360
            target: lblPlace
            duration: 2000
            direction: RotationAnimation.Counterclockwise
        }
    }
}
