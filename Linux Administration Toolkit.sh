#!/usr/bin/ksh

PS3="please choose one from the above obtions:"

x=`who |cut -d ' ' -f1|uniq|wc -l|more`

select opt1 in "User Management" "Show current number of users logged in" "Show info about system" "Show all available shells" "Show mouse settings" "Show cpu info" "Show memory info" "Show hard disk info" "Show mounted file systems" "exit"

do

case $REPLY in

1)select opt2 in "add user" "modify user" "delete user" "back to previous menu" "exit"

do

case $REPLY in

1)echo "add"

;;

2)echo "enter the current username of account to modify"

read user

select opt3 in "modify the username" "modify the comment" "modify the home directory" "modify the primary group" "modify the secondary groups" "modify the user shell" "modify the expiration date" "lock account" "unlock account" "back to previous menu" "exit"

do

case $REPLY in

1)echo "enter the new username"

read newuser

usermod -n $newuser $user

echo "the account is modified successfully"

;;

2)echo "enter the comment to modify"

read comment

usermod -c $comment $user

echo "the account is modified successfully"

;;

3)echo "enter the home directory to modify"

read hom

usermod -d $hom $user

echo "the account is modified successfully"

;;

4)echo "enter the primary group name to modify"

read pgroup

usermod -g $pgroup $user

echo "the account is modified successfully"

;;

5)echo "enter the secondary groups seperated by coloum"

read sgroup

usermod -G $sgroup $user

echo "the account is modified successfully"

;;

6)echo "enter the shell path to modify"

read shell

usermod -s $shell $user

echo "the account is modified successfully"

;;

7)echo "enter the expiration date in that format  yyyy-mm-dd"

read expire

usermod -e $expire $user

echo "the account is modified successfully"

;;

8)usermod -L $user

echo "this account is locked"

;;

9)usermod -U $user

echo "the account is unlocked"

;;

10)break

;;

11)exit

;;

*)echo "invalid selection"

esac

done

;;

3)echo "enter the username of account to delete"

read user2

select opt4 in "delete the user only" "delete the user and home directory" "back to previous menu" "exit"

do

case $REPLY in

1)userdel $user2

echo "the user is deleted successfuly"

;;

2)userdel -r $user2

echo "the user and home directory are deleted successfully"

;;

3)break

;;

4)exit

;;

*)echo "invalid selection"

esac

done

;;

4)break

;;

5)exit

;;

*)echo "invalid selection"

esac

done

;;

2)echo "the number of currrent users logged in is :"$x

;;

3)uname -osrv |more

#cat /proc/version

;;

4)cat /etc/shells |cut -d / -f3 |grep [^sbin] |more

;;

5)xinput list-props 7|more

;;

6)lscpu|more

#cat /proc/cpuinfo

;;

7)free -h|more

#cat /proc/meminfo

;;

8)lsblk -io NAME,FSTYPE,MODEL,VENDOR,MIN-IO,STATE |more

#fdisk -l

#hdparm -I /dev/sda

;;

9)df -aTh |more

;;

10)exit

;;

*)echo "invalid selection"

esac

done
