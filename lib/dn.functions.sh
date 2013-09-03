## Get DN data from user for configs

declare -A DN

function readDNField {
  local desc="$1"
  local name=$2
  local default="$3"
  
  printf %s "$desc"
  if [[ ! -z "$default" ]]; then
    printf " [%s]" "$default"
  fi
  printf ": "

  read value
  local value=${value:-"$default"}
  
  if [[ -z "$value" ]]; then
    printf "Invalid input. "
    readDNField "$desc" $name $default
  else
    DN[$name]="$value"
  fi
}

function exportDN {
  for each in C ST L O OU emailAddress; do
   echo "DN[$each]=\"${DN[$each]}\""
  done
}

function formatDN {
  for each in C ST L O OU CN emailAddress; do
    local dn="${dn}/$each=${DN[$each]}"
  done
  
  echo $dn
}
