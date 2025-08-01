# lcls-plc-las-lps-01
This repository contains the PLC code for Bay 03 LPS

In order to deliver beam from the OPCPA and MPC in parallel during the runs, we need to carefully monitor the Carbide, AMPHOS, OPCPA, and MPC to prevent damaging the lasers and associated equipment. Since the MPC requires _only_ the Carbide, but the OPCPA requires both the Carbide & AMPHOS, arbitrating the shutter and enable states of the lasers can be tricky. 

Interlock logic currently follows the truth table described here:
https://confluence.slac.stanford.edu/spaces/~hysong/pages/601692933/New+LPS

All hardware, chiller, and over-temperature faults are latching and must have the latch reset in order for errors to clear.

The state machine of the protection system can be simplified into running in one of three modes:
1) **Master Override**
    * All hardware and power meter interlocks are explicitly ignored. This is the debug mode for laser engineering and poses the highest risk to the laser system, but allows the users to ignore false-positives or limp with known failures that are awaiting parts.
    * The AMPHOS is _always_ enabled in this mode, but the shutter state will be inherited from its previous value. The **Amphos Shutter Command** button in the **Maser Controls** box allows the user to manually override the AMPHOS shutter state.
    * The Carbide shutter is _always_ opened in this mode.

2) **Protection**
    * If any hardware fault, chiller flow fault, or over-temperature fault (on shutters) throw, then the AMPHOS will be disabled and both shutters will close for the AMPHOS and Carbide.
    * If the AMPHOS power meter falls below nominal value, the AMPHOS will be disabled and the shutter will be closed.
    * If the MPC power meter is above the nominal value, then the Carbide shutter will be opened _unless_ the OPCPA power meter falls below its nominal value.

3) **AMPHOS Maintenance**
    * If any hardware fault, chiller flow fault, or over-temperature fault (on shutters) throw, then the AMPHOS will be disabled and both shutters will close for the AMPHOS and Carbide.
    * Else, the AMPHOS is always enabled and inherits the shutter state from its previous value analagous to the **Master Override** state.
    * If the MPC power meter is above the nominal value, then the Carbide shuttter will be opened.

# System Overview GUI
<img width="1438" height="699" alt="image" src="https://github.com/user-attachments/assets/dab2b7f8-5ae9-4531-819b-9f51bc393bbb" />

# Laser Settings Expert screens
<img width="630" height="1293" alt="image" src="https://github.com/user-attachments/assets/958bfcd9-2706-4580-9cb5-2a64f8bd9f10" />
