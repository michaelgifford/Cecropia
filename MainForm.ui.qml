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
    property alias posts1: posts1

    property alias score2: score2
    property alias comments2: comments2
    property alias posts2: posts2

    property alias score3: score3
    property alias comments3: comments3
    property alias posts3: posts3

    property alias score4: score4
    property alias comments4: comments4
    property alias posts4: posts4


//side panel start

    Rectangle {
        id: side_panel_background
        x: 0
        y: 0
        width: 260
        height: 840
        color: "#0a0e2c"

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
                       color: "#ffffff"
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
                       color: "#ffffff"

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
                       color: "#ffffff"
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
                       color: "#ffffff"
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
                    y: 335
                    width: 210
                    height: 268
                    text: qsTr("Text")
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

            Text {
                id: key_display
                x: 931
                y: 28
                width: 166
                height: 92
                text: qsTr("")
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.NoWrap
                font.pixelSize: 30
            }

            ColumnLayout {
                id: columnLayout_graphs
                x: 8
                y: 0
                width: 100
                height: 823

                ColumnLayout {
                    id: columnLayout_sub1
                    width: 100
                    height: 100

                    Rectangle {
                        id: posts1
                        width: 5
                        height: 5
                        color: "red"
                    }

Rectangle {
    id: posts2
    width: 5
    height: 5
    color: "#ff0000"
}

                    Rectangle {
                        id: posts3
                        width: 5
                        height: 5
                        color: "#ff0000"
                    }

                    Rectangle {
                        id: posts4
                        width: 5
                        height: 5
                        color: "#ff0000"
                    }


                }

                ColumnLayout {
                    id: columnLayout_sub2
                    width: 100
                    height: 100


                    Rectangle {
                        id: comments1
                        width: 5
                        height: 5
                        color: "green"
                    }

                    Rectangle {
                        id: comments2
                        width: 5
                        height: 5
                        color: "#008000"
                    }

                    Rectangle {
                        id: comments3
                        width: 5
                        height: 5
                        color: "#008000"
                    }

                    Rectangle {
                        id: comments4
                        width: 5
                        height: 5
                        color: "#008000"
                    }
                }


ColumnLayout {
    id: columnLayout_sub4
                    width: 100
                    height: 100

                    Rectangle {
                        id: score1
                        width: 5
                        height: 5
                        color: "blue"
                    }


                    Rectangle {
                        id: score2
                        width: 5
                        height: 5
                        color: "#0000ff"
                    }

                    Rectangle {
                        id: score3
                        width: 5
                        height: 5
                        color: "#0000ff"
                    }

                    Rectangle {
                        id: score4
                        width: 5
                        height: 5
                        color: "#0000ff"
                    }
}

            }



        }

    }




}  //screen end
