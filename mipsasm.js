//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// mipsasm.js
//
// Copyright 2020 Daryl Posnett, all rights reserved, not for distribution
//
// This is a simple one pass assembler with extreme limtations for CSC/CPE 142
// It will not work with standard mips and is dependent on the assignment file
// provided.
//
// Installation and execution
//      1) install node-js
//      2) node mipsasm.js myAssmeblerFile.a myHexFile.hex
//
// This assembler uses the format in the assignment docuent except that everything is
// lower case. 
//
// e.g.
//  lw r1,10(r0)
//  add r1, r2
//  sll r1, 8
//  jmp 256
//  beq r1, 1
//  hlt
//
// Note that there is no ability to define labels nor directly manipulate values in
// the data memory. Your solution there is to use load and store and the arithmetic 
// instuctions to create the necessary values.
//

//````````````````````````````````````````````````````````````````````````````````````
// defined opcodes go in this table. For func based codes, the opcode is '0000' as
// defined in the assgignment. 
//
definedCodes ={
    "add":  {"func":  "1111", "type": "A"},
    "sub":  {"func":  "1110", "type": "A"},
    "and":  {"func":  "1101", "type": "A"},
    "or":   {"func":  "1100", "type": "A"},
    "mul":  {"func":  "0001", "type": "A"},
    "div":  {"func":  "0010", "type": "A"},
    "sll":  {"func":  "1010", "type": "A"},
    "slr":  {"func":  "1011", "type": "A"},
    "rol":  {"func":  "1000", "type": "A"},
    "ror":  {"func":  "1001", "type": "A"},
    "lw":   {"value": "1000", "type": "B"},
    "sw":   {"value": "1011", "type": "B"},
    "blt":  {"value": "0100", "type": "C"},
    "bgt":  {"value": "0101", "type": "C"},
    "beq":  {"value": "0110", "type": "C"},
    "jmp":  {"value": "1100", "type": "D"},
    "hlt":  {"value": "1111", "type": "D"}
}

//````````````````````````````````````````````````````````````````````````````````````
// main program
//
const fs = require('fs')
const asmFile = process.argv[2]
const hexFile = process.argv[3]

let assembly = fs.readFileSync(asmFile).toString().match(/[^\r\n]+/g)
fs.writeFileSync(hexFile, 'v2.0 raw\n')

// assemble the file
//
assembly.forEach((code, index) => {
    try {
        let parts = code.split(' '), binedCode
        let op = parts[0].toLowerCase()
        let values = parts.slice(1).join('').split(',')

        op = definedCodes[op];
        
        if (!op)
            throw new TypeError('instruction is not set in definedCodes.json');
        
        switch(op.type) {
            case 'A': binedCode = aType(values, op); break;
            case 'B': binedCode = bType(values, op); break;
            case 'C': binedCode = cType(values, op); break;
            case 'D': binedCode = dType(values, op); break;       
            default:
                throw new TypeError('undefined instruction type '+ op.type);
        }
            
        console.log(binedCode + "\t" + code);
        
        let hexCode = parseInt(binedCode, 2).toString(16);
        if (hexCode.length === 3)
            hexCode = '0' + hexCode;
        hexCode = hexCode + '\n';
        fs.appendFileSync(hexFile, hexCode)
    }
    catch (e) {
        fs.appendFileSync(hexFile, '')
        e.message = e.message + ' ,in line: ' + (index + 1)
        console.log(e.message);
        throw e;
    }
})

//````````````````````````````````````````````````````````````````````````````````````
// support functions
//
function aType(values, op){
    let rdReg = regToBin(values[0])
    let shamt = undefined
    let rtReg = isNaN(values[1]) ? regToBin(values[1]) : shamt = immToBin(values[1], 'r')  
    
    return '0000' + rdReg + rtReg + op.func
}

function bType(values, op){
    let rsReg = regToBin(values[0])
    let rdReg = regToBin(((values.slice(1).join('').split('('))[1].split(')'))[0])
    let offset = immToBin((values.slice(1).join('').split('('))[0],'r');
    
    return op.value + rdReg + rsReg + offset;
}

function cType(values, op){
    let rsReg = regToBin(values[0])
    let shamt = immToBin(values[1], 'i')    
    
    return op.value + rsReg + shamt;
}

function dType(values, op){
    let shamt = '000000000000';
    if(values[0].length>0)
        shamt = immToBin(values[0], 'j')
    
    return op.value + shamt;
}

function regToBin(register) {
    switch (register) {
        
        case 'r0':      return '0000'
        case 'r1':      return '0001'
        case 'r2':      return '0010'
        case 'r3':      return '0011'
        case 'r4':      return '0100'
        case 'r5':      return '0101'
        case 'r6':      return '0110'
        case 'r7':      return '0111'
        case 'r8':      return '1000'
        case 'r9':      return '1001'
        case 'r10':     return '1010'
        case 'r11':     return '1011'
        case 'r12':     return '1100'
        case 'r13':     return '1101'
        case 'r14':     return '1110'
        case 'r15':     return '1111'
        case 'zero':    return '0000'
        default:
            throw new TypeError('undefined register ' + register);
    }
}

function immToBin(immediate, type) {
    if (isNaN(immediate))
        throw new TypeError('immediate value :' + immediate + ', is not a number')
    let imm = parseInt(immediate), binedImm, length, signBit = '0'
    
    // convert negative immediate value to two's complement binary value
    //
    if (imm < 0) {
        imm *= -1
        signBit = '1'
        binedImm = twosComplement(imm.toString(2))
    }
    
    // otherwise, just convert to binary value
    //
    else
        binedImm = imm.toString(2)
    
    switch (type) {
        case 'r': length = 4 - binedImm.length;  break
        case 'i': length = 8 - binedImm.length;  break
        case 'j': length = 12 - binedImm.length; break
        default:
            throw new TypeError('Invalid instruction type ' + type)
    }
    let signBits = ''
    while (length--)
        signBits += signBit
    return signBits + binedImm
}

function twosComplement(number) {
    let onesComplement = [], code
    number.split('').forEach((bit) => {
        onesComplement.push(bit == '0' ? '1' : '0')
    })
    let decNumber = parseInt(onesComplement.join(''), 2);
    decNumber += 1
    code = decNumber.toString(2)
    if (code.length != onesComplement.length)
        code = '0' + code
    return code
}