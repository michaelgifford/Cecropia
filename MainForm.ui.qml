import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

import "global_item_variables.js" as VarScript


Item {
    width: 144
    height: 840

    // property alias score: score
    // property alias comments: comments
   // property alias posts: posts
    property alias subreddit: subreddit
    property alias add_b: add_b
    property alias keyword: keyword
    property alias clear_b: clear_b
    property alias visualize_b: visualize_b

    property alias key_display: key_display



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
                       color: VarScript.sub1color
                       text: qsTr("subreddit1")
                       wrapMode: Text.WordWrap
                       font.pixelSize: 12
                   }

                   Text {
                       id: sub2
                       x: 0
                       y: 74
                       width: 212
                       height: 20
                       color: "#ffffff"
                       text: qsTr("subreddit2")
                       wrapMode: Text.WordWrap
                       font.pixelSize: 12
                   }

                   Text {
                       id: sub3
                       x: 0
                       y: 95
                       width: 212
                       height: 20
                       color: "#ffffff"
                       text: qsTr("subreddit3")
                       wrapMode: Text.WordWrap
                       font.pixelSize: 12
                   }

                   Text {
                       id: sub4
                       x: 0
                       y: 115
                       width: 212
                       height: 20
                       color: "#ffffff"
                       text: qsTr("subreddit4")
                       wrapMode: Text.WordWrap
                       font.pixelSize: 12
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
            Row {
                spacing: 20

                id: row1
                x: 23
                y: 37
                width: 700
                height: 590

                Rectangle {
                    id: posts
                    width: 200
                    height: 5
                    color: "red"
                }

                Rectangle {
                    id: score
                    width: 200
                    height: 5
                    color: "blue"
                }

                Rectangle {
                    id: comments
                    width: 200
                    height: 5
                    color: "green"
                }


            }

            Text {
                id: key_display
                x: 931
                y: 28
                width: 166
                height: 92
                text: qsTr("TEST")
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.NoWrap
                font.pixelSize: 30
            }


        }

    }




}  //screen end
