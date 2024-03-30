
export PATH="$PATH:$(gem env path | sed 's#[^:]\+#&/bin#g')"
