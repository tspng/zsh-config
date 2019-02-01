function append_path () {
    if [[ -d $1 ]] && path=($path $1)
}

function prepend_path () {
    if [[ -d $1 ]] && path=($1 $path)
}