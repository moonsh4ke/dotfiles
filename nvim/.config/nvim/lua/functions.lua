vim.cmd([=[
" Convert hex or dec number to binary string
function ToBinary(number)

    let number = a:number

    let hex_rpr = printf("%x", number)

    let t = {'0':'0000','1':'0001','2':'0010','3':'0011','4':'0100','5':'0101','6':'0110','7':'0111','8':'1000','9':'1001','a':'1010','b':'1011','c':'1100','d':'1101','e':'1110','f':'1111'}

    let i = 0
    let bin_rpr = ""

    while i < len(hex_rpr)
        let bin_rpr = bin_rpr .. t[hex_rpr[i]]
        let i = i + 1
    endwhile

    return printf("%d", str2nr(bin_rpr))
endfunction
]=])
