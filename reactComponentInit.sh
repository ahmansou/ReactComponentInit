#!/bin/bash

if [ $# -ne 5 ]; then 
	echo 'Usage: ./reactComponentInit [ComponentDirectory] [ComponentName] [class - function] [css, scss, none] [tsx, js]'
else
	CMPNTDIR=$1
	CMPNTNAME=$2
	CMPNTTYPE=$3
	CMPNTSTYLE=$4
	CMPNTEX=$5

	if [ "$CMPNTEX" == "tsx" ]; then
		CMPLNAME="$CMPNTNAME.tsx"
	fi
	if [ "$CMPNTEX" == "js" ]; then
		CMPLNAME="$CMPNTNAME.js"
	fi
	mkdir $CMPNTDIR/$CMPNTNAME; 
	touch $CMPNTDIR/$CMPNTNAME/$CMPLNAME
	code $CMPNTDIR/$CMPNTNAME/$CMPLNAME
	if [ "$CMPNTSTYLE" == "css" ]; then
		touch $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.module.css
		echo "import classes from './$CMPNTNAME.module.css';" >> $CMPNTDIR/$CMPNTNAME/$CMPLNAME
		echo ".$CMPNTNAME {
}" >> $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.module.css
		code $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.module.css
	fi
	if [ "$CMPNTSTYLE" == "scss" ]; then
		touch $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.module.scss
		echo "import classes from './$CMPNTNAME.module.scss';" >> $CMPNTDIR/$CMPNTNAME/$CMPLNAME
		echo ".$CMPNTNAME {
}" >> $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.module.scss
		code $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.module.scss
	fi


	if [ "$CMPNTTYPE" == "class" ]; then
		echo "import React, { Component } from 'react';

class $CMPNTNAME extends Component {
	render () {
		return (
			<div className={classes.$CMPNTNAME} ></div>
		)
	}
}
export default $CMPNTNAME;" >> $CMPNTDIR/$CMPNTNAME/$CMPLNAME
	fi
	if [ "$CMPNTTYPE" == "function" ]; then
		echo "const $CMPNTNAME = () => {
	return (
		<div className={classes.$CMPNTNAME} ></div>
	)
}

export default $CMPNTNAME;" >> $CMPNTDIR/$CMPNTNAME/$CMPLNAME
	fi
fi
