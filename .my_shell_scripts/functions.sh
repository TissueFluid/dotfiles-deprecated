update_pip()
{
  pip freeze --local | cut -d = -f 1 | xargs pip install -U
}

change_java_encoding_to_utf8()
{
  export JAVA_TOOL_OPTIONS='-Dfile.encoding=UTF-8'
}
