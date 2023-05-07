## What is it?

The sensor works on the principle of the Venturi effect. In addition to airspeed measurement, it contains an IMU unit. The sensor can also function as an external magnetometer.

## Why did you make it?

We designed the TFSLOT sensor because we needed a reliable airspeed sensor for our drones and we were not satisfied with the solutions already available on the market. Drones are usually equipped with Pitot tubes that face many problems. TFSLOT sensor is designed precisely to overcome these problems.

## What makes it special?

TFSLOT offers an innovative way to measure airspeed, which is especially suitable for slow-flying drones.

### Advantages over the commonly used pitot tube:
The design brings several advantages when used on small-scale and slow-flying UAVs

- Better resolution on low airspeeds (below 10 m/s)
- Configurable sensitivity by changing the airfoil profile
- Less tendency to clog (for example, by clay or snow after landing)
- Weatherproof (raining, snow, dust, ice..)
- Direct differential pressure sensor integration without any additional tubing. - Less chance of sensor malfunction caused by tubing leaks
- Possibility of direct integration into the mechanical construction of the drone. Design is fully open source
- Integrated external IMU unit, which could measure vibrations, angle of attack, etc. 

Another special function of the TFSLOT sensor is the integrated 9-axis IMU unit (magnetometer, accelerometer, and gyroscope). The sensor can be used as an external compass for the autopilot and it can improve the estimation of orientation in space. Accelerometer data, on the other hand, can be used to check vibrations. 

## What is the sensor supported for? 

TFSLOT (PCB board TFASPDIMU02A) is currently supported by PX4 autopilot, where it can be used as an airspeed sensor and as an external IMU unit (external compass). Instructions on how to get this sensor to work with the PX4 autopilot can be found in the official [PX4 documentation](http://docs.px4.io/master/en/sensor/airspeed.html#airspeed-sensors)

TFSLOT is also hardware compatible with other autopilots (Ardupilot), but it does not currently contain a calculation for converting differential pressure to airspeed. 

If you need an airspeed sensor for other uses, it can be very easily connected to any computer with an i2c interface (for example RaspberryPi or a generic desktop with a USB to I2C converter - for example, [USBI2C01A](https://github.com/mlab-modules/USBI2C01)). The value of the differential pressure or values from the IMU unit can then be read, for example, by a python script.

## The package includes:
- TFASPDIMU02A (sensor board)
- TFSLOT01A (plastic case, color may vary, screws included)
- Sealing O-rings
- I2C cable (with JST-GH connectors, optionally)

The product is assembled and ready to use.


## Accessories

### I2C cables
I2C cables for connecting to the autopilot are not included in the package. You will need to purchase the cables separately from our [tindie catalog](https://www.tindie.com/stores/thunderfly/). We offer high-quality cables that are compatible with the [Pixhawk standard](https://raw.githubusercontent.com/pixhawk/Pixhawk-Standards/master/DS-009%20Pixhawk%20Connector%20Standard.pdf) and with a [ThunderFly color](https://docs.px4.io/main/en/assembly/cable_wiring.html#i2c-cables) scheme for easy signal identification. Our cables are specifically designed with improved resistance to electromagnetic interference and a silicone insulator that makes them highly flexible.

  * [TFCAB15I2C01](https://github.com/ThunderFly-aerospace/TFCAB01) [Buy at Tindie](https://www.tindie.com/products/thunderfly/tfcab15i2c01-15-cm-i2c-cable-for-pixhawk-drones/)
