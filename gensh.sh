#!/bin/sh
{
    echo '#!/bin/sh'
    cat ./LICENSE | sed 's/^/# /'
    echo 'cat << EOF | grep -Pi "$*"'
    cat ./http-status-codes-preprocessed.tsv
    echo 'EOF'
} > ./http-status-codes.sh
chmod +x ./http-status-codes.sh
