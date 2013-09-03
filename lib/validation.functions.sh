## Validate the CA

function printUsage {
  echo ""
  echo "--- CATool Usage ---"
  echo ""

  echo "Available Commands:"
  echo " * init <CA Name> - - - - - - - - - - Create a new CA at ./<CA Name>"
  echo " * request <Common Name>  - - - - - - Create a new private kay and CSR for <Common Name>"
  echo " * importreq <Path> [<Common Name>  - Import an existing CSR from <Path>; Optionally, store as <Common Name>]"
  echo " * sign <Common Name> - - - - - - - - Sign an existing CSR for <Common Name>"
  echo " * deny <Common Name> - - - - - - - - Remove stored CSR and private key for an unsigned request"

  exit 1
}

function validCA {
  if [[ ! -f $__pwd/CATool ]]; then
    echo "FATAL: $__pwd is not a CA initialized by CATools"
    printUsage
  fi
}

function notEmpty {
  if [[ -z $2 ]]; then
    echo "FATAL: $1 must not be empty"
    printUsage
  fi
}

function notSigned {
  notEmpty "<Common Name>" $1
  if [[ -f $__pwd/certs/${1}.pem ]]; then
    echo "FATAL: There is already a signed certificate for $1"
    printUsage
  fi
}

function canRequest {
  notEmpty "<Common Name>" $1
  notSigned $1

  if [[ -f $__pwd/requests/${1}.pem ]]; then
    echo "FATAL: There is already a request for $1."
    printUsage
  fi

  if [[ -f $__pwd/private/${1}.pem ]]; then
    echo "FATAL: There is already a private key for $1"
    printUsage
  fi
}


function canSign {
  notEmpty "<Common Name>" $1
  notSigned $1
  
  if [[ ! -f $__pwd/requests/${1}.pem ]]; then
    echo "FATAL: There is no request for $1"
    printUsage
  fi
}
