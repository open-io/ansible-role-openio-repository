#! /usr/bin/env bats

# Variable SUT_ID should be set outside this script and should contain the ID
# number of the System Under Test.

# Tests
#@test 'Check repository files for multiple product distribution' {
#  if [ "${DISTRIBUTION}" == "centos" ]; then
#    run docker exec -ti ${SUT_ID} bash -c 'ls /etc/yum.repos.d/openio* | tr "\n" " "'
#    echo "output: "$output
#    echo "status: "$status
#    [[ "${status}" -eq "0" ]]
#    [[ "${output}" =~ "/etc/yum.repos.d/openio-sds-16.10.repo /etc/yum.repos.d/openio-sds-17.04.repo /etc/yum.repos.d/openio-test-17.04.repo" ]]
#  elif [ "${DISTRIBUTION}" == "debian" ]; then
#    run docker exec -ti ${SUT_ID} bash -c 'ls /etc/apt/sources.list.d/openio* | tr "\n" " "'
#    echo "output: "$output
#    echo "status: "$status
#    [[ "${status}" -eq "0" ]]
#    [[ "${output}" =~ "/etc/apt/sources.list.d/openio-sds-17.04.list /etc/apt/sources.list.d/openio-test-17.04.list" ]]
#  elif [ "${DISTRIBUTION}" == "ubuntu" ]; then
#    run docker exec -ti ${SUT_ID} bash -c 'ls /etc/apt/sources.list.d/openio* | tr "\n" " "'
#    echo "output: "$output
#    echo "status: "$status
#    [[ "${status}" -eq "0" ]]
#    [[ "${output}" =~ "/etc/apt/sources.list.d/openio-sds-16.10.list /etc/apt/sources.list.d/openio-sds-17.04.list /etc/apt/sources.list.d/openio-test-17.04.list" ]]
#  fi
#}

@test 'Check install package' {
  if [ "${DISTRIBUTION}" == "centos" ]; then
    run docker exec -ti ${SUT_ID} bash -c 'yum install --disablerepo="*" --enablerepo="openio-sds-17.04,base" -y openio-gridinit'
    echo "output: "$output
    echo "status: "$status
    [[ "${status}" -eq "0" ]]
  elif [ "${DISTRIBUTION}" == "debian" ]; then
    run docker exec -ti ${SUT_ID} bash -c 'rm -f /etc/apt/sources.list.d/openio-test-17.04.list; apt update; apt install openio-gridinit -y'
    echo "output: "$output
    echo "status: "$status
    [[ "${status}" -eq "0" ]]
  elif [ "${DISTRIBUTION}" == "ubuntu" ]; then
    run docker exec -ti ${SUT_ID} bash -c 'rm -f /etc/apt/sources.list.d/openio-sds-16.10.list /etc/apt/sources.list.d/openio-test-17.04.list; apt update; apt install openio-gridinit -y'
    echo "output: "$output
    echo "status: "$status
    [[ "${status}" -eq "0" ]]
  fi
}
