plists=(
"$SRCROOT/$DEPLOY_PRODUCT_NAME/Info.plist")

for plist in ${plists[*]}
do
    /usr/libexec/PlistBuddy -c "Delete :NSLocalNetworkUsageDescription" $plist
    /usr/libexec/PlistBuddy -c "Delete :NSBonjourServices" $plist
done

echo "----------------------------------------"
echo "---------- 🧊 Atlantis disable ---------"
echo "----------------------------------------"
