# Room Acoustics Calculator

A simple interactive calculator that displays multiple room acoustics parameters.

## Statement of Purpose and Scope

The purpose of this calculator is to facilitate access to on-the-go measurements of room acoustics parameters. Being fairly complicated to conduct, such measurements often require professional equipment and digital signal processing techniques, which can be very expensive and impractical in many circumstances. Notwithstanding the necessary technologies, what makes calculating room acoustics parameters cumbersome is the plethora of equations that are dependent on one another. Indeed, there are quite a few softwares the solve this problem, although they are used by engineers or consultants rather than the general public. 

A particular use case of a room acoustics calculator would be for when musicians, video editors, or even sound designers are looking to treat their studios (or home studios) with the appropriate acoustic materials. In cases like such, a robust acoustic analysis of a room would not be necessary; rather, simple and on-the-go estimates of how sound would behave before and after treatment can be good enough.

### Functionalities 

As soon as the user load the application, a Welcome window introduces them to all the possible calculations they can perform, as well as with an option to exit the program. Each calculation has its own menu, which introduces the user to what will be displayed and how should they use it. On the other hand, the main menu simply asks the user what do they want to calculate, as shown in the image below.

<img src="images/main-menu.png" alt="main-menu" style="zoom: 50%;" />

In the Sound Level menu, the user is presented with a total of four calculations, and the option to exit the program. The four calculations are the following.

1. **Level Attenuation Over Distance**

   Level attenuation is concerned with how loud the sound source will be at the receiver distance. The sound pressure level (SPL) of the source is usually measured at 1m from it, and for every doubling of distance there will be a reduction of 6 decibels (dB). For example, if the sound pressure level of someone singing is 70 dB at 1m, at 2m the resulting SPL will be 64 dB; at 4m it will be 58 dB, and so on. The formula for calculating this is shown below.

2. **Level Conversion (Sound Power Level to Sound Pressure Level, or Vice-Versa)**

   The difference between sound power level and sound pressure level is that the former is related to the acoustic energy that is emitted from the sound source itself. On the other hand, sound pressure level is essentially what we hear. Another way of thinking about this is with light bulbs. 

3. **Sum and Average of Levels**

   

4. **A-Weighting Conversion**

   



## Features List - MVP

- As a user, I want to be able to calculate everyday parameters, such as sound level attenuation over distance, conversion between sound power level and sound pressure level, and check the speed of sound in relation to temperature.

- As a user, I want to be able to check how loud will many different sound sources be (e.g. two or more loudspeakers; overall level of one or multiple construction sites near offices, schools, or hospitals).

- As a user, I want to estimate the reverberation time of a room in relation to the amount of absorption it has. 

  

## Features List - Future Implementations

- As a user, I would like to know whether the estimated reverberation time of a room is within the recommended values established by the Australian / New Zealand Standard  ***"Acoustics - Recommended design sound levels and reverberation times for building interiors (AS/NZS 2107-2016)"***.

- As a user, I would like to be able to calculate the amount of room modes (frequency resonances), given the dimensions of a room.

  

## User Experience Details

- The app has a very simple design, in that the interactions are made by displaying welcoming instructions to the user, requesting input, then displaying the calculation results to the user.

  

## How to Install and Use

#### Dependencies:

- Ruby
- Colorize (Ruby Gem)
- TTY-Prompt (Ruby Gem)
- RSpec (Ruby Gem)

#### To install and run:

Installing the Gems:

- `$ gem install colorize`

- `$ gem install tty-prompt`

- `$ gem install rspec`

  

  

