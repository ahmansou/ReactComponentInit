#!/bin/bash

if [ $# -ne 4 ]; then 
	echo 'Usage: ./reactComponentInit [ComponentDirectory] [ComponentName] [class - function] [css, scss, none]'
else
	CMPNTDIR=$1
	CMPNTNAME=$2
	CMPNTTYPE=$3
	CMPNTSTYLE=$4

	mkdir $CMPNTDIR/$CMPNTNAME; 
	touch $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.js; 
	code $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.js
	if [ "$CMPNTSTYLE" == "css" ]; then
		touch $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.module.css
		echo "import classes from './$CMPNTNAME.module.css';" >> $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.js
		echo ".$CMPNTNAME {
}" >> $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.module.css
		code $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.module.css
	fi
	if [ "$CMPNTSTYLE" == "scss" ]; then
		touch $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.module.scss
		echo "import classes from './$CMPNTNAME.module.scss';" >> $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.js
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
export default $CMPNTNAME;" >> $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.js
	fi
	if [ "$CMPNTTYPE" == "function" ]; then
		echo "const $CMPNTNAME = () => {
	return (
		<div className={classes.$CMPNTNAME} ></div>
	)
}

export default $CMPNTNAME;" >> $CMPNTDIR/$CMPNTNAME/$CMPNTNAME.js
	fi
fi
