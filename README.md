# TFSLOT01A - Venturi effect airspeed sensor for UAVs

![TFSLOT01A prototype](doc/img/TFSLOT_1_small.jpg)

Our [TFSLOT](https://github.com/ThunderFly-aerospace/TFSLOT01) sensor is an airspeed sensor designed to use on UAVs. Due to 3D printed case it is possible to optimize the characteristics according to the location of sensor on UAV and specific application. First use of this sensor is on ThunderFly autogyro [TF-G2](https://github.com/ThunderFly-aerospace/TF-G2/).

TFSLOT is commercially available from [ThunderFly s.r.o.](https://www.thunderfly.cz/), write an email to info@thunderfly.cz or shop at [Tindie store](https://www.tindie.com/stores/thunderfly/).

# Advantages to pitot-static tube

In contrast to classical [Pitot tube](https://en.wikipedia.org/wiki/Pitot_tube), the TFSLOT design is perfect choice for low airspeed measurement (generally bellow 10 m/s).
The design has the following advantages compared to a pitot-probe:

  * Better resolution on low airspeeds
  * Less tendency to clogging
  * Direct differential pressure sensor integration without any additional tubing.

# Usage 

TFSLOT is equipped with [TFASPDIMU](https://github.com/ThunderFly-aerospace/TFASPDIMU02) electronics, which contains the required differential pressure sensor and an IMU unit through which the pressure sensor is connected. To activate I2C access to it, it is necessary to set the pass-through mode in the IMU unit. 

## PX4 autopilot

PX4 is able to initialize the sensor itself. All you have to do is add the following two lines to the [startup configuration file](https://docs.px4.io/master/en/concept/system_startup.html#replacing-the-system-startup) on the Autopilot's SD card.

```
icm20948_i2c_passthrough start -X -b 2 -a 0x68
sdp3x_airspeed start -X
```

The script assumes a connection to port _I2C 2_. This was set by the `-b` parameter in both commands. The correct bus has to be set by the user. 

> The model for converting to the airspeed from an air pressure is not yet in the stable version of PX4 autopilot source code. Therefore the master upstream need to be used with the sensor. 

Sensor requires firmware with modifications from the [`tf/aspdimu`](https://github.com/ThunderFly-aerospace/PX4Firmware/tree/tf/aspdimu) branch. The GitHub [pull-request](https://github.com/PX4/PX4-Autopilot/pull/18593) into PX4 master is currently opened to solve this issu. The airspeed recalculation model should be included in the next stable release. Alternatively, you can temporarily applicate [this patch](https://github.com/PX4/PX4-Autopilot/compare/master...ThunderFly-Aerospace:tf/aspdimu).

### Configuration

TFSLOT01 contains specific aerodynamic profile. Therefore it requires different convernig model. This is done by setting parameter `CAL_AIR_CMODEL` to 3 (Venturi effect based airspeed sensor). Setting the wrong profile cause measurument of negative airspeed values, which results in `airspeed sensor failure` condition during the attempt to fly. 

## PX4 Calibration process

![PXL_20220217_075317802](https://user-images.githubusercontent.com/5196729/154793903-b117aa99-cfa2-4d6b-bd6c-e1d15e969b36.jpg)

The sensor itself is calibrated and the PX4 calibration process aims to verify that the sensor is properly mounted and connected. Thanks to the used sensor, this sensor is not sensitive to temperature changes and has zero offset. The sensor can only be calibrated (verified) once at when it is mounted into UAV. And there is no need to do it before each flight (as with other types of airspeed sensors). 

### The verification process

The procedure is performed with the help of calibration tool in few steps:
  1. Place the calibration tool in the TFSLOT inlet
  1. Press the tool against the sensor (green arrow) with your hand or rubber band and hold it there during the whole process. 
  1. Start the [callibration process](https://docs.px4.io/master/en/config/airspeed.html#performing-the-calibrationhttps://docs.px4.io/master/en/config/airspeed.html#performing-the-calibration) in PX4
      1. Wait for measure of static offset (no blowing)
      1. PX4 will command you to blow into airspeed sensor
  1. Blow from the back of the sensor (blue arrow). If you blow a little, repeat the attempt. 
  1. PX4 calibration should be completed, confirmed by a beep and in the QGC. 

![calibration procedure](https://user-images.githubusercontent.com/5196729/154794029-8daf515e-4c26-449b-a836-17f068259a1b.png)
