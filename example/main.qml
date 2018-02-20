import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    id: root
    visible: true
    width: 1080
    height: 930
    title: qsTr("qmlsnapshot example")

    Item {
        id: container
        anchors.fill: parent

        function rgb2hex(r, g, b) {
            if (r > 255 || g > 255 || b > 255) {
                return;
            }
            return "wooden_chair_color_" + ((r << 16) | (g << 8) | b).toString(16);
        }

        Content3D {
            id: scene
        }

        Column {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 5

            Row {
                Slider {
                    id: colorRSlider
                    stepSize: 1
                    from: 0
                    to: 255
                    onValueChanged: scene.colorR = value;
                }
                Text {
                    font.pixelSize: parent.height/2
                    text: "R " + colorRSlider.value
                }
            }

            Row {
                Slider {
                    id: colorGSlider
                    stepSize: 1
                    from: 0
                    to: 255
                    onValueChanged: scene.colorG = value;
                }
                Text {
                    font.pixelSize: parent.height/2
                    text: "G " + colorGSlider.value
                }
            }
            Row {
                Slider {
                    id: colorBSlider
                    stepSize: 1
                    from: 0
                    to: 255
                    onValueChanged: scene.colorB = value;
                }
                Text {
                    font.pixelSize: parent.height/2
                    text: "B " + colorBSlider.value
                }
            }
            Row {
                Slider {
                    id: colorASlider
                    from: 0
                    to: 1
                    onValueChanged: scene.colorA = value;
                }
                Text {
                    font.pixelSize: parent.height/2
                    text: "A " + colorASlider.value.toFixed(2)
                }
            }
        }

        Button {
            font.pixelSize: 20
            anchors.right: parent.right
            text: "Print Scene"
            onClicked: {
                var init = container.grabToImage(function(newImg) {
                    var path = StandardPaths.getDesktopDir() + "/";
                    newImg.saveToFile(path + container.rgb2hex(scene.colorR,scene.colorG, scene.colorB) + ".png");
                    image.source = newImg.url;
                    QMLSnapShot.captureWindow(newImg.image);
                },
                Qt.size(root.width, root.height));
                console.log("'Scene-shot' successfully saved in Desktop: ", init);
            }
        }
    }
}
