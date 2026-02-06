import QtQuick 2.15
import QtQuick.Controls 2.15
import org.kde.calamares.ui 1.0

Item {
    width: 640
    height: 420

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#1a1b26" }
            GradientStop { position: 1.0; color: "#10101a" }
        }
    }

    Column {
        spacing: 14
        anchors.centerIn: parent
        width: parent.width * 0.85

        Label {
            text: "MagicOS Setup"
            font.pixelSize: 28
            font.bold: true
            color: "#9634D2"
        }

        Rectangle {
            width: 100
            height: 3
            radius: 2
            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop { position: 0.0; color: "#9634D2" }
                GradientStop { position: 1.0; color: "#399CF1" }
            }
        }

        Label {
            text: "Choose optional components to install:"
            opacity: 0.7
        }

        CheckBox {
            id: zen
            text: "Zen Browser"
            checked: true
            onCheckedChanged: Calamares.setGlobalStorage("magicos_install_zen", checked)
        }

        Label {
    text: {
        switch (Calamares.globalStorage["magicos_gpu"]) {
            case "nvidia": return "NVIDIA GPU detected"
            case "amd": return "AMD GPU detected (NVIDIA drivers not required)"
            case "intel": return "Intel GPU detected (NVIDIA drivers not required)"
            default: return "GPU type not detected"
        }
    }
    opacity: 0.7
}

CheckBox {
    id: nvidia
    text: "Install NVIDIA Proprietary Drivers"
    enabled: Calamares.globalStorage["magicos_gpu"] === "nvidia"
    checked: enabled
    visible: Calamares.globalStorage["magicos_gpu"] === "nvidia"

    onCheckedChanged: {
        Calamares.setGlobalStorage("magicos_install_nvidia", checked)
    }
}


        CheckBox {
            id: dev
            text: "Development Tools"
            onCheckedChanged: Calamares.setGlobalStorage("magicos_install_dev", checked)
        }

        CheckBox {
            id: gaming
            text: "Gaming Tools"
            onCheckedChanged: Calamares.setGlobalStorage("magicos_install_gaming", checked)
        }

        Item { height: 20 }

        Label {
            text: "You can change or install these later."
            opacity: 0.6
            font.pixelSize: 12
        }
    }
}
