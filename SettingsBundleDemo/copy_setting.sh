# 常用路径
app_setting_source_path=${PROJECT_DIR}/${PROJECT_NAME}/Settings/${CONFIGURATION}/Settings.bundle
app_setting_destination_path=${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app
# 拷贝Settings.bundle
cp -r ${app_setting_source_path} ${app_setting_destination_path}
# 修改Settings.bundle并保存到Root.tmp.plist
echo $MARKETING_VERSION
sed "s/MARKETING_VERSION/v${MARKETING_VERSION}/g" ${app_setting_destination_path}/Settings.bundle/Root.plist > ${app_setting_destination_path}/Settings.bundle/Root.tmp.plist
# Root.tmp.plist替换Root.plist
rm -f ${app_setting_destination_path}/Settings.bundle/Root.plist
mv ${app_setting_destination_path}/Settings.bundle/Root.tmp.plist ${app_setting_destination_path}/Settings.bundle/Root.plist

