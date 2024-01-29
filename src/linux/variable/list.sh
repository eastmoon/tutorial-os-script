VAR_LIST=$(ls /)

for d in ${VAR_LIST[@]}
do
    echo ${d}
done

[[ ${VAR_LIST} =~ "app" ]] && echo "app exist" || echo "app not exist"
[[ ${VAR_LIST} =~ "appx" ]] && echo "appx exist" || echo "appx not exist"
