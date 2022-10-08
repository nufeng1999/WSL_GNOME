#!/bin/sh
temp=`getopt -o c:i: --long cygwindir:,iswitchdir: \
     -n 'install.sh' -- "$@"`
if [ $? != 0 ] ; then
  #echo "Unrecognized parameter..." >&2
  exit 1
fi

eval set -- "$temp"

while true
do
  case "$1" in
    -c|--cygwindir)
      CYGWINDIR="$2"
      #export CYGWINDIR
      #echo "cygwin install_dir: \`$2'"
      shift 2
      ;;
    -i|--iswitchdir)
      ISWITCHDIR="$2"
      #export ISWITCHDIR
      #echo "iswitchdir install_dir: \`$2'"
      shift 2
      ;;
    --)
      shift
      break
      ;;
    *)
#      echo "internal error!"
      exit 1
      ;;
  esac
done
#echo "Unrecognized arguments:"
#for arg do
#  echo '--> '"\`$arg'" ;
#done

