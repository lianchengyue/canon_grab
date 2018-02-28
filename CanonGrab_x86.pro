QT += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

TARGET = CanonGrab_x86
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += \
    CameraControl.cpp \
    CameraControlDlg.cpp

HEADERS += \
    Command/CloseSessionCommand.h \
    Command/Command.h \
    Command/DoEvfAFCommand.h \
    Command/DownloadCommand.h \
    Command/DownloadEvfCommand.h \
    Command/DriveLensCommand.h \
    Command/EndEvfCommand.h \
    Command/GetPropertyCommand.h \
    Command/GetPropertyDescCommand.h \
    Command/NotifyCommand.h \
    Command/OpenSessionCommand.h \
    Command/PressShutterButtonCommand.h \
    Command/SaveSettingCommand.h \
    Command/SetCapacityCommand.h \
    Command/SetPropertyCommand.h \
    Command/StartEvfCommand.h \
    Command/TakePictureCommand.h \
    Camera/CameraController.h \
    Camera/CameraEvent.h \
    Camera/CameraEventListener.h \
    Camera/CameraModel.h \
    Camera/CameraModelLegacy.h \
    Camera/Processor.h \
    Class/ActionEvent.h \
    Class/ActionListener.h \
    Class/ActionSource.h \
    Class/Observer.h \
    Class/Synchronized.h \
    Class/Thread.h \
    CameraControl.h \
    CameraControlDlg.h

INCLUDEPATH += \
"C:\Program Files (x86)\Windows Kits\10\Include\10.0.10240.0\ucrt" \
D:\VS2015_project\EDsdk\EDSDK\Header \
D:\Qt\Qt5.6.2_x86\project\CanonGrab_x86\Camera \
D:\Qt\Qt5.6.2_x86\project\CanonGrab_x86\Command \
D:\Qt\Qt5.6.2_x86\project\CanonGrab_x86\Class

LIBS += \
D:\VS2015_project\EDsdk\EDSDK\Library\EDSDK.lib \
"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.10150.0\ucrt\x86\ucrtd.lib" \

FORMS += \
    CameraControlDlg.ui
