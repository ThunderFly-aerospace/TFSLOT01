## Overview

The TFSLOT sensor is a cutting-edge airspeed sensor with an integrated 9-axis IMU unit. Designed to offer a reliable and innovative solution for drones, the sensor is fully open-source and offers a range of features that set it apart from traditional Pitot tubes.

---

## Table of Contents
1. [Features](#features)
2. [Advantages](#advantages)
3. [Technical Specifications](#technical-specifications)
4. [Compatibility](#compatibility)
5. [What's Included](#whats-included)
6. [Accessories](#accessories)

---

## Features <a name="features"></a>

- **Airspeed Measurement**: Utilizes the Venturi effect principle for accurate airspeed data.
- **Integrated IMU**: Contains a 9-axis IMU unit (magnetometer, accelerometer, and gyroscope).
- **External Magnetometer**: Can function as an external compass for autopilots.
- **Weatherproof**: Designed to withstand various weather conditions.

---

## Advantages Over Traditional Pitot-static Tubes <a name="advantages"></a>

- **High Resolution**: Better resolution at low airspeeds (below 10 m/s).
- **Configurable Sensitivity**: The Airfoil profile can be changed for different sensitivity levels.
- **Reduced Clogging**: No stagnation point, reducing the risk of clogging by clay or snow.
- **Direct Sensor Integration**: Eliminates the need for additional tubing, reducing the risk of leaks.
- **Open-Source Design**: Allows for direct integration into the drone's mechanical construction.
- **Additional Metrics**: Integrated IMU can measure vibrations, angle of attack, and more.

---

## Technical Specifications <a name="technical-specifications"></a>

| Parameter | Value | Description |
|-----------|-------|-------------|
| Airspeed Range | 0 - 48 m/s | Assumes air density of 1.29 kg/m³ |
| I2C Connector | 4-pin JST-GH | [Pixhawk Standard](https://github.com/pixhawk/Pixhawk-Standards/blob/master/DS-009%20Pixhawk%20Connector%20Standard.pdf) |
| Operating Temperature | −20°C to +40°C | Limited by case material |
| Input Voltage | +3.6V to +5.4V | Overvoltage protected by Zener diode |
| Mass | 25g | With included 3D printed case |
| Dimensions | 35x40x35mm | Default 3D printed case |
| Weather Resistance | [IP42](https://en.wikipedia.org/wiki/IP_Code) | External connectors fully occupied |

---

## Compatibility <a name="compatibility"></a>

- **PX4 Autopilot**: Fully supported and can be used as both an airspeed sensor and an external IMU.
- **Ardupilot**: Hardware compatible but lacks airspeed calculation.
- **Other Systems**: Easily connectable to any computer with an I2C interface, such as RaspberryPi.

> [PX4 Documentation for Setup](http://docs.px4.io/master/en/sensor/airspeed.html#airspeed-sensors)

---

## What's Included <a name="whats-included"></a>

- TFASPDIMU02A (Sensor board)
- TFSLOT01A (Plastic case, color may vary)
- Sealing O-rings
- I2C cable (optional)

> The product is assembled and ready to use.

---

## Accessories <a name="accessories"></a>

Additional I2C cables are not included but can be [purchased separately](https://www.tindie.com/products/thunderfly/tfcabxxi2c01-i2c-cable-for-pixhawk-drones/). Our cables are designed for high resistance to electromagnetic interference and flexibility.

- [TFCAB15I2C01](https://github.com/ThunderFly-aerospace/TFCAB01) [Buy at Tindie](https://www.tindie.com/products/thunderfly/tfcab15i2c01-15-cm-i2c-cable-for-pixhawk-drones/)
