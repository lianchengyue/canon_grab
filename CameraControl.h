#ifndef CAMERACONTROL_H
#define CAMERACONTROL_H

#include "Camera/CameraController.h"
#include "Camera/CameraModel.h"


#if 0
class CameraControlMain
{
public:
    CameraControlMain();

// Overrides
    public:
    //virtual bool InitCamera();
    bool InitCamera();

    CameraModel*		_model;
    CameraController*	_controller;

    friend CameraController* getController();
    friend CameraModel* getModel();
};

//inline CameraController* getCameraController() {return static_cast<CameraControlMain*>(AfxGetApp())->_controller;}
//inline CameraModel* getCameraModel() {return static_cast<CameraControlMain*>(AfxGetApp())->_model;}
#else
    bool InitCamera();
    CameraModel*		_model;
    CameraController*	_controller;
#endif
#endif // CAMERACONTROL_H
