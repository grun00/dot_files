#!/bin/bash
pactl load-module module-null-sink sink_name=Virtual1
pactl load-module module-loopback source=alsa_input.pci-0000_00_1f.3.analog-stereo sink=Virtual1
pactl load-module module-loopback source=Virtual1.monitor sink=bluez_sink.5C_C6_E9_22_18_98.a2dp_sink

