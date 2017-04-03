import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 980
    height: 800
    color:"#B6CAB4"
    title: qsTr("GK PROGRAM")
    id: root


    property color menuBackgroundColor: "#9EAB9C"
    property color menuBorderColor: "#5C5E5C"






    menuBar:  MenuBar {

        Menu {
            title: "MENY"
            MenuItem { text: "Node"; onTriggered:view.currentIndex=1 }
            MenuSeparator {visible: true }
            MenuItem { text: "Info"; onTriggered:view.currentIndex=2}
            MenuSeparator {visible: true }
            MenuItem { text: "Avslutt"; onTriggered: Qt.quit(); iconSource:  "qrc:logout.png"}
        }



        style: MenuBarStyle {


            padding {
                left: 8
                right: 8
                top: 4
                bottom: 2
            }

            background: Rectangle {
                id: rect
                border.color: menuBorderColor
                color: menuBackgroundColor
            }

            itemDelegate: Rectangle {            // Menu
                implicitWidth: lab.contentWidth * 1.2          // adjust width of the menu button
                implicitHeight: lab.contentHeight               // adjust height
                color: styleData.selected || styleData.open ? "#9EAB9C" : "transparent"
                Label {
                    id: lab
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: styleData.selected  || styleData.open ? "white" : "white"
                    font.wordSpacing: 10
                    text: styleData.text
                    font.pixelSize: 20
                    font.family: "Segoe UI Black"
                    font.bold:true
                    //font.underline: true
                }
            }

            menuStyle: MenuStyle {               // the menus items style
                id: goreStyle

                frame: Rectangle {
                    color: menuBackgroundColor

                }

                itemDelegate {
                    background: Rectangle {
                        color:  styleData.selected || styleData.open ? "#889187" : menuBackgroundColor
                        radius: styleData.selected ? 3 : 0
                        height: 10
                    }

                    label: Label {
                        color: styleData.selected ? "white" : "white"
                        text: styleData.text
                    }

                    submenuIndicator: Text {
                        text: "\u25ba"
                        font: goreStyle.font
                        color: styleData.selected  || styleData.open ? "#5C5E5C" : "#5C5E5C"
                        styleColor: Qt.lighter(color, 4)
                    }

                    shortcut: Label {
                        color: styleData.selected ? "white" : "grey"
                        text: styleData.shortcut
                    }

                    checkmarkIndicator: CheckBox {
                        checked: styleData.checked

                        style: CheckBoxStyle {

                            indicator: Rectangle {
                                implicitWidth: goreStyle.font.pixelSize
                                implicitHeight: implicitWidth
                                radius: 2
                                color: control.checked ?  "#5C5E5C" : menuBackgroundColor
                                border.color: control.activeFocus ? menuBackgroundColor : "black"
                                border.width: 2
                                Rectangle {
                                    visible: control.checked
                                    color: "#5C5E5C"
                                    border.color: menuBackgroundColor
                                    border.width: 2
                                    radius: 2
                                    anchors.fill: parent
                                }
                            }
                            spacing: 10
                        }
                    }
                }

                // scrollIndicator:               // <--- could be an image

                separator: Rectangle {
                    width: parent.width
                    implicitHeight: 0.5
                    color: "#5C5E5C"
                }
            }
        }
    }

    Image{
        id:image
        anchors.right: parent.right
        anchors.top:parent.top
        anchors.topMargin: 30
        anchors.rightMargin: 30
        smooth: true
        visible: (view.currentIndex==0)?false:true
        source: "gk.png"
        width: 60
        height: 60
    }
    DropShadow {
        visible: (view.currentIndex==0)?false:true
        anchors.fill: image
        horizontalOffset: 5
        verticalOffset: 4
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: image
    }

    SwipeView {
        id: view
        interactive: false
        currentIndex: 0

        anchors.fill: parent
        Item {

            Loader {
                id: loginnPage
                anchors.fill:parent
                source:"innlogging.qml"

            }
        }
        Item
        {
            Loader {
                id: nedlastningPage
                anchors.fill: parent
                source:"nedlast.qml"
            }
        }
        Item
        {
            Loader {
                id: infoPage
                anchors.fill: parent
                source:"info.qml"
            }
        }


        states: [
            State {
                name: "invisibleMenu"
                when: view.currentIndex == 0
                PropertyChanges {
                    target: root
                    menuBar:  null
                }
            }

        ]



    }

    PageIndicator {
        id: indicator
        visible: false
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }


}
