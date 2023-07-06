clc;
close all;
clear all
warning off
C=webcam;
load myNet1;
x=0;
y=0;
height=300;
width=200;
bboxes=[x y height width];
while true
    e = C.snapshot;
    IFaces = insertObjectAnnotation (e, 'rectangle', bboxes, 'Processing Area');
 es=imcrop (e, bboxes);
    es=imresize (es, [227 227]);
    label = classify (myNet1, es);
    imshow (IFaces);
    title (char (label));
    drawnow;
end
