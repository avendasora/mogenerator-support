#!/bin/sh
#  xdatamodeld.sh
#
#  Created by David Avendasora on 10/31/2011
#  Based on the scripts created by Jean-Denis Muys

$echo ${SCRIPT_INPUT_FILE_0}

TEMPLATE_PATH="${SRCROOT}/../mogenerator-support/mogen-templates/ARC_Compliant"
echo "MOGen TEMPLATE_PATH = ${TEMPLATE_PATH}"

BASE_PATH="${SOURCE_ROOT}/${PROJECT_NAME}/MOs"
echo "MOGen BASE_PATH = ${BASE_PATH}"

HUMAN_DIR="${BASE_PATH}"
echo "MOGen HUMAN_DIR = ${HUMAN_DIR}"

MACHINE_DIR="${HUMAN_DIR}/Generated"
echo "MOGen MACHINE_DIR = ${MACHINE_DIR}"

CURRENT_MODEL_VERSION=`/usr/libexec/PlistBuddy "${SCRIPT_INPUT_FILE_0}/.xccurrentversion" -c 'print _XCCurrentVersionName'`
echo "MOGen CURRENT_MODEL_VERSION = ${CURRENT_MODEL_VERSION}"

BASE_CLASS_CLAUSE=""
if [ $1 ]; then 
	 BASE_CLASS_CLAUSE=" --base-class ${1}"
fi
echo "MOGen BASE_CLASS_CLAUSE = ${BASE_CLASS_CLAUSE}"

echo "MOGen command to execute: mogenerator --model \"${SCRIPT_INPUT_FILE_0}/$CURRENT_MODEL_VERSION\"${BASE_CLASS_CLAUSE} --template-path \"${TEMPLATE_PATH}\" --machine-dir \"${MACHINE_DIR}\" --human-dir \"${HUMAN_DIR}\""
mogenerator --model "${SCRIPT_INPUT_FILE_0}/$CURRENT_MODEL_VERSION"${BASE_CLASS_CLAUSE} --template-path "${TEMPLATE_PATH}" --machine-dir "${MACHINE_DIR}" --human-dir "${HUMAN_DIR}"
