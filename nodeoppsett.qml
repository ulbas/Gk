
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick 2.5
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
Rectangle {
    width: 600
    height: 600
    color: "transparent"

    Column{
        anchors.centerIn: parent
        id:column1
        Rectangle{
            id:textboks
            width: 700
            height: 550
            color: "white"
            border.color: "#5C5E5C"
            border.width: 1
            radius:5
            Rectangle{
                id:recbar
                width:parent.width
                height:30
                color:"#9EAB9C"
                border.width: 1
                border.color: "#5C5E5C"
                radius:1

                Button{
                    id:infos


                    anchors.left: parent.left
                    width: 100
                    height: parent.height
                    style:ButtonStyle{
                        label: Component{
                            Text{
                                text:"NY NODE"
                                color:"white"
                                font.family: "Segoe UI Black"
                                font.bold:true
                                font.pixelSize: 14
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.fill:parent

                            }
                        }
                        background: Rectangle{
                            border.width: 1.2
                            color: "transparent"
                            border.color: "transparent"
                            radius: 1
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                            }
                        }
                    }
                    onClicked:
                    {
                        one.visible=true
                        two.visible=false
                        three.visible=false
                    }
                }
                Button{
                    id:filer


                    anchors.centerIn: parent
                    height: parent.height
                    width:100
                    style:ButtonStyle{
                        label: Component{
                            Text{
                                text:"NY SENTRAL"
                                color:"white"
                                font.family: "Segoe UI Black"
                                font.bold:true
                                font.pixelSize: 14
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.fill:parent

                            }
                        }
                        background: Rectangle{
                            border.width: 1.2
                            color: "transparent"
                            border.color: "transparent"
                            radius: 1
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                            }
                        }
                    }
                    onClicked:
                    {
                        one.visible=false
                        two.visible=true
                        three.visible=false
                    }
                }Button{
                    id:eksisterende


                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    height: parent.height
                    width:100
                    style:ButtonStyle{
                        label: Component{
                            Text{
                                text:"EKSISTERENDE"
                                color:"white"
                                font.family: "Segoe UI Black"
                                font.bold:true
                                font.pixelSize: 14
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.fill:parent

                            }
                        }
                        background: Rectangle{
                            border.width: 1.2
                            color: "transparent"
                            border.color: "transparent"
                            radius: 1
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                            }
                        }
                    }
                    onClicked:
                    {
                        one.visible=false
                        two.visible=false
                        three.visible=true
                    }
                }
            }
            Rectangle{
                id:one
                visible: true
                anchors.top:recbar.bottom

                Rectangle{
                    id:firstrow
                    width: parent.width
                    height: 50
                    Rectangle{
                        id:nodenr
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left:parent.left
                        width:150
                        height: parent.height
                        color: "blue"

                    }
                    Rectangle{
                        id:sentralnr
                        anchors.top:parent.top
                        anchors.left:nodenr.right
                        color:"red"
                        height: parent.height
                    }
                    Rectangle{
                        id:filsel
                        anchors.left:sentralnr.right
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height
                        color: "green"
                    }
                }
                Rectangle{
                    id:descript
                    anchors.left:parent.left
                    anchors.top:firstrow.bottom
                    width: parent.width
                    height: 200

                }
                Rectangle{
                    id:bottombar
                    anchors.top:descript.bottom
                    anchors.left:parent.left
                    width: parent.width

                    Rectangle{
                        id:sensorselect
                        anchors.left:bottombar.left
                        anchors.top:bottombar.top
                        height: parent.height
                        color: "yellow"
                    }
                    Rectangle{
                        anchors.left:sensorselect.right
                        anchors.top:bottombar.top
                        height: parent.height
                        color: "pink"
                        id:knapper
                        Button{
                            id:lagre
                            anchors.bottom:lastned.bottom
                            anchors.right:knapper.right
                            anchors.bottomMargin: 20
                            anchors.rightMargin: 20
                            width:150
                            height: 50
                            text:"Save"

                        }
                        Button{
                            id:lastned
                            anchors.bottom:knapper.bottom
                            anchors.right:knapper.right
                            anchors.bottomMargin: 20
                            anchors.rightMargin: 20
                            width:150
                            height: 50
                            text:"last ned"

                        }
                    }
                }
            }
            Rectangle{
                id:two
                visible:false
                anchors.top:recbar.bottom
                Rectangle{

                }



            }
            Rectangle{
                id:three
                visible:false
                anchors.top:recbar.bottom
                Rectangle{
                }



            }
        }



    }
}
