# EC544ProjectSpring2021

## Contents

**Report**

EC54_Locke_Wang_Final_Project_Report_20210426.pdf - Final report of our decentralized robot car project

**Presentation Videos**

- RoboCar EC544 3Min.mp4 -  [YouTube](https://youtu.be/axgf6HmUZ0g) - 3 minute short version of video for class.

- RoboCar EC544 8min - Large 540p.mov - [YouTube](https://youtu.be/axgf6HmUZ0g) - More detailed version of project presentation for interested viewers. **(warning Large file over 50M)**

**Robot Car**

- Robocode.py - Python script that runs the GPIO pins for the RaspberryPi to drive the wheel motors, and subscribes to the MQTT topic 'RoboCar/Command' to accept commands

- r2av6.stl - 3D file for adapter allowing us to securely mount the Raspberry Pi and power converter on the car intended for an Arduino Uno

**Lambda Function**

- index.js - main node.js file for lambda function to query Ethereum test wallet balance and publish commands to MQTT topic 'RoboCar/Command' to give robot commands

- node_modules.zip - required files for methods invoked in lambda function not natively supported in AWS

**Smart Contract**

- Project_init.sol - Solidity contact file to negotiate Ethereum test wallets and set commands for robot.
