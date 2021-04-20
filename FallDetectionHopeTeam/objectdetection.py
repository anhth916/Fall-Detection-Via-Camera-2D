#Import lib
from base64 import b64decode, b64encode
import cv2
import numpy as np
import PIL 
import io
import html
import time
import matplotlib.pyplot as plt
import os
import darknet
from darknet.darknet import *
from optical_flow import *
from classification import detection
import datetime
from twilio.rest import Client
import os

# darknet helper function to run detection on image
def darknet_helper(img, width, height):
  darknet_image = make_image(width, height, 3)
  img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
  img_resized = cv2.resize(img_rgb, (width, height),
                              interpolation=cv2.INTER_LINEAR)

  # get image ratios to convert bounding boxes to proper size
  img_height, img_width, _ = img.shape
  width_ratio = img_width/width
  height_ratio = img_height/height

  # run model on darknet style image to get detections
  copy_image_from_bytes(darknet_image, img_resized.tobytes())
  detections = detect_image(network, class_names, darknet_image)
  free_image(darknet_image)
  return detections, width_ratio, height_ratio

if __name__ == "__main__":

  # load in our YOLOv4 architecture network
  network, class_names, class_colors = load_network("/home/dylan/Fall_Detection_Via_Camera_2D/FallDetectionHopeTeam/darknet/cfg/yolov4-csp.cfg", "/home/dylan/Fall_Detection_Via_Camera_2D/FallDetectionHopeTeam/darknet/cfg/coco.data", "/home/dylan/Fall_Detection_Via_Camera_2D/FallDetectionHopeTeam/yolov4-csp.weights")
  width = network_width(network)
  height = network_height(network)

  #defind var
  stream = cv2.VideoCapture(0)
  # stream.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
  # stream.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)
  fall_list_temp = []
  fall_list_ans = []
  count_frame = 0
  check_fall = False

  while True:
    ret, frame = stream.read()
    # cv2.imshow("Frame",frame)
    print(frame.shape)
    if not ret:
      break

    # run test on person.jpg image that comes with repository
    fall_list_temp.append(frame)
    if(len(fall_list_temp) > 11):
      fall_list_temp.remove(fall_list_temp[0])
    detections, width_ratio, height_ratio = darknet_helper(frame, width, height)

    for label, confidence, bbox in detections:
      if str(label) == 'person':
        left, top, right, bottom = bbox2points(bbox)
        for (x , y , w , h) in [bbox]:
          if w/h > 0.7:   
            count_frame+=1
          elif (count_frame > 0):
            count_frame-=1
          if w/h <0.7 and check_fall == True:
            print('check condition!!!!!!!!!!11')
            check_fall = False

        if count_frame == 6 and check_fall == False:
          fall_list_ans.append(fall_list_temp)
          count_frame = 0
          check_fall = True
          fall_list_ans_array = np.array(fall_list_temp)
          fall_list_ans_array = np.squeeze(fall_list_ans_array)
          print('Processing.....................')
          # print("Shape fall:",fall_list_ans_array)

          input_cnn = covent_before_add_to_NN(fall_list_ans_array)
          # print("Shape cnn",input_cnn.shape)
          output = detection(input_cnn)
          output = output.numpy()
          output = np.squeeze(output)
          theshold_tradinh=1
          if output < theshold_tradinh:
            print("Results: Fall")
            fourcc = cv2.VideoWriter_fourcc('V','P','8','0')
            now = datetime.datetime.now()
            date_time = now.strftime("%m-%d-%Y_%H:%M:%S")
            fomat = '/home/dylan/NetBeansProjects/WebVer2/web/DataOut/outputimg__'+ date_time+'.webM'
            print(fomat)
            out = cv2.VideoWriter(fomat,fourcc, 5, (640,480))
            for i in fall_list_temp:
              # print('checkvid',i.shape)
              out.write(i)
            out.release()

            ##send email
            client = Client("AC5ac402e636402e657572ba8e54df5bd8", "2d9905b9f26f553af07c9c8c850c7e0d")
            message = client.messages \
                .create(
                    body='Warning - Your family member may have fallen. Please login to the website to check video record!',
                    from_='+13396746852',
                    to='+84975796998'
                )

            print(message.sid)
            #########
          else:
            print("Results: Not Fall")
          
        print(check_fall)
        left, top, right, bottom = bbox2points(bbox)
        left, top, right, bottom = int(left * width_ratio), int(top * height_ratio), int(right * width_ratio), int(bottom * height_ratio)
        cv2.rectangle(frame, (left, top), (right, bottom), class_colors[label], 2)
        cv2.putText(frame, "{} [{:.2f}]".format(label, bbox[2]/bbox[3]),(left, top - 5), cv2.FONT_HERSHEY_SIMPLEX, 0.5,class_colors[label], 2)
    # fall_list_ans_array = np.array(fall_list_ans)
    # fall_list_ans_array = np.squeeze(fall_list_ans_array)
    # input_cnn = covent_before_add_to_NN(fall_list_ans_array)
    # print("Shape cnn",input_cnn.shape)
    # print("Fall list",fall_list_ans_array.shape)
    cv2.imshow("Frame",frame)
    if cv2.waitKey(1) & 0xFF == ord('q'):
      break
  cv2.destroyAllWindows()

