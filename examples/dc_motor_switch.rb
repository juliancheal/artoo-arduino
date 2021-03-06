require 'artoo'

#Circuit's breadboard layout here: http://learn.adafruit.com/adafruit-arduino-lesson-13-dc-motors/breadboard-layout

connection :firmata, :adaptor => :firmata, :port => '/dev/ttyACM0' # linux
#connection :firmata, :adaptor => :firmata, :port => '127.0.0.1:8023'
device :board, :driver => :device_info
device :motor, :driver => :motor, :switch_pin => 3 # Use a digital or PWM pin

work do
  puts "Firmware name: #{board.firmware_name}"
  puts "Firmata version: #{board.version}"
  puts "Stopping motor..." #just in case
  motor.stop
  sleep 3

  every 3.seconds do
    motor.toggle
    puts "Motor is #{motor.on? ? 'on' : 'off'}"
  end

end
