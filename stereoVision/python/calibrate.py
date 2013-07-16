#Class for calibrating Opencv stereoscopic camera
import cv2
import cv

class calibrate:

	def __init__(self):
		cv2.namedWindow("Calibrate")
		self.dims=(8,5)
		self.camImage=cv2.VideoCapture(-1)
		
	def doWork(self):
		while(True):
			s, frame = self.camImage.read()			
			bw_frame = cv2.cvtColor(frame,cv.CV_BGR2GRAY)	#TODO cv 1 reference? turn frame gray
			found,points = cv2.findChessboardCorners(bw_frame,self.dims)	#basic calibration
			print found
			if found!=True:
				cv2.drawChessboardCorners(bw_frame,self.dims,points,found)
				cv2.imshow("Calibrate",bw_frame)
				cv2.waitKey(10)

if __name__ == "__main__":
	run = calibrate()
	run.doWork()
