SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

checkSecondArg()
{
	## $1 = the text to display if $3 isnt set
	## $2 = the function to pass the second argument to.
	## $3 = the second argument supplied
	if [ -z "$3" ]; then
    	echo "$1"
    	exit 1
    else
    	$2 $3
	fi
}

checkAtRoot()
{
	if [ ! -d src ] && [ ! -d node_modules ]; then
    	echo "Command must be ran from the root of a react-native project!"
    	exit 1
	fi
}

checkAtExpoRoot()
{
	if [ ! -f App.js ]  && [ ! -d node_modules ]; then
    	echo "Command must be ran from the root of a react-native expo project!"
    	exit 1
	fi
}

jHelp()
{
	less $SCRIPT_DIR/help.txt
}

replaceVar()
{
	## $1 = the var to replace
	## $2 = the value to replace with
	## $3 = the file to search
	sed -i'.jiinxt' -e "s/$1/$2/g" $3
	rm $3.jiinxt
}

removeLastLine()
{
	sed -i'.jiinxt' '$ d' $1
	rm $1.jiinxt
}

initNewProject()
{

	if [ "$1" != "expo" ]; then
		react-native init $1
		cd $1
	else
		checkAtExpoRoot
	fi

	npm install --save lodash
	npm install --save react-native-communications
	npm install --save react-native-router-flux
	npm install --save redux
	npm install --save react-redux
	npm install --save redux-thunk
	npm install --save react-native-elements

	rm App.js
	cp -rv $SCRIPT_DIR/react-native-base/src ./src

    if [ "$1" != "expo" ]; then
		cp $SCRIPT_DIR/react-native-base/index.js ./index.js
		replaceVar "###JIINXT_PROJECT_NAME###" "$1" index.js
		rm index.js
	else
		cp $SCRIPT_DIR/react-native-base/App.js ./App.js
	fi

	# Just to be safe, lets run npm install again.
	npm install

	echo "React-Native project ready!"
}

updateJiinxt() {
    jiinxtVersion=$(curl --silent "https://api.github.com/repos/Jiinxt/react-native-jiinxt/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

    cd ~
    mkdir Jiinxt-Update-2l3kn42l3knosidnvanl2n34liasdv9alsdnf2d
    cd Jiinxt-Update-2l3kn42l3knosidnvanl2n34liasdv9alsdnf2d

    curl https://codeload.github.com/Jiinxt/react-native-jiinxt/zip/${jiinxtVersion} --output ${jiinxtVersion}.zip
    unzip ${jiinxtVersion}.zip
    cd $(ls | grep "react-native-jiinxt")
    
    /bin/bash jiinxt-installer.sh
    rm -rf ~/Jiinxt-Update-2l3kn42l3knosidnvanl2n34liasdv9alsdnf2d

    echo "Updated to ${jiinxtVersion}!"
}

createNewComponent()
{
	checkAtRoot
	cp $SCRIPT_DIR/react-native-templates/ComponentTemplate.js src/components/$1.js
	replaceVar "###JIINXT_COMPONENT_NAME###" "$1" src/components/$1.js
}

createNewReducer()
{
	checkAtRoot
	cp $SCRIPT_DIR/react-native-base/src/reducers/ExampleReducer.js src/reducers/$1.js
	removeLastLine src/reducers/index.js
	echo "    $1: $1," >> src/reducers/index.js
	echo "});" >> src/reducers/index.js
}

createNewAction()
{
	checkAtRoot
	cp $SCRIPT_DIR/react-native-base/src/actions/ExampleAction.js src/actions/$1.js
	blank=`tail -1c src/actions/index.js`
	if [ "$blank" != "" ]; then
		echo >> src/actions/index.js
	fi
	echo "export * from './$1';" >> src/actions/index.js
}

createNewType()
{
	checkAtRoot

	blank=`tail -1c src/actions/types.js`
	if [ "$blank" != "" ]; then
		echo >> src/actions/types.js
	fi

	echo "export const $1=\"$1\";" >> src/actions/types.js
}