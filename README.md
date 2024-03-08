# TFSLOT: Clogging-free airspeed sensor

TFSLOT is a state-of-the-art airspeed sensor designed specifically for use in Unmanned Aerial Vehicles (UAVs). Utilizing the principle of the [Venturi effect](https://en.wikipedia.org/wiki/Venturi_effect) with a differential pressure sensor for accurate airspeed measurement, this device is also equipped with an integrated [Inertial Measurement Unit](https://en.wikipedia.org/wiki/Inertial_measurement_unit) (IMU). The unique design and features of TFSLOT01 solve common issues associated with Pitot tubes, offering a robust solution for aerial applications.

<p align="center">
  <img src="doc/img/TFSLOT_1_small.jpg" />
</p>

## TFSLOT01 features
- **High Resolution** at low airspeeds (below 10 m/s)
- **Configurable Sensitivity** by modifying the airfoil profile
- **Reduced Susceptibility to Clogging**, for instance, by mud or snow upon landing
- **Weatherproof**, it can be used in various conditions
- **Direct Differential Pressure Sensor Integration** without the need for additional tubing
- **Possibility of Direct Integration** into the drone's mechanical structure
- **Open Design** making the design documentation accessible
- **Integrated IMU Unit** for measuring vibrations, angle of attack, and more


## How It Works?
The TFSLOT01 sensor uses the Venturi effect to measure airspeed, allowing precise tracking of airspeed even at low speeds.

<p align="center">
  <img src="/doc/img/tfslot_crossection.svg" />
</p>


Air at a certain airspeed enters through an opening between two precisely defined airfoil profiles. As the depth within the sensor increases, the effective cross-section area decreases. Since the same volume of air must pass through a smaller cross-section, the flow velocity inside the sensor increases. As a result, based on the law of conservation of energy, the pressure decreases.

Inside the sensor, there are two sampling points connected to the differential pressure sensor by a channel. The measured pressure difference is then recalculated into the airspeed at the sensor's inlet. In addition to airspeed sensing, the sensor includes an integrated IMU unit that can also serve as an external magnetometer, because airspeed sensors are usually placed away from electromagnetic interference sources.

<p align="center">
  <img src="/doc/img/TFSLOT_4_small.jpg" />
</p>

## Where to get TFSLOT01?

<a href="https://www.tindie.com/products/thunderfly/tfslot01a-airspeed-sensor-with-integrated-imu/"><img src="https://d2ss6ovg47m0r5.cloudfront.net/badges/tindie-mediums.png" alt="I sell on Tindie" width="150" height="78" align="right"></a>

TFSLOT can be bought directly from us via our contact [email](https://www.thunderfly.cz/contact-us.html). The email can also be used if there are specific requirements for custom modifications or if the product will be inquired in large quantities. TFSLOT is also available for online purchase through the [Tindie store](https://www.tindie.com/products/thunderfly/tfslot01a-airspeed-sensor-with-integrated-imu/).


## Support and Integration

### Drone avionics
The TFSLOT01A sensor (PCB board [TFASPDIMU02A](https://github.com/ThunderFly-aerospace/TFASPDIMU02)) is currently supported by the PX4 autopilot, where it can be utilized both as an airspeed sensor and as an external IMU unit (external magnetometer). Instructions for integrating the sensor with the PX4 autopilot can be found in the official [PX4 documentation](http://docs.px4.io/master/en/sensor/airspeed.html#airspeed-sensors). The sensor is also hardware-compatible with other autopilots, such as Ardupilot, but currently lacks the computation code to convert differential pressure into airspeed.

### Robotics and measurement
For other applications, the sensor can be easily connected to any computer with an I2C interface, such as RaspberryPi or a generic desktop with a USB to I2C converter (e.g., [USBI2C02A](https://www.mlab.cz/module/USBI2C01/), [shop it on tindie](https://www.tindie.com/products/mlab-project/mlab-usbi2c01a-usb-to-smbusi2c-bridge/)), and the differential pressure values or values from the IMU unit can be read, for example, by a Python script.

# FAQ 
Frequently asked questions are listed on [TFSLOT's documentation page](https://docs.thunderfly.cz/avionics/TFSLOT01#faq)
