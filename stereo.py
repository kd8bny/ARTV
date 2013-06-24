import cv2
import numpy

class stereo:

	def __init__(self):
		self.imgL = cv2.imread('lab_left.jpg')
		self.imgR = cv2.imread('lab_right.jpg')
		#self.imgL = cv2.pyrDown(self.imgL)
		#self.imgR = cv2.pyrDown(self.imgR)
	def initVal(self):
		pass


	def getObj(self):
		min_disp = 0
		num_disp = 32
		sad = 11
		p1 = 216
		p2 = 864
		dispcheck = 1
		prefilter = 63
		unique = 15
		speckleWindow = 100
		speckleRange = 1
		fulldp = False 
		
		stereoObject = cv2.StereoSGBM(min_disp,num_disp,sad,p1,	p2,	dispcheck,prefilter,unique,	speckleWindow,speckleRange,	fulldp)
		disp = stereoObject.compute(self.imgL, self.imgR)
		disp *= 255/(disp.min()-disp.max())
		disp = disp.astype(numpy.uint8)
		return disp

	def dimmap(self,disp):
		dimmap = cv2.reprojectImageTo3D(disp)
		return dimmap
	
	def show(self):
		view = self.getObj()
		#dimview = self.dimmap()
		cv2.imshow("view", view)
		#cv2.imshow("dimview", dimview)
		cv2.waitKey()

if __name__ == "__main__":
	app = stereo()
	app.show()
