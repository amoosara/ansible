grep nfs /etc/mtab | grep -v proc | grep -v usr2 | awk '{print $2}' | while read line
do
timeout 5 ls ${line} > /dev/null
result=`echo $?`
if [ "$result" -eq 0 ]
then
echo "${line}" >> /tmp/stalenfs_mount.log
fi
done
