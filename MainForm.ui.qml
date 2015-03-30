import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1



Item {
    width: 144
    height: 840


    property alias subreddit: subreddit
    property alias add_b: add_b
    property alias keyword: keyword
    property alias clear_b: clear_b
    property alias visualize_b: visualize_b

   // property alias key_display: key_display

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

  //  property alias loading: loading


//side panel start

    Rectangle {
        id: side_panel_background
        x: 0
        y: 0
        width: 260
        height: 840
        color: "#030a3c"

        GroupBox {               //side panel group start
            id: side_panel
            x: 0
            y: 0
            width: 260
            height: 710
            flat: false
            title: qsTr("")

            Text {
                id: redditv_title
                x: 12
                y: 20
                width: 154
                height: 27
                color: "#ffffff"
                text: qsTr("Reddit Visualizer")
                font.family: "Verdana"
                font.pixelSize: 19
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
                           x: 220
                           y: 1
                           width: 19
                           height: 19
                           text: qsTr("-")
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
                           x: 220
                           y: 1
                           width: 19
                           height: 19
                           text: qsTr("-")
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
                           x: 220
                           y: 1
                           width: 19
                           height: 19
                           text: qsTr("-")
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
                           x: 220
                           y: 1
                           width: 19
                           height: 19
                           text: qsTr("-")
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
                    x: 17
                    y: 319
                    width: 210
                    height: 268
                    color: "#fff2f2"
                    text: qsTr("")
                    wrapMode: Text.WordWrap
                    font.pixelSize: 12
                }





            } //sidepanel groupbox end





        }

    }   //sidepanel end

    //graph panel start
    Rectangle {
        id: graphbox_background
        x: 260
        y: 0
        width: 1440-260
        height: 840
        color: "#ffffff"

GroupBox {
    id: graphbox
            x: 0
            y: 0
            width: 1180
            height: 840
            title: qsTr("")

            ColumnLayout {
                id: columnLayout_graphs
                x: 67
                y: 54
                width: 100
                height: 759



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



}

Label {
    id: tscore
    x: 14
    y: 179
    text: qsTr("Total Score")
    rotation: 270
}

Label {
    id: spc
            x: 5
            y: 438
            text: qsTr("Average Score")
            rotation: 270
}

Label {
    id: comments
            x: 15
            y: 688
            text: qsTr("Comments")
            rotation: 270
        }


    }




}  //screen end
