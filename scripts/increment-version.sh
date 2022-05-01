branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
commits=$(git rev-list --count HEAD)

buildNumber=$(($commits))

plists=(
"$SRCROOT/$DEPLOY_PRODUCT_NAME/Resources/dev.plist"
"$SRCROOT/$DEPLOY_PRODUCT_NAME/Resources/test.plist"
"$SRCROOT/$DEPLOY_PRODUCT_NAME/Resources/prod.plist")

for plist in ${plists[*]}
do
    /usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" $plist
done
