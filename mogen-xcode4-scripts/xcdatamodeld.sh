#!/bin/sh
#  mogend.sh
#
#  Created by David Avendasora on 10/31/2011
#  Based on the scripts created by Jean-Denis Muys

$echo ${SCRIPT_INPUT_FILE_0}

templatePath=${SOURCE_ROOT}/../mogenerator-support/mogen-templates
echo MOGen templatePath = ${templatePath}

basePath=${SOURCE_ROOT}/${PROJECT_NAME}/MOs
echo MOGen basePath = ${basePath}

humanDir=${basePath}
echo MOGen humanDir = ${humanDir}

machineDir=${humanDir}/Generated
echo MOGen machineDir = ${machineDir}

currentModelVersion=`/usr/libexec/PlistBuddy "${SCRIPT_INPUT_FILE_0}/.xccurrentversion" -c 'print _XCCurrentVersionName'`
echo MOGen currentModelVersion = ${currentModelVersion}

#echo mogenerator --model \"${SCRIPT_INPUT_FILE_0}/$currentModelVersion\" --template-path \"${templatePath}\" --machine-dir \"${machineDir}\" --human-dir \"${humanDir}\"
#mogenerator --model "${SCRIPT_INPUT_FILE_0}/$currentModelVersion" --template-path "${templatePath}" --machine-dir "${machineDir}" --human-dir "${humanDir}"

baseClass=KESManagedObject
echo MOGen baseClass = ${baseClass}

echo MOGen command to execute: mogenerator --model \"${SCRIPT_INPUT_FILE_0}/$currentModelVersion\" --base-class \"${baseClass}\" --template-path \"${templatePath}\" --machine-dir \"${machineDir}\" --human-dir \"${humanDir}\"
mogenerator --model "${SCRIPT_INPUT_FILE_0}/$currentModelVersion" --base-class "${baseClass}" --template-path "${templatePath}" --machine-dir "${machineDir}" --human-dir "${humanDir}"
