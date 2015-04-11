#!/bin/sh
for  i in `seq 1 100`
do
MOZWIN=$(xdotool search --name "Didattica")
xdotool windowactivate $MOZWIN
if [ $? -eq 1 ] ; then
	exit 1 
fi

sleep 5

echo 'Avvio lezione'
#xdotool getmouselocation
for i in `seq 750 820` #cerco il pulsante cliccando a caso 
do
	xdotool mousemove $i 320
	xdotool click 1
done

echo 'Attendo apertura'
sleep 10

echo 'Ripristino lezione'
xdotool mousemove 826 421
xdotool click 1

echo 'Click!'
for i in `seq 1 30`
do
	xdotool mousemove 1115 672
	xdotool click 1
	sleep 15
	xdotool mousemove 801 675
	xdotool click 1
done

echo 'Attendo termine ultima lezione'
sleep 7

echo "Chiudo finestra"
MOZWIN=$(xdotool search --name "INIA")
xdotool windowactivate $MOZWIN
if [ $? -ne 0 ] ; then 
	exit 1 
fi
xdotool key Alt+q
sleep 16

echo "Dichiaro come svolta"
for i in `seq 370 420` #cerco il pulsante cliccando a caso 
do
xdotool mousemove 275 $i
xdotool click 1
done

xdotool mousemove 860 388
xdotool click 1

sleep 3
done
