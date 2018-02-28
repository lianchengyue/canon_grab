#include <QApplication>

#include "EDSDK.h"
#include "EDSDKTypes.h"
#include "CameraControl.h"

//camera初始化
#include "Camera/CameraModel.h"
#include "Camera/CameraModelLegacy.h"
#include "Camera/CameraController.h"
#include "Camera/CameraEventListener.h"
//拍照
#include "Class/ActionSource.h"

//UI
#include "CameraControlDlg.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.show();

    ///CameraControlMain *mCameraControl =new CameraControlMain();
    ///mCameraControl->InitCamera();
    InitCamera();

    printf("InitCamera() finish\n");

    //take pic
    ActionSource *mAS = new ActionSource();
    std::string str= "TakePicture";
    mAS->fireEvent("TakePicture", 0);
    mAS->fireEvent(0);

    //while(1){}
    return a.exec();
}

CameraModel* cameraModelFactory(EdsCameraRef camera, EdsDeviceInfo deviceInfo)
{
    // if Legacy protocol.
    if(deviceInfo.deviceSubType == 0)
    {
        printf("Legacy protocol\n");
        return new CameraModelLegacy(camera);
    }

    // PTP protocol.
    printf("PTP protocol\n");
    return new CameraModel(camera);
}

// CameraControlMain initialization
//bool CameraControlMain::InitCamera()
bool InitCamera()
{
    EdsError	 err = EDS_ERR_OK;
    EdsCameraListRef cameraList = NULL;
    EdsCameraRef camera = NULL;
    EdsUInt32	 count = 0;
    bool		 isSDKLoaded = false;

    // Initialization of SDK
    err = EdsInitializeSDK();

    if(err == EDS_ERR_OK)
    {
        isSDKLoaded = true;
    }

    //Acquisition of camera list
    if(err == EDS_ERR_OK)
    {
        err = EdsGetCameraList(&cameraList);
    }

    //Acquisition of number of Cameras
    if(err == EDS_ERR_OK)
    {
        err = EdsGetChildCount(cameraList, &count);
        if(count == 0)
        {
            err = EDS_ERR_DEVICE_NOT_FOUND;
        }
    }


    //Acquisition of camera at the head of the list
    if(err == EDS_ERR_OK)
    {
        err = EdsGetChildAtIndex(cameraList , 0 , &camera);
    }

    //Acquisition of camera information
    EdsDeviceInfo deviceInfo;
    if(err == EDS_ERR_OK)
    {
        err = EdsGetDeviceInfo(camera , &deviceInfo);
        if(err == EDS_ERR_OK && camera == NULL)
        {
            err = EDS_ERR_DEVICE_NOT_FOUND;
        }
    }


    //Release camera list
    if(cameraList != NULL)
    {
        EdsRelease(cameraList);
    }

    //Create Camera model
    if(err == EDS_ERR_OK )
    {
        _model = cameraModelFactory(camera, deviceInfo);
        if(_model == NULL)
        {
            err = EDS_ERR_DEVICE_NOT_FOUND;
        }
    }

    if(err != EDS_ERR_OK)
    {
        //Popupwnd
        printf("Cannot detect camera!\n");
    }

    if(err == EDS_ERR_OK )
    {
        //Create CameraController
        _controller = new CameraController();
        ////delete mfc
        //Create View Dialog
        //CCameraControlDlg			view;

        ////delete mfc
        _controller->setCameraModel(_model);
        ////_controller->run(); //added by flq
        //_model->addObserver(&view);
        // Send Model Event to view
        //view.setCameraController(_controller);

        //Set Property Event Handler
        if(err == EDS_ERR_OK)
        {
            err = EdsSetPropertyEventHandler( camera, kEdsPropertyEvent_All, CameraEventListener::handlePropertyEvent , (EdsVoid *)_controller);
        }

        //Set Object Event Handler
        if(err == EDS_ERR_OK)
        {
            err = EdsSetObjectEventHandler( camera, kEdsObjectEvent_All, CameraEventListener::handleObjectEvent , (EdsVoid *)_controller);
        }

        //Set State Event Handler
        if(err == EDS_ERR_OK)
        {
            err = EdsSetCameraStateEventHandler( camera, kEdsStateEvent_All, CameraEventListener::handleStateEvent , (EdsVoid *)_controller);
        }
//delete mfc
        ///m_pMainWnd = &view;
        ///INT_PTR nResponse = view.DoModal();

    }

    //Release Camera
    if( camera != NULL )
    {
        EdsRelease(camera);
        camera = NULL;
    }

    //Termination of SDK
    if(isSDKLoaded)
    {
        EdsTerminateSDK();
    }

    if(_model != NULL)
    {
        delete _model;
        _model = NULL;
    }


    if(_controller != NULL)
    {
        delete _controller;
        _controller = NULL;
    }

    // Since the dialog has been closed, return FALSE so that we exit the
    //  application, rather than start the application's message pump.
    return FALSE;
}


