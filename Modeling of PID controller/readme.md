# Modeling of PID controller-based d.c. Motor
This project demonstrates the implementation of a Proportional-Integral-Derivative (PID) controller to control the speed of a DC motor. A PID controller is a widely used control algorithm in engineering and automation systems to maintain a desired setpoint by adjusting the control output.

In this project, we model a DC motor and use a PID controller to regulate its speed. This README provides an overview of the project, instructions for setting it up, and basic usage guidelines.


![Model](https://user-images.githubusercontent.com/90020325/216801120-c42f0496-eb28-4581-917c-bd3ec0cc4804.jpg)

## What is a PID Controller?
A PID controller is a feedback control system that continuously calculates an error value as the difference between a desired setpoint (SP) and a measured process variable (PV) and applies a correction based on proportional, integral, and derivative terms. These terms are weighted and summed to produce the control output.

### Proportional (P): 
The proportional term produces an output value that is proportional to the current error value. It is responsible for reducing the error by applying a correction that is proportional to the error magnitude.

### Integral (I): 
The integral term takes into account the accumulation of past errors and is used to eliminate any remaining steady-state error. It acts as a kind of "memory" of past errors.

### Derivative (D): 
The derivative term anticipates future error, based on its rate of change. It is used to prevent overshooting and oscillations.
