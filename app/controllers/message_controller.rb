require 'serialport'
class MessageController < ApplicationController
	def send_msg
		sp=SerialPort.new "/dev/ttyUSB5"

		sp.write "at+cnmi=0,1,1,1,0\r"
		sp.write "at+csmp=17,169,0,0\r"
		sp.write "at+cmgf=1\r"
		sleep 2
		sp.write "at+cmgs=09873079561\r"
		sp.write "dominos"
		hx="\x1A"
		sp.write hx
		binding.pry
		time1=Time.new
	end

	def read
		sp=SerialPort.new "/dev/ttyUSB5"

		sp.write "at+cnmi=0,1,1,1,0\r"
		sp.write "at+csmp=17,169,0,0\r"
		sp.write "at+cmgf=1\r"
		sleep 2
		sp.write "at+cmgl=\"all\"\r"
		sp
	end
end
