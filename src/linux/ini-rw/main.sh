[ -e ${PWD}/grafana.ini ] && rm ${PWD}/grafana.ini
cp ${PWD}/grafana.ini.tmp ${PWD}/grafana.ini
echo "----- read ini file -----"
bash ini r ${PWD}/grafana.ini auth.jwt
echo "----- write ini file -----"
bash ini w ${PWD}/grafana.ini auth.jwt
bash ini r ${PWD}/grafana.ini auth.jwt
