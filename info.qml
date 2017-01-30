import QtQuick 2.0
import QtGraphicalEffects 1.0

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
            border.width: 1.5
            radius:5

            TextEdit{
                id:titel
                anchors.top:parent.top
                anchors.left:parent.left
                anchors.leftMargin: 10
                anchors.topMargin: 10
                font.pixelSize: 20
                font.family: "impact"
                font.letterSpacing: 2
                font.underline: true
                text:"Info side:"
            }
            TextEdit{
                id:infotext
                anchors.top:titel.bottom
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.family: "verdana"
                font.letterSpacing: 1
                font.pixelSize: 13
                text:"Her skal det stå litt tekst om hvordan siden \nskal fungere og hva brukeren må gjøre for å \nfå lastet ned programmet riktig"
                wrapMode: "WordWrap"
            }



        }


    } DropShadow {
        anchors.fill: column1
        horizontalOffset: 5
        verticalOffset: 4
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: column1
    }
}
