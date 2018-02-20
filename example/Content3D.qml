import QtQuick 2.0
import QtQuick.Scene3D 2.0

import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0

Scene3D {
    id: root
    anchors.fill: parent
    aspects: [ "input", "logic" ]

    property real colorR: 0.0
    property real colorG: 0.0
    property real colorB: 0.0
    property real colorA: 0.0

    Entity {
        id: wrapperEntity

        components: [
            RenderSettings {
                ForwardRenderer {
                    camera: camera
                }
            },
            InputSettings { },
            DirectionalLight {
                worldDirection: Qt.vector3d(-0.5, -1, -1)
                intensity: 2.5
                color: "white"
            }
        ]

        Camera {
            id: camera
            position: Qt.vector3d(0, 3, 10)
            viewCenter: Qt.vector3d(0, 0, 0)
        }

        OrbitCameraController { camera: camera }

        Entity {
            components: [
                Mesh {
                    source: "mesh/wooden_chair_tex.obj"
                },
                Transform {
                    id: transform
                    scale: 0.2
                    translation: Qt.vector3d(0, -1.8, 0)
                },
                DiffuseMapMaterial {
                    textureScale: 3
                    diffuse: TextureLoader { source: "mesh/wooden_chair.jpg" }
                    ambient: Qt.rgba(colorR, colorG, colorB, colorA)
                }
            ]
        }
    }
}
