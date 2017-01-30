import QtQuick 2.4

Item {
    id: item1
    width: 400
    height: 400
    property alias rectangle: rectangle

    Rectangle {
        id: rectangle
        x: 0
        y: 40
        width: 46
        height: 51
        color: "#3f3c3c"
        anchors.left: parent.left
    }
    states: [
        State {
            name: "State1"

            PropertyChanges {
                target: rectangle
                width: 235
                height: 298
            }
        }
    ]
}
