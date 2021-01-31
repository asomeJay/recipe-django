PYTHON_HOME=

for i in "$@"
do
case $i in
  -p=*|--python-home=*)
   PYTHON_HOME="${i#*=}"
   if [ ${PYTHON_HOME: -1} != "/" ]; then PYTHON_HOME=${PYTHON_HOME}/; fi
  shift # past argument=value
  ;;
  -f=*|--file_path=*)
    FILE_PATH="${i#*=}"
  shift
  ;;
  *)
    echo param error ${*}
    exit 1
  ;;
esac
done

${PYTHON_HOME}yapf --in-place $FILE_PATH
${PYTHON_HOME}isort $FILE_PATH