#!/usr/bin/python
import cv2
import numpy

#TODO cvReprojectImageTo3

class rectify:
	
	def __init__(self):
		#preset image matrix
		#cameraMatrix1
		pass

	def get_image(self,location):
		"""Grabs image converts to grayscale"""
		#TODO use imdecode and imencode to read and write image from/to memory rather than a file.
		img = cv2.imread(location, 0)	#Turns image gray automagically
		return img

	def findFeatures(self,img1,img2):
		"""Step 1: Finds all good features of images"""
		lFeatures = cv2.goodFeaturesToTrack(img1,10,.01,10)
		rFeatures = cv2.goodFeaturesToTrack(img2,10,.01,10)		
		print self.findCorner(lFeatures)
		return lFeatures,rFeatures

	def findCorner(self,A):
		"""Step 2: Improve all good features"""
		B = cv2.cornerSubPix(A,(0,0),(5,5),(-1,-1),10)
		return B


	def rectifyImage(self):
		imgLeft = self.get_image('lab_left.jpg')
		imgRight = self.get_image('lab_right.jpg')
		imgFeat_left,imgFeat_right = self.findFeatures(imgLeft,imgRight)

		





		'''imgLh, imgLw = imgLeft.shape[:2]
		imgRh, imgRw = imgRight.shape[:2]
		retval, mask = cv2.findFundamentalMat(imgLeft, imgRight) [0]'''
		'''cv2.imshow("test", imgLeft)
		cv2.waitKey(5000)'''
		



		#cv2.stereoRectifyUncalibrated(points1, points2, F, imgSize[, H1[, H2[, threshold]]]) -> retval, H1, H2

if __name__ == "__main__":
	app = rectify()
	app.rectifyImage()
