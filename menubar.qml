import QtQuick 2.0

Item {
    id: menuknap
    width: 400
    height: 400

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 50
        height: 50
        color: "#645f5f"
        z: -1
    }

    Image {
        id: image
        x: 5
        y: 5
        width: 40
        height: 40
        source: "menu.png"
    }

}
