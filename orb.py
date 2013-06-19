#!/usr/bin/python
import cv2
import numpy

#TODO cvReprojectImageTo3

class orb:
	
	def __init__(self):
		#preset image matrix
		#cameraMatrix1
		self.surfDetect = cv2.FeatureDetector_create("ORB")
		self.surfExtract = cv2.DescriptorExtractor_create("ORB")

	def get_image(self,location):
		"""Grabs image converts to grayscale"""
		#TODO use imdecode and imencode to read and write image from/to memory rather than a file.
		img = cv2.imread(location, 0)	#Turns image gray automagically
		return img

	def doSurf(self,img1,img2):
		"""Step 1: Detects keypoints and computes SURF descriptors for them"""
		keyPoints_left = self.surfDetect.detect(img1)	#returns keypoints
		keyPoints_right = self.surfDetect.detect(img2)


		(lFeatures, keyPoints_left) = self.surfExtract.compute(img1, keyPoints_left)	#returns keypoints
		(rFeatures, keyPoints_right) = self.surfExtract.compute(img2, keyPoints_right)
		return lFeatures,rFeatures


	def main(self):
		imgLeft = self.get_image('lab_left.jpg')
		imgRight = self.get_image('lab_right.jpg')
		imgFeat_left,imgFeat_right = self.doSurf(imgLeft,imgRight)
		print imgFeat_left,imgFeat_right

if __name__ == "__main__":
	app = orb()
	app.main()


