"autoload function must name with
"filename#func-name
function! <SID>gft4c()
py << EOF
import vim
import sys
def gen_func_title_list(gkey,dval):
    title = []
    bwstr = vim.vars.get(gkey,dval)
    bws = bwstr.split(',')
    buf = vim.current.buffer
    is_goon = False
    tmp = []
    line_count = len(buf[:])
    idx = 0
    iline = 0
    while idx < line_count :
        ln = buf[idx].strip().rstrip('\r\n').rstrip('\n')
        idx += 1

        if is_iline(ln):
            is_goon = False
            iline = idx

        if is_stm(ln) :
            tmp = []
            is_goon = False
            continue

        if is_goon or is_start_with(ln,bws) :
            if has_ftitle_over(ln):
                tmp.append(ln[0:ln.find('{')] + ";")
                title.extend(tmp)
                title.append("")
                is_goon = False
                tmp = []
            else :
                is_goon = True
                tmp.append(ln)
    buf.append("",iline)
    buf.append(title,iline)
    buf.append("",iline)
    vim.vars["spx_include_nb"] = iline


def is_start_with(line,starts):
    for s in starts:
        if line.startswith(s) :
            return True
    return False

def is_stm(line):
    return -1 != line.find(';')

def has_ftitle_over(line):
    return -1 != line.find('{')

def is_iline(line):
    return line.startswith('#include')

gen_func_title_list("spkx_private","static,spx_private")
gen_func_title_list("spkx_public","spx_public")
print "gen success"
EOF
endfunction


function! GFT()
    call <SID>gft4c()
    normal gg=G
    exec ":".g:spx_include_nb
    let g:spx_include_nb = 0
endfunction

comm! -nargs=? -bang GenFuncTitle call GFT()
