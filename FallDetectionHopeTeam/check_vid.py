import numpy as np
import cv2
import datetime

cap = cv2.VideoCapture(0)
fourcc = cv2.VideoWriter_fourcc('V','P','8','0')
now = datetime.datetime.now()
date_time = now.strftime("%m-%d-%Y_%H:%M:%S")
fomat = '/home/dylan/NetBeansProjects/WebVer2/web/DataOut/outputimg__'+ date_time+'.webM'
print(fomat)
out = cv2.VideoWriter(fomat,fourcc, 5, (640,480))
while(True):
    # Capture frame-by-frame
    ret, frame = cap.read()
    # print(frame)

    # Our operations on the frame come here
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Display the resulting frame
    cv2.imshow('frame',gray)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
    out.write(frame)
out.release()

# When everything done, release the capture
cap.release()
cv2.destroyAllWindows()