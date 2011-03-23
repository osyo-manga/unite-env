
function! s:env_command()
    if has("win16") || has("win32") || has("win64")
        return "set"
    else 
        return "printenv"
    endif
endfunction

function! unite#sources#env#define()"{{{
  return s:source
endfunction"}}}

let s:source = {
      \ 'name' : 'env',
      \ 'description' : 'env',
      \ }

function! s:source.gather_candidates(args, context)"{{{
  let l:result=system(s:env_command())
  return map(split(l:result, '\r\n\|\n'), '{
        \ "word" : v:val,
        \ "source" : "env",
        \ "kind" : "directory",
        \ "action__path" : split(v:val, "=")[1],
        \ }')
endfunction"}}}

