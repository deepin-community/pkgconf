configure_file(input: 'Kyuafile.in', output: 'Kyuafile', configuration: cdata)
configure_file(input: 'test_env.sh.in', output: 'test_env.sh', configuration: cdata)


tests = [
  'basic',
  'builtins',
  'conflicts',
  'framework',
  'parser',
  'provides',
  'regress',
  'requires',
  'sysroot',
  'version'
]


# yuck
foreach test : tests
  configure_file(input: test + '.sh', output: test, copy: true)
endforeach
