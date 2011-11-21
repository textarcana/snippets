# Compare the committer list on two subdirectories of a Git repo.  I
# use this for determining how many people commit on tests vs. commit
# on application code.

export DIR='phplib'
export COMPARE_DIR='tests/phpunit'

historical_log(){
    git log --format="%an" --since="$1" --until="$2" $3 | sort | uniq | wc -l
}

percentage(){
    echo `echo "scale=4; $1 / $2 * 100" | bc | cut -c-4`%
}

export DIR_Q1=`historical_log '1 year ago' '9 months ago' $DIR`
export DIR_Q2=`historical_log '9 months ago' '6 months ago' $DIR`
export DIR_Q3=`historical_log '6 months ago' '3 months ago' $DIR`
export DIR_Q4=`historical_log '3 months ago' 'now' $DIR`

export COMPARE_DIR_Q1=`historical_log '1 year ago' '9 months ago' $COMPARE_DIR`
export COMPARE_DIR_Q2=`historical_log '9 months ago' '6 months ago' $COMPARE_DIR`
export COMPARE_DIR_Q3=`historical_log '6 months ago' '3 months ago' $COMPARE_DIR`
export COMPARE_DIR_Q4=`historical_log '3 months ago' 'now' $COMPARE_DIR`

echo For the year that started with commit:
echo "    "`git log -n1 --until='1 year ago' --format="%h on %cd"`
echo and ended with commit:
echo "    "`git log -n1 --format="%h on %cd"`"\n"

echo Ratio of unique authors on $COMPARE_DIR vs. $DIR:

echo Q1 `percentage $COMPARE_DIR_Q1 $DIR_Q1`, $COMPARE_DIR_Q1 : $DIR_Q1
echo Q2 `percentage $COMPARE_DIR_Q2 $DIR_Q2`, $COMPARE_DIR_Q2 : $DIR_Q2
echo Q3 `percentage $COMPARE_DIR_Q3 $DIR_Q3`, $COMPARE_DIR_Q3 : $DIR_Q3
echo Q4 `percentage $COMPARE_DIR_Q4 $DIR_Q4`, $COMPARE_DIR_Q4 : $DIR_Q4
