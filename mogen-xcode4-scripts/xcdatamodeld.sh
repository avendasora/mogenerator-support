#!/bin/sh
#  mogend.sh
#
#  Created by David Avendasora on 10/31/2011
#  Based on the scripts created by Jean-Denis Muys

$echo ${SCRIPT_INPUT_FILE_0}

baseClass=KESManagedObject
echo $baseClass

templatePath=${SOURCE_ROOT}/../mogenerator-support/mogen-templates
echo $templatePath

basePath=${SOURCE_ROOT}/${PROJECT_NAME}
echo $basePath

humanDir=${basePath}
echo $humanDir

machineDir=${humanDir}
echo $machineDir

currentModelVersion=`/usr/libexec/PlistBuddy "${SCRIPT_INPUT_FILE_0}/.xccurrentversion" -c 'print _XCCurrentVersionName'`
echo $currentModelVersion

echo mogenerator --model \"${SCRIPT_INPUT_FILE_0}/$currentModelVersion\" --base-class \"${baseClass}\" --template-path \"${templatePath}\" --machine-dir \"${machineDir}\" --human-dir \"${humanDir}\"
mogenerator --model "${SCRIPT_INPUT_FILE_0}/$currentModelVersion" --base-class "${baseClass}" --template-path "${templatePath}" --machine-dir "${machineDir}" --human-dir "${humanDir}"
