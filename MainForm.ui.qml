import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1


Item {
    width: 980
    height: 710

   // property alias score: score
   // property alias comments: comments
   // property alias posts: posts
    property alias clear_b: clear_b
    property alias visualize_b: visualize_b
    property alias subreddit: subreddit
    property alias keyword: keyword

    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: 218
        height: 710
        color: "#0a0e2c"

GroupBox {
    id: groupBox2
    x: 18
    y: 455
    width: 182
    height: 235
    title: qsTr("Feedback")
    checked: true
    checkable: false
    flat: false
}

GroupBox {
    id: groupBox1
            x: 0
            y: 0
            width: 218
            height: 710
            flat: false
            title: qsTr("")

            TextField {
                id: subreddit
                x: 68
                y: 88
                width: 119
                height: 20
                placeholderText: qsTr("Text Field")
            }

            Text {
                id: text1
                x: 33
                y: 11
                width: 154
                height: 27
                color: "#ffffff"
                text: qsTr("Reddit Visualizer")
                font.family: "Verdana"
                font.pixelSize: 19
            }


            Label {
                id: label1
                x: -7
                y: 81
                width: 62
                height: 35
                color: "#ffffff"
                text: qsTr("Subreddit Name")
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 10
                wrapMode: Text.WordWrap
            }

            Label {
                id: label2
                x: 52
                y: 78
                color: "#ffffff"
                text: qsTr(":")
                font.pointSize: 20
            }

            TextField {
                id: keyword
                x: 68
                y: 249
                width: 119
                height: 20
                placeholderText: qsTr("Text Field")
            }

            Label {
                id: label3
                x: -7
                y: 249
                width: 62
                height: 21
                color: "#ffffff"
                text: qsTr("Keyword")
                font.pointSize: 10
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
            }

            Label {
                id: label4
                x: 52
                y: 239
                color: "#ffffff"
                text: qsTr(":")
                font.pointSize: 20
            }

            Text {
                id: text2
                x: 0
                y: 122
                width: 187
                height: 102
                color: "#ffffff"
                text: qsTr("List of entered subreddits with x's beside for removal")
                wrapMode: Text.WordWrap
                font.pixelSize: 12
            }

            Text {
                id: text3
                x: 0
                y: 279
                width: 187
                height: 102
                color: "#ffffff"
                text: qsTr("List of entered keywords with x's beside for removal")
                font.pixelSize: 12
                wrapMode: Text.WordWrap
            }

            Button {
                id: visualize_b
                x: 103
                y: 400
                width: 84
                height: 23
                text: qsTr("Visualize")
            }

            Button {
                id: clear_b
                x: 0
                y: 400
                width: 84
                height: 23
                text: qsTr("Clear")
                enabled: true
            }
}

    }


}
