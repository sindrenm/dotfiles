# mcd
#
# Make a directory (recursively) if it does not already exist, and then change
# into that directory afterwards.
#
# As an example, the following:
#
#     mkdir -p foo/bar/baz
#     cd foo/bar/baz
#
# would become:
#
#     mcd fo/bar/baz
#
# with the same result.
#
function mcd() {
  mkdir -p $1 && builtin cd $1
}
