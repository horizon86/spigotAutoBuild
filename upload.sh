if [ -f 'new_build.txt' ];then
    TAGNAME=$(cat new_build.txt)
    NAME="$(for a in spigot-*.jar; do echo $a; done)"
    # hub release create $(for a in spigot-*.jar; do echo -a $a; done) -m "$NAME" -t "main" "$TAGNAME"
    gh release create "$TAGNAME" --target "main" --title "$NAME" $(for a in spigot-*.jar; do echo -a $a; done)
fi
