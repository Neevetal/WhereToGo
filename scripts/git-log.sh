cat /dev/null > $SRCROOT/$DEPLOY_PRODUCT_NAME/Resources/data/scripts/git-commits.html

set -e

options="--all"
messages_command="git log --no-merges --date=format:'%Y-%m-%d %H:%M' --pretty=tformat:'[%ci]%d - %s' ${options[@]}"

# damn bash arrays
OLDIFS=$IFS
IFS=$'\n'

messages=($(bash -c "$messages_command"))

IFS=$OLDIFS

mlen=${#messages[@]}
llen=${#lines[@]}

for (( i=0; i<${mlen}; i++ )); do
  echo "${messages[$i]}<br/> <br/>" >> $SRCROOT/$DEPLOY_PRODUCT_NAME/Resources/data/scripts/git-commits.html
done

echo "" >> $SRCROOT/$DEPLOY_PRODUCT_NAME/Resources/data/scripts/git-commits.html
