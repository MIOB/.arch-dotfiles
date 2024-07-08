path+=( $(gem env path | sed 's#[^:]\+#&/bin#g') )
export PATH
