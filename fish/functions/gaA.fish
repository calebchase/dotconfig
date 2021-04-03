# Defined in - @ line 1
function gaA --wraps='git add -A ' --description 'alias gaA=git add -A '
  git add -A  $argv;
end
