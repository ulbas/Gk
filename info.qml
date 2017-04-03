
import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0
import QtQuick.Layouts 1.3
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
                                text:"INFO"
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
                                text:"FILER"
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
                }
                Button{
                    id:nodeoppsett


                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    height: parent.height
                    width:100
                    style:ButtonStyle{
                        label: Component{
                            Text{
                                text:"NODER"
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

                TextEdit{
                    id:titel
                    anchors.top:parent.top
                    anchors.left:parent.left
                    anchors.leftMargin: 15
                    anchors.topMargin: 10
                    font.pixelSize: 20
                    font.family: "Tahoma"
                    readOnly: true
                    font.letterSpacing: 2
                    //font.underline: true
                    font.bold:true
                    text:"INFO:"
                }
                TextEdit{
                    id:infotext
                    anchors.top:titel.bottom
                    anchors.topMargin: 50
                    readOnly: true
                    anchors.left: parent.left
                    anchors.leftMargin: 70
                    font.family: "Candara"
                    font.letterSpacing: 1
                    font.bold: true
                    font.pixelSize: 18
                    text:"Dette programmet skal la montører laste opp program på nodene.\n\nDet man trenger for å laste opp filer til noden er:\n\n\n                         * Micro USB\n\n                         * Oppdatert node program\n\n                         * Riktig noder"
                    wrapMode: "WordWrap"
                }



            }
            Rectangle{
                id:two
                visible:false
                anchors.top:recbar.bottom
                TextEdit{
                    id:file
                    anchors.top:parent.top
                    anchors.left:parent.left
                    anchors.leftMargin: 15
                    anchors.topMargin: 10
                    font.pixelSize: 20
                    readOnly: true
                    font.family: "Tahoma"
                    font.letterSpacing: 2
                    //font.underline: true
                    font.bold:true
                    text:"LASTE INN FIL TIL NODER:"
                }
                TextEdit{
                    id:filertext
                    anchors.top:file.bottom
                    anchors.topMargin: 50
                    readOnly: true
                    anchors.left: parent.left
                    anchors.leftMargin: 70
                    font.family: "Candara"
                    font.letterSpacing: 1
                    font.pixelSize: 18
                    font.bold: true
                    text:"Når du skal laste inn filer til noden så er det\nen sjekkliste på ting som må gjøres:\n\n\n             *   Gi noden unik id (EKS:2-255, da sentralen er 1)\n\n             *   Velg ønsket fil du ønsker å laste inn\n\n             *   Plugg inn micro USB mellom datamaskin og noden\n\n             *   Trykk last ned knappen"
                    wrapMode: "WordWrap"
                }



            }
            Rectangle{
                id:three
                visible:false
                anchors.top:recbar.bottom
                TextEdit{
                    id:nodeopp
                    anchors.top:parent.top
                    anchors.left:parent.left
                    anchors.leftMargin: 15
                    anchors.topMargin: 10
                    font.pixelSize: 20
                    readOnly: true
                    font.family: "Tahoma"
                    font.letterSpacing: 2
                    //font.underline: true
                    font.bold:true
                    horizontalAlignment: Text.AlignHCenter
                    text:"NODER:"
                }
                TextEdit{
                    id:nodertext
                    anchors.top:nodeopp.bottom
                    anchors.topMargin: 50
                    anchors.left: parent.left
                    anchors.leftMargin: 100
                    readOnly: true
                    font.family: "Candara"
                    font.letterSpacing: 1
                    font.pixelSize:13
                    text:"Her skal det stå litt tekst om nodeoppsett, og hvordan det gjøres."
                    wrapMode: "WordWrap"
                }



            }
        }



    }
}
