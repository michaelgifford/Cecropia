import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    title: qsTr("Reddt Visualizer")
    width: 979
    height: 710
    visible: true

    signal submitUserInput(string num1, string num2)


    function sendGraph(nscore, numposts, numcomments){
        messageDialog.show(nscore)

        score.height = 500
        posts.height = (500*numposts/nscore)
        comments.height= (500*numcomments/nscore)


    }





    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: messageDialog.show(qsTr("Open action triggered"));
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }


    MainForm {




        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent

        visualize_b.onClicked:
        {
            submitUserInput(subreddit.text, keyword.text)
           // sendGraph(1, 1, 1)
        }
    /*    function superGraph(nscore, numposts, numcomments){

        } */
        Rectangle {
            id: rectangle2
            x: 219
            y: 0
            width: 761
            height: 710
            color: "#ffffff"

            GroupBox {
                id: groupBox3
                x: 0
                y: 0
                width: 761
                height: 710
                title: qsTr("Group Box")
                Row {
                    spacing: 20

                    id: row1
                    x: 23
                    y: 37
                    width: 700
                    height: 590

                    Rectangle {
                        id: score
                        width: 200
                        height: 5
                        color: "red"
                    }

                    Rectangle {
                        id: posts
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


            }
        }



        clear_b.onClicked:
        {
            subreddit.text = ""
            keyword.text = ""
            submitUserInput(subreddit.text, keyword.text)
        }




    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}
