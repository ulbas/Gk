import serial
import pymongo
import time
import datetime
from pymongo import MongoClient
import RFM69
from RFM69registers import *

#Kommunikasjonsdel
test = RFM69.RFM69(RF69_915MHZ, 1, 1, True)
print "class initialized"
print "reading all registers"
results = test.readAllRegs()

test.rcCalibration()
print "setting high power"
test.setHighPower(True)
test.encrypt("1234567891011121")
if test.sendWithRetry(2, "blah", 3, 20):
    print "ack recieved"
print "reading"

#Databasedel
BruktPakke = ""
client= MongoClient()
db= client.test_database
ser = serial.Serial('COM4', baudrate = 9600, timeout=11)
while 1:
	test.receiveBegin()
    while not test.receiveDone():
        time.sleep(.1)
    print "%s from %s RSSI:%s" % ("".join([chr(letter) for letter in test.DATA]), test.SENDERID, test.RSSI)
    datapakke =  "%s from %s RSSI:%s" % ("".join([chr(letter) for letter in test.DATA]), test.SENDERID, test.RSSI)
    if test.ACKRequested():
        test.sendACK()

	datapakke = ser.readline().decode('ascii')

	if BruktPakke != datapakke:
		NodeID = datapakke[0:8]
		Temp = datapakke [8:16]
		fukt = datapakke[16:24]	
		lys = datapakke [24:31]
		royk = datapakke[31]
		PIR = datapakke[32]
		DatoTid = datapakke[33:74]

		NodeIDdes = (int(NodeID,2))
		Tempdes = (int(Temp,2))
		fuktdes = (int(fukt,2))
		lysdes = (int(lys,2))
		roykdes = (int(royk,2))
		PIRdes = (int(PIR,2))

		ar = DatoTid[0:14]
		maned = DatoTid[14:18]
		dag = DatoTid[18:23]
		timer = DatoTid[23:28]
		Min = DatoTid[28:34]
		sek = DatoTid[34:40]

		ardes = (int(ar,2))
		maneddes = (int(maned,2))
		dagdes =(int(dag,2))
		timerdes = (int(timer,2))
		mindes = (int(Min,2))
		sekdes = (int(sek,2))

		tidpost = [str(timerdes) +"/" + str(mindes) + "/" + str(sekdes) + "/" + str(dagdes) +"/" + str(maneddes) + "/" + str(ardes)]
		collection = db["Node "+str(NodeIDdes)]
		post = {"NodeID": NodeIDdes,
				"temperatur": Tempdes,
				"fuktighet": Tempdes,
				"Lys": lysdes,
				"Royk": roykdes,
				"PIR": PIRdes,
				"tid/dato": tidpost
				}
		BruktPakke = datapakke
		collection.insert_one(post)
		print (post)