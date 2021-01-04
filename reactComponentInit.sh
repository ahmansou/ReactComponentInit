# reactComponentInit ComponentName [class - function] [css, scss, none]
if [ $# -ne 3 ]; then 
	echo 'Usage: reactComponentInit ComponentName [class - function] [css, scss, none]'
else
	CMPNTNAME=$1
	CMPNTTYPE=$2
	CMPNTSTYLE=$3

	mkdir $CMPNTNAME; touch $CMPNTNAME/$CMPNTNAME.js; 
	if [ "$CMPNTSTYLE" == "css" ]; then
		touch $CMPNTNAME/$CMPNTNAME.module.css
		echo "import classes from './$CMPNTNAME.module.css';" >> $CMPNTNAME/$CMPNTNAME.js
	fi
	if [ "$CMPNTSTYLE" == "scss" ]; then
		touch $CMPNTNAME/$CMPNTNAME.module.scss
		echo "import classes from './$CMPNTNAME.module.scss';" >> $CMPNTNAME/$CMPNTNAME.js
	fi
	if [ "$CMPNTTYPE" == "class" ]; then
		echo "
import React, { Component } from 'react';

class $CMPNTNAME extends Component {
	render () {
		return (
			<div className={classes.$CMPNTNAME} ></div>
		)
	}
}
export default $CMPNTNAME;
		" >> $CMPNTNAME/$CMPNTNAME.js
	fi
	if [ "$CMPNTTYPE" == "function" ]; then
		echo "

const $CMPNTNAME = () => {
	return (
		<div className={classes.$CMPNTNAME} ></div>
	)
}

export default $CMPNTNAME;
		" >> $CMPNTNAME/$CMPNTNAME.js
	fi
fi