# Declare variable
SOFRWARE=(nginx docker mysql redis mongo aws gcp)

# Declare function

# Execute Script
##
echo "Choose software:"
res=""
for sfname in ${SOFRWARE[@]};
do
    read -e -i "n" -p "Install ${sfname} (y|n) ? " ans
    [[ "${ans,,}" == "y" ]] && res="${res} ${sfname}"
done
echo "Choosed: " ${res}
