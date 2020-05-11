# FLINT Chapman Richards

A Tier 3<sup>[1](#footnote1)</sup> method is used for estimation of aboveground carbon for forests, as estimated using the Chapman-Richards function (eqn. 1). The curve provides an estimate of total aboveground biomass based on age. Belowground biomass is calculated as a ratio from aboveground biomass. The equations are within the Forest Growth Module.

### Eqn. 1 Chapman-Richards Function

<img src="https://render.githubusercontent.com/render/math?math=AGC=max\times[1-e^{-k\cdot age}]^{(1/1-m)}">

where: 

AGC	— Aboveground stand carbon (Tonnes carbon per hectare); 

max	— asymptote – maximum peak carbon yield (Tonnes carbon per hectare); 

k	— parameter used in modeling tree growth, dimensionless; 

age	— age of the forest (years); 

m	— parameter used in modeling tree growth, dimensionless.

<a name="footnote1" href="https://www.ipcc-nggip.iges.or.jp/public/2006gl/pdf/4_Volume4/V4_04_Ch4_Forest_Land.pdf">1</a>: Volume 4: Agriculture, Forestry and Other Land Use - Chapter 4 Forest Land

### Development Environment How-To for Windows

Follow the following guide for the base FLINT development environment

https://github.com/moja-global/FLINT#development-environment-how-to-for-windows

Once this is completed, start a command shell where you cloned this repository and change to the source folder then use the following commands to create the Visual Studio solution:

```powershell
# Create a build folder 
mkdir build
cd build

# now create the Visual Studio Solution (2019)
cmake -G "Visual Studio 16 2019" -DCMAKE_INSTALL_PREFIX=C:/Development/Software/moja -DVCPKG_TARGET_TRIPLET=x64-windows -DCMAKE_TOOLCHAIN_FILE=c:\Development\moja-global\vcpkg\scripts\buildsystems\vcpkg.cmake ..
```

