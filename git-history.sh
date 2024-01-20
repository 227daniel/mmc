for Y in {2015..2015}
do
  mkdir $Y
  cd $Y
  for M in {5..5}
  do
    mkdir $M
    cd $M
    for D in {01..31}
    do
# black-hole
      dd1=`expr $RANDOM % 2`
      if [ $dd1 == 0 ]; then continue; fi

      dayofdate=$(date -d "$Y-$M-$D" '+%a');
      
      st=5

      if [ "Sun" == $dayofdate ]; then st=2; fi
      if [ "Sat" == $dayofdate ]; then st=2; fi
      if [ "Mon" == $dayofdate ]; then st=5; fi
      if [ "Tue" == $dayofdate ]; then st=5; fi
      if [ "Wed" == $dayofdate ]; then st=5; fi
      if [ "Thu" == $dayofdate ]; then st=5; fi
      if [ "Fri" == $dayofdate ]; then st=3; fi

# black-hole
      rn0=$RANDOM
      dd0=`expr $rn0 % st`
      if [ $dd0 == 0 ]; then continue; fi
#
      mkdir $D
      cd $D

# black-hole
      rn=$RANDOM
      dd=`expr $rn % $st`
#
      for i in $(seq 1 $dd)
       do
        echo "0$i on $M/$D/$Y" > commit.md
        export GIT_COMMITTER_DATE="$Y-$M-$D 12:0$i:00"
        export GIT_AUTHOR_DATE="$Y-$M-$D 12:0$i:00"
        git add commit.md -f
        git commit --date="$Y-$M-$D 12:0$i:00" -m "0$i on $M $D $Y"
       done
      cd ../
    done
    cd ../
  done
  cd ../
done
git push
git rm -rf 20**
git commit -am "cleanup"
git push