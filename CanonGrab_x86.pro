QT += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

TARGET = CanonGrab_x86
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += \
    CameraControl.cpp \
    CameraControlDlg.cpp \
    openPano/stitch/blender.cc \
    openPano/stitch/camera.cc \
    openPano/stitch/camera_estimator.cc \
    openPano/stitch/cylstitcher.cc \
    openPano/stitch/debug.cc \
    openPano/stitch/homography.cc \
    openPano/stitch/incremental_bundle_adjuster.cc \
    openPano/stitch/multiband.cc \
    openPano/stitch/stitcher.cc \
    openPano/stitch/stitcher_image.cc \
    openPano/stitch/stitcherbase.cc \
    openPano/stitch/transform_estimate.cc \
    openPano/stitch/warp.cc \
    openPano/feature/brief.cc \
    openPano/feature/dist.cc \
    openPano/feature/dog.cc \
    openPano/feature/extrema.cc \
    openPano/feature/feature.cc \
    openPano/feature/gaussian.cc \
    openPano/feature/matcher.cc \
    openPano/feature/orientation.cc \
    openPano/feature/sift.cc \
    openPano/lib/color.cc \
    openPano/lib/config.cc \
    openPano/lib/debugutils.cc \
    openPano/lib/imgproc.cc \
    openPano/lib/kdtree.cc \
    openPano/lib/matrix.cc \
    openPano/lib/planedrawer.cc \
    openPano/lib/polygon.cc \
    openPano/lib/timer.cc \
    openPano/lib/utils.cc \
    openPano/lib/imgio.cc \
    openPano/third-party/lodepng/lodepng.cc

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
    CameraControlDlg.h \
    openPano/stitch/blender.hh \
    openPano/stitch/camera.hh \
    openPano/stitch/camera_estimator.hh \
    openPano/stitch/cylstitcher.hh \
    openPano/stitch/homography.hh \
    openPano/stitch/imageref.hh \
    openPano/stitch/incremental_bundle_adjuster.hh \
    openPano/stitch/match_info.hh \
    openPano/stitch/multiband.hh \
    openPano/stitch/projection.hh \
    openPano/stitch/stitcher.hh \
    openPano/stitch/stitcher_image.hh \
    openPano/stitch/stitcherbase.hh \
    openPano/stitch/transform_estimate.hh \
    openPano/stitch/warp.hh \
    openPano/third-party/CImg.h \
    openPano/common/common.hh \
    openPano/third-party/flann/flann.h \
    openPano/feature/brief.hh \
    openPano/feature/dist.hh \
    openPano/feature/dog.hh \
    openPano/feature/extrema.hh \
    openPano/feature/feature.hh \
    openPano/feature/gaussian.hh \
    openPano/feature/matcher.hh \
    openPano/feature/orientation.hh \
    openPano/feature/sift.hh \
    openPano/lib/color.hh \
    openPano/lib/config.hh \
    openPano/lib/debugutils.hh \
    openPano/lib/geometry.hh \
    openPano/lib/imgproc.hh \
    openPano/lib/kdtree.hh \
    openPano/lib/mat.h \
    openPano/lib/matrix.hh \
    openPano/lib/planedrawer.hh \
    openPano/lib/polygon.hh \
    openPano/lib/timer.hh \
    openPano/lib/utils.hh \
    openPano/third-party/lodepng/lodepng.h

INCLUDEPATH += \
"C:\Program Files (x86)\Windows Kits\10\Include\10.0.10240.0\ucrt" \
D:\VS2015_project\EDsdk\EDSDK\Header \
D:\Qt\Qt5.6.2_x86\project\CanonGrab_x86\Camera \
D:\Qt\Qt5.6.2_x86\project\CanonGrab_x86\Command \
D:\Qt\Qt5.6.2_x86\project\CanonGrab_x86\Class \
D:\Qt\Qt5.6.2_x86\project\CanonGrab_x86\openPano \
D:\Qt\Qt5.6.2_x86\project\CanonGrab_x86\openPano\third-party \
D:\3rdparty\jpeg-9c \
D:\PCL_1_8_0\3rdParty\Eigen\eigen3 \


LIBS += \
D:\VS2015_project\EDsdk\EDSDK\Library\EDSDK.lib \
"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.10150.0\ucrt\x86\ucrt.lib" \
"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.10150.0\ucrt\x86\ucrtd.lib" \
D:\3rdparty\jpeg-9c\Release\jpeg.lib

FORMS += \
    CameraControlDlg.ui
