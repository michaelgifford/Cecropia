import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1



Item {
    width: 1200
    height: 750


    property alias subreddit: subreddit
    property alias add_b: add_b
    property alias keyword: keyword
    property alias clear_b: clear_b
    property alias visualize_b: visualize_b

    property alias key_display: key_display

    property alias sub1: sub1
    property alias sub2: sub2
    property alias sub3: sub3
    property alias sub4: sub4

    property alias removesub1: removesub1
    property alias removesub2: removesub2
    property alias removesub3: removesub3
    property alias removesub4: removesub4


    property alias score1: score1
    property alias comments1: comments1
    property alias density1: density1

    property alias score2: score2
    property alias comments2: comments2
    property alias density2: density2

    property alias score3: score3
    property alias comments3: comments3
    property alias density3: density3

    property alias score4: score4
    property alias comments4: comments4
    property alias density4: density4

    property alias error_msgs: error_msgs

    property alias loading_box: loading_box

    property alias rlogo: rlogo

//side panel start

    Rectangle {
        id: side_panel_background
        x: 0
        y: 0
        width: 260
        height: 750
        color: "#030a3c"

        GroupBox {               //side panel group start
            id: side_panel
            x: 0
            y: 0
            width: 260
            height: 750
            flat: false
            title: qsTr("")

            Text {
                id: redditv_title
                x: 55
                y: 22
                width: 190
                height: 37
                color: "#ffffff"
                text: qsTr("Reddit Visualizer")
                font.family: "Verdana"
                font.pixelSize: 23
            }

            GroupBox {
                id: input_box
                x: -8
                y: 77
                width: 260
                height: 281
                title: qsTr("")

//subreddit shit

                Label {
                    id: subreddit_label
                    x: 0
                    y: 20
                    width: 62
                    height: 20
                    color: "#ffffff"
                    text: qsTr("Subreddit:")
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 10
                    wrapMode: Text.WordWrap
                }


                TextField {
                    id: subreddit
                    x: 68
                    y: 20
                    width: 144
                    height: 20
                    placeholderText: qsTr("Text Field")
                }

                Button {
                    id: add_b
                    x: 218
                    y: 19
                    width: 21
                    height: 21
                    text: qsTr("+")
                }

         Text {
                id: sub1
                       x: 0
                       y: 56
                       width: 212
                       height: 20
                       color: "red"
                       text: qsTr("")
                       wrapMode: Text.WordWrap
                       font.pixelSize: 12

                       Button {
                           id: removesub1
                           x: 219
                           y: 1
                           width: 19
                           height: 19
                           text: qsTr("-")
                           visible: false
                       }
         }

                   Text {
                       id: sub2
                       x: 0
                       y: 74
                       width: 212
                       height: 20
                       color: "blue"

                       text: qsTr("")
                       wrapMode: Text.WordWrap
                       font.pixelSize: 12

                       Button {
                           id: removesub2
                           x: 219
                           y: 1
                           width: 19
                           height: 19
                           text: qsTr("-")
                           visible: false
                       }
                   }

                   Text {
                       id: sub3
                       x: 0
                       y: 95
                       width: 212
                       height: 20
                       color: "green"
                       text: qsTr("")
                       wrapMode: Text.WordWrap
                       font.pixelSize: 12

                       Button {
                           id: removesub3
                           x: 219
                           y: 1
                           width: 19
                           height: 19
                           text: qsTr("-")
                           visible: false
                       }
                   }

                   Text {
                       id: sub4
                       x: 0
                       y: 115
                       width: 212
                       height: 20
                       color: "orange"
                       text: qsTr("")
                       wrapMode: Text.WordWrap
                       font.pixelSize: 12

                       Button {
                           id: removesub4
                           x: 219
                           y: 1
                           width: 19
                           height: 19
                           text: qsTr("-")
                           checkable: true
                           visible: false
                       }
                   }




//keyword shit
               Label {
                       id: keyword_label
                       x: 0
                       y: 182
                       width: 62
                       height: 20
                       color: "#ffffff"
                       text: qsTr("Keyword:")
                       font.pointSize: 10
                       horizontalAlignment: Text.AlignHCenter
                       wrapMode: Text.WordWrap
                }

                TextField {
                    id: keyword
                    x: 68
                    y: 182
                    width: 144
                    height: 20
                    placeholderText: qsTr("Text Field")
                }



                Button {
                    id: clear_b
                    x: 34
                    y: 241
                    width: 84
                    height: 23
                    text: qsTr("Clear")
                    enabled: true
                }

                Button {
                    id: visualize_b
                    x: 134
                    y: 241
                    width: 84
                    height: 23
                    text: qsTr("Visualize!")
                }

                //error message start

                Text {
                    id: error_msgs
                    x: 15
                    y: 319
                    width: 210
                    height: 126
                    color: "#fff2f2"
                    text: qsTr("")
                    wrapMode: Text.WordWrap
                    font.pixelSize: 12
                }





            }

            //sidepanel groupbox end





        }

    }   //sidepanel end

    //graph panel start
    Rectangle {
        id: graphbox_background
        x: 260
        y: 0
        width: 940
        height: 750
        color: "#ffffff"

GroupBox {
    id: graphbox
            x: 0
            y: 0
            width: 940
            height: 750
            title: qsTr("")

            ColumnLayout {
                id: columnLayout_graphs
                x: 67
                y: 54
                width: 100
                height: 632



                ColumnLayout {
                    id: columnLayout_score
                    width: 100
                    height: 100

                    Rectangle {
                        id: score1
                        width: 1
                        height: 30
                        color: "red"
                    }


                    Rectangle {
                        id: score2
                        width: 1
                        height: 30
                        color: "blue"
                    }

                    Rectangle {
                        id: score3
                        width: 1
                        height: 30
                        color: "green"
                    }

                    Rectangle {
                        id: score4
                        width: 1
                        height: 30
                        color: "orange"
                    }
                }


                ColumnLayout {
                    id: columnLayout_density
                    width: 100
                    height: 100

                    Rectangle {
                        id: density1
                        width: 1
                        height: 30
                        color: "red"
                    }

                    Rectangle {
                        id: density2
                        width: 1
                        height: 30
                        color: "blue"
                    }

                    Rectangle {
                        id: density3
                        width: 1
                        height: 30
                        color: "green"
                    }

                    Rectangle {
                        id: density4
                        width: 1
                        height: 30
                        color: "orange"
                    }


                }
                ColumnLayout {
                    id: columnLayout_comments
                    width: 100
                    height: 100


                    Rectangle {
                        id: comments1
                        width: 1
                        height: 30
                        color: "red"
                    }

                    Rectangle {
                        id: comments2
                        width: 1
                        height: 30
                        color: "blue"
                    }

                    Rectangle {
                        id: comments3
                        width: 1
                        height: 30
                        color: "green"
                    }

                    Rectangle {
                        id: comments4
                        width: 1
                        height: 30
                        color: "orange"
                    }
                }
            }

            Text {
                id: loading_box
                x: 385
                y: 311
                width: 155
                height: 110
                text: qsTr("")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 30
            }

            Text {
                id: key_display
                x: 735
                y: 12
                width: 143
                height: 82
                color: "#000000"
                text: ""
                textFormat: Text.AutoText
                font.family: "Verdana"
                style: Text.Normal
                font.italic: false
                font.bold: true
                styleColor: "#000000"
                wrapMode: Text.NoWrap
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 30
            }

            Image {
                id: rlogo
                x: 735
                y: 401
                width: 150
                height: 300
                source: "regular_logo.png"
            }

            Image {
                id: image1
                x: -261
                y: 12
                width: 49
                height: 45
                source: "bargraph.png"
            }



}

Label {
    id: tscore
    x: 14
    y: 160
    text: qsTr("Total Score")
    font.pointSize: 14
    rotation: 270
}

Label {
    id: spc
            x: 4
            y: 367
            text: qsTr("Average Score")
            font.pointSize: 14
            rotation: 270
}

Label {
    id: comments
    x: 24
    y: 580
    text: qsTr("Comments")
    font.pointSize: 14
    rotation: 270
}


    }




}  //screen end
