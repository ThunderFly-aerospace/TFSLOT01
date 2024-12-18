## TFSLOT01: Clogging-Free Airspeed Sensor for UAVs

An innovative Venturi-effect airspeed sensor with a 9-axis IMU and customizable design. Open-source and ideal for low-speed UAVs.

---

### Overview

The **TFSLOT01 sensor** is a next-generation airspeed sensor designed for UAVs, leveraging the Venturi effect for superior performance at low airspeeds. This clog-resistant design is coupled with an integrated 9-axis IMU to be ready for additional diagnostic capabilities like vibration monitoring and angle-of-attack measurements.

This product is fully open-source, with a customizable 3D-printed case for seamless integration into UAV designs. Whether you're a developer, researcher, or enthusiast, the TFSLOT01 provides reliability, adaptability, and advanced functionality.


---

### Key Features

- **Clog-Resistant Design**: Venturi-based measurement reduces clogging risks, ideal for low-speed UAVs.
- **Integrated IMU**: Features a 9-axis IMU (magnetometer, accelerometer, gyroscope) for advanced diagnostics.
- **Customizable**: 3D-printed case can be adapted to specific applications.
- **Weatherproof Build**: IP42-rated for reliable operation in diverse conditions.
- **Enhanced Resolution**: Optimized for speeds below 10 m/s.
- **Direct Integration**: No need for additional tubing, reducing maintenance concerns.

---

### Technical Specifications

| **Parameter**          | **Value**            | **Description**                           |
|-------------------------|----------------------|-------------------------------------------|
| Airspeed Range          | 0 - 48 m/s          | Assumes air density of 1.29 kg/m³         |
| Dimensions              | 35 x 40 x 35 mm     | Default 3D-printed case                   |
| Weight                  | 25 g                | Compact and lightweight                   |
| Operating Temperature   | −20°C to +40°C      | Reliable in diverse weather              |
| Input Voltage           | +3.6V to +5.4V      | Overvoltage protection included           |
| I2C Connector           | 4-pin JST-GH        | Pixhawk-compatible standard               |
| Weather Resistance      | IP42                | Protection against dust and water splashes|


The sensor can operate at any altitude, but sensitivity decreases as air density drops. See the documentation for details.

---

### Compatibility

- **PX4 Autopilots**: Full airspeed and IMU integration.
- **Ardupilot**: Hardware-compatible (airspeed calculations require manual configuration).
- **Custom Systems**: Supports I2C interfaces.

Follow the [PX4 integration guide](http://docs.px4.io/master/en/sensor/airspeed.html#airspeed-sensors) for setup.

---

### Included in the Package

- TFSLOT01 sensor (assembled and ready to use)
    - 3D-printed protective case
    - Sealing O-rings
    - Optional I2C cable

---

### Accessories

For enhanced reliability and flexibility, we offer high-quality [I2C cables](https://www.tindie.com/products/thunderfly/tfcab15i2c01-15-cm-i2c-cable-for-pixhawk-drones/), specially designed to minimize electromagnetic interference.

---

### Product Changelog

- **TFSLOT01C (2024)**: Enhanced mounting options for broader compatibility.
- **TFSLOT01B (2022)**: Upgraded electronics for better performance.
- **TFSLOT01A (2021)**: Initial prototype (not publicly released).

For full details, visit the [releases](https://github.com/ThunderFly-aerospace/TFSLOT01/releases).

---

### Why Choose TFSLOT01?

Traditional Pitot tubes often struggle with clogging and poor resolution at low airspeeds. The TFSLOT01 sensor eliminates these issues with its innovative Venturi-effect design. Its customizable case and open-source design make it the perfect choice for UAV enthusiasts and professionals.

For more detailed technical information, please see the full [documentation](https://docs.thunderfly.cz/avionics/TFSLOT01/).

