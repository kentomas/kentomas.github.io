# COM Port Capture - Linux

## List Available COM Ports

In most cases, the device file for the `serial port` is `created` `automatically` when the `serial device is plugged in` or powered on. The udev subsystem detects the device and creates the corresponding device file in the `/dev` directory, such as `/dev/ttyS0`, `/dev/ttyS1`, or `/dev/ttyUSB0`.

```sh
dmesg | grep tty | grep serial
```

```sh
ls /dev/ttyS* /dev/ttyUSB*
```

## Screen

To save data coming in from a `COM port` to a file in Linux, you can use the `screen` command in combination with shell redirection. First, open a terminal and type the following command:

```sh title="bash"
screen /dev/ttyUSB0 115200 > data.txt
```

Replace `/dev/ttyUSB0` with the appropriate `COM port device name` for your system, and `115200` with the `baud rate` of the incoming data. The `>` operator will redirect the `output to a file` named `data.txt`, which will be created in the current working directory.

To stop the screen session and save the data to the file, press `Ctrl-A` followed by `:`, and then type quit in the prompt that appears. The data will be saved in the `data.txt` file.

## Sample Bash Script

```sh title="save_data.sh"
#!/bin/bash
PORT="/dev/ttyUSB0"     # Replace with the appropriate COM port device name
BAUD_RATE="115200"      # Replace with the appropriate baud rate
OUTPUT_FILE="data.txt"  # Name of the output file

# Start the screen session and redirect the output to the file
screen $PORT $BAUD_RATE > $OUTPUT_FILE &

# Wait for user to stop the session
echo "Press any key to stop the screen session and save the data to $OUTPUT_FILE"
read -n 1 -s

# Stop the screen session and save the data to the file
pkill screen
```

Save the above code in a file named `save_data.sh` and make it executable using the following command:

```sh title="bash"
chmod +x save_data.sh
```

Then, you can run the script by typing `./save_data.sh` in the terminal. When you want to stop the `screen` session and save the data to the file, press any key, and the script will stop the session and save the data to the specified output file.

The data captured from a COM port using the method I described is usually raw data. By default, the screen command simply displays the raw data as it is received from the serial port.
