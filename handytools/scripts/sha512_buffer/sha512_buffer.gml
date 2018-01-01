/// @description Returns the SHA512 has of a buffer
/// @param buffer
/// @param offset
/// @param size
//Geschreven door Size43

var bitlength, binb, add1, add2, add3, add4, j, i, binb_length, _sha512, hex, b, output;

_sha512 = [ $428a,$2f98,$d728,$ae22,$7137,$4491,$23ef,$65cd,$b5c0,$fbcf,$ec4d,$3b2f,$e9b5,$dba5,$8189,$dbbc,
            $3956,$c25b,$f348,$b538,$59f1,$11f1,$b605,$d019,$923f,$82a4,$af19,$4f9b,$ab1c,$5ed5,$da6d,$8118,
            $d807,$aa98,$a303,$0242,$1283,$5b01,$4570,$6fbe,$2431,$85be,$4ee4,$b28c,$550c,$7dc3,$d5ff,$b4e2,
            $72be,$5d74,$f27b,$896f,$80de,$b1fe,$3b16,$96b1,$9bdc,$06a7,$25c7,$1235,$c19b,$f174,$cf69,$2694,
            $e49b,$69c1,$9ef1,$4ad2,$efbe,$4786,$384f,$25e3,$0fc1,$9dc6,$8b8c,$d5b5,$240c,$a1cc,$77ac,$9c65,
            $2de9,$2c6f,$592b,$0275,$4a74,$84aa,$6ea6,$e483,$5cb0,$a9dc,$bd41,$fbd4,$76f9,$88da,$8311,$53b5,
            $983e,$5152,$ee66,$dfab,$a831,$c66d,$2db4,$3210,$b003,$27c8,$98fb,$213f,$bf59,$7fc7,$beef,$0ee4,
            $c6e0,$0bf3,$3da8,$8fc2,$d5a7,$9147,$930a,$a725,$06ca,$6351,$e003,$826f,$1429,$2967,$0a0e,$6e70,
            $27b7,$0a85,$46d2,$2ffc,$2e1b,$2138,$5c26,$c926,$4d2c,$6dfc,$5ac4,$2aed,$5338,$0d13,$9d95,$b3df,
            $650a,$7354,$8baf,$63de,$766a,$0abb,$3c77,$b2a8,$81c2,$c92e,$47ed,$aee6,$9272,$2c85,$1482,$353b,
            $a2bf,$e8a1,$4cf1,$0364,$a81a,$664b,$bc42,$3001,$c24b,$8b70,$d0f8,$9791,$c76c,$51a3,$0654,$be30,
            $d192,$e819,$d6ef,$5218,$d699,$0624,$5565,$a910,$f40e,$3585,$5771,$202a,$106a,$a070,$32bb,$d1b8,
            $19a4,$c116,$b8d2,$d0c8,$1e37,$6c08,$5141,$ab53,$2748,$774c,$df8e,$eb99,$34b0,$bcb5,$e19b,$48a8,
            $391c,$0cb3,$c5c9,$5a63,$4ed8,$aa4a,$e341,$8acb,$5b9c,$ca4f,$7763,$e373,$682e,$6ff3,$d6b2,$b8a3,
            $748f,$82ee,$5def,$b2fc,$78a5,$636f,$4317,$2f60,$84c8,$7814,$a1f0,$ab72,$8cc7,$0208,$1a64,$39ec,
            $90be,$fffa,$2363,$1e28,$a450,$6ceb,$de82,$bde9,$bef9,$a3f7,$b2c6,$7915,$c671,$78f2,$e372,$532b,
            $ca27,$3ece,$ea26,$619c,$d186,$b8c7,$21c0,$c207,$eada,$7dd6,$cde0,$eb1e,$f57d,$4f7f,$ee6e,$d178,
            $06f0,$67aa,$7217,$6fba,$0a63,$7dc5,$a2c8,$98a6,$113f,$9804,$bef9,$0dae,$1b71,$0b35,$131c,$471b,
            $28db,$77f5,$2304,$7d84,$32ca,$ab7b,$40c7,$2493,$3c9e,$be0a,$15c9,$bebc,$431d,$67c4,$9c10,$0d4c,
            $4cc5,$d4be,$cb3e,$42b6,$597f,$299c,$fc65,$7e2a,$5fcb,$6fab,$3ad6,$faec,$6c44,$198c,$4a47,$5817,
            $6a09,$e667,$f3bc,$c908,$bb67,$ae85,$84ca,$a73b,$3c6e,$f372,$fe94,$f82b,$a54f,$f53a,$5f1d,$36f1,
            $510e,$527f,$ade6,$82d1,$9b05,$688c,$2b3e,$6c1f,$1f83,$d9ab,$fb41,$bd6b,$5be0,$cd19,$137e,$2179 ];
_sha512[750] = 0;

bitlength = argument2 * 8;

//Convert to big-endian
buffer_seek(argument0, buffer_seek_start, argument1);
for (i = 0; i < argument2; i += 1)
{
    if(i mod 2 == 0)
    {
        //High byte
        binb[i / 2] = (buffer_read(argument0, buffer_u8) & $ff) << 8;
    }else{
        //Low byte
        binb[floor(i / 2)] |= buffer_read(argument0, buffer_u8) & $ff;
    }
}

if(i mod 2 == 0)
{
    //High byte
    binb[i / 2] = $80 << 8;
}else{
    //Low byte
    binb[floor(i / 2)] |= $80;
}

//append padding to the source string. The format is described in the FIPS.
binb_length = ((((bitlength + 128) >> 10) + 1) << 6);

binb[binb_length - 1] = bitlength & $ffff;
binb[binb_length - 2] = (bitlength >> 16) & $ffff;

for (i = 0; i < (binb_length / 2); i += 32) //32 dwords is the block size
{
    _sha512[360] = _sha512[320]; _sha512[360 + 1] = _sha512[320 + 1]; _sha512[360 + 2] = _sha512[320 + 2]; _sha512[360 + 3] = _sha512[320 + 3];;
    _sha512[364] = _sha512[324]; _sha512[364 + 1] = _sha512[324 + 1]; _sha512[364 + 2] = _sha512[324 + 2]; _sha512[364 + 3] = _sha512[324 + 3];;
    _sha512[368] = _sha512[328]; _sha512[368 + 1] = _sha512[328 + 1]; _sha512[368 + 2] = _sha512[328 + 2]; _sha512[368 + 3] = _sha512[328 + 3];;
    _sha512[372] = _sha512[332]; _sha512[372 + 1] = _sha512[332 + 1]; _sha512[372 + 2] = _sha512[332 + 2]; _sha512[372 + 3] = _sha512[332 + 3];;
    _sha512[376] = _sha512[336]; _sha512[376 + 1] = _sha512[336 + 1]; _sha512[376 + 2] = _sha512[336 + 2]; _sha512[376 + 3] = _sha512[336 + 3];;
    _sha512[380] = _sha512[340]; _sha512[380 + 1] = _sha512[340 + 1]; _sha512[380 + 2] = _sha512[340 + 2]; _sha512[380 + 3] = _sha512[340 + 3];;
    _sha512[384] = _sha512[344]; _sha512[384 + 1] = _sha512[344 + 1]; _sha512[384 + 2] = _sha512[344 + 2]; _sha512[384 + 3] = _sha512[344 + 3];;
    _sha512[388] = _sha512[348]; _sha512[388 + 1] = _sha512[348 + 1]; _sha512[388 + 2] = _sha512[348 + 2]; _sha512[388 + 3] = _sha512[348 + 3];;
 
    for (j = 0; j < 16; j++)
    {
        _sha512[(420 + j * 4)] = binb[(i + 2 * j) * 2]; _sha512[(420 + j * 4) + 1] = binb[(i + 2 * j) * 2 + 1]; _sha512[(420 + j * 4) + 2] = binb[(i + 2 * j + 1) * 2]; _sha512[(420 + j * 4) + 3] = binb[(i + 2 * j + 1) * 2 + 1];;
    }
 
    for (j = 16; j < 80; j++)
    {
        //sigma1
        //rrot(408, (420 + (j - 2) * 4), 19);
            //Shift 16
            add2 = (420 + (j - 2) * 4);
            add1 = _sha512[add2 + 3];
            _sha512[408 + 3] = _sha512[add2 + 2];
            _sha512[408 + 2] = _sha512[add2 + 1];
            _sha512[408 + 1] = _sha512[add2 + 0];
            _sha512[408 + 0] = add1;
         
            //Shift 3
            add1 = _sha512[408 + 3];
            _sha512[408 + 3] = (_sha512[408 + 3] >> 3) | ((_sha512[408 + 2] << 13) & $ffff);
            _sha512[408 + 2] = (_sha512[408 + 2] >> 3) | ((_sha512[408 + 1] << 13) & $ffff);
            _sha512[408 + 1] = (_sha512[408 + 1] >> 3) | ((_sha512[408 + 0] << 13) & $ffff);
            _sha512[408 + 0] = (_sha512[408 + 0] >> 3) | ((add1 << 13) & $ffff);
         
         
        //rrot(412, (420 + (j - 2) * 4), 32 + 29);
            add2 = (420 + (j - 2) * 4);
            //Shift 48
            add1 = _sha512[add2 + 0];
            _sha512[412 + 0] = _sha512[add2 + 1];
            _sha512[412 + 1] = _sha512[add2 + 2];
            _sha512[412 + 2] = _sha512[add2 + 3];
            _sha512[412 + 3] = add1;
         
            //Shift 13
            add1 = _sha512[412 + 3];
            _sha512[412 + 3] = (_sha512[412 + 3] >> 13) | ((_sha512[412 + 2] << 3) & $ffff);
            _sha512[412 + 2] = (_sha512[412 + 2] >> 13) | ((_sha512[412 + 1] << 3) & $ffff);
            _sha512[412 + 1] = (_sha512[412 + 1] >> 13) | ((_sha512[412 + 0] << 3) & $ffff);
            _sha512[412 + 0] = (_sha512[412 + 0] >> 13) | ((add1 << 3) & $ffff);
     
        //shr(416, (420 + (j - 2) * 4), 6);
            //Shift 6
            //add2 = (420 + (j - 2) * 4);
            _sha512[416 + 3] = (_sha512[add2 + 3] >> 6) | ((_sha512[add2 + 2] << 10) & $ffff);
            _sha512[416 + 2] = (_sha512[add2 + 2] >> 6) | ((_sha512[add2 + 1] << 10) & $ffff);
            _sha512[416 + 1] = (_sha512[add2 + 1] >> 6) | ((_sha512[add2 + 0] << 10) & $ffff);
            _sha512[416 + 0] = (_sha512[add2 + 0] >> 6);
        _sha512[396] = _sha512[408] ^ _sha512[412] ^ _sha512[416]; _sha512[396 + 1] = _sha512[408 + 1] ^ _sha512[412 + 1] ^ _sha512[416 + 1]; _sha512[396 + 2] = _sha512[408 + 2] ^ _sha512[412 + 2] ^ _sha512[416 + 2]; _sha512[396 + 3] = _sha512[408 + 3] ^ _sha512[412 + 3] ^ _sha512[416 + 3];;
     
        //sigma0
        //rrot(408, (420 + (j - 15) * 4), 1);
            //Shift 1
            add2 = (420 + (j - 15) * 4);
            add1 = _sha512[add2 + 3];
            _sha512[408 + 3] = (_sha512[add2 + 3] >> 1) | ((_sha512[add2 + 2] << 15) & $ffff);
            _sha512[408 + 2] = (_sha512[add2 + 2] >> 1) | ((_sha512[add2 + 1] << 15) & $ffff);
            _sha512[408 + 1] = (_sha512[add2 + 1] >> 1) | ((_sha512[add2 + 0] << 15) & $ffff);
            _sha512[408 + 0] = (_sha512[add2 + 0] >> 1) | ((add1 << 15) & $ffff);
         
        //rrot(412, (420 + (j - 15) * 4), 8);
            //Shift 8
            //add2 = (420 + (j - 15) * 4)
            add1 = _sha512[add2 + 3];
            _sha512[412 + 3] = (_sha512[add2 + 3] >> 8) | ((_sha512[add2 + 2] << 8) & $ffff);
            _sha512[412 + 2] = (_sha512[add2 + 2] >> 8) | ((_sha512[add2 + 1] << 8) & $ffff);
            _sha512[412 + 1] = (_sha512[add2 + 1] >> 8) | ((_sha512[add2 + 0] << 8) & $ffff);
            _sha512[412 + 0] = (_sha512[add2 + 0] >> 8) | ((add1 << 8) & $ffff);
     
     
        //shr(416, (420 + (j - 15) * 4), 7);
            //Shift 6
            //add2 = (420 + (j - 15) * 4);
            _sha512[416 + 3] = (_sha512[add2 + 3] >> 7) | ((_sha512[add2 + 2] << 9) & $ffff);
            _sha512[416 + 2] = (_sha512[add2 + 2] >> 7) | ((_sha512[add2 + 1] << 9) & $ffff);
            _sha512[416 + 1] = (_sha512[add2 + 1] >> 7) | ((_sha512[add2 + 0] << 9) & $ffff);
            _sha512[416 + 0] = (_sha512[add2 + 0] >> 7);
     
        _sha512[392] = _sha512[408] ^ _sha512[412] ^ _sha512[416]; _sha512[392 + 1] = _sha512[408 + 1] ^ _sha512[412 + 1] ^ _sha512[416 + 1]; _sha512[392 + 2] = _sha512[408 + 2] ^ _sha512[412 + 2] ^ _sha512[416 + 2]; _sha512[392 + 3] = _sha512[408 + 3] ^ _sha512[412 + 3] ^ _sha512[416 + 3];;
     
        add1 = _sha512[396 + 3] + _sha512[(420 + (j - 7) * 4) + 3] + _sha512[392 + 3] + _sha512[(420 + (j - 16) * 4) + 3]; add2 = _sha512[396 + 2] + _sha512[(420 + (j - 7) * 4) + 2] + _sha512[392 + 2] + _sha512[(420 + (j - 16) * 4) + 2] + (add1 >> 16); add3 = _sha512[396 + 1] + _sha512[(420 + (j - 7) * 4) + 1] + _sha512[392 + 1] + _sha512[(420 + (j - 16) * 4) + 1] + (add2 >> 16); add4 = _sha512[396] + _sha512[(420 + (j - 7) * 4)] + _sha512[392] + _sha512[(420 + (j - 16) * 4)] + (add3 >> 16); _sha512[(420 + (j) * 4) + 3] = add1 & $00ffff; _sha512[(420 + (j) * 4) + 2] = add2 & $00ffff; _sha512[(420 + (j) * 4) + 1] = add3 & $00ffff; _sha512[(420 + (j) * 4)] = add4 & $00ffff;
    }
 
    for (j = 0; j < 80; j++)
    {
        //400
        _sha512[400 + 3] = (_sha512[376 + 3] & _sha512[380 + 3]) ^ (~_sha512[376 + 3] & _sha512[384 + 3]);
        _sha512[400 + 2] = (_sha512[376 + 2] & _sha512[380 + 2]) ^ (~_sha512[376 + 2] & _sha512[384 + 2]);
        _sha512[400 + 1] = (_sha512[376 + 1] & _sha512[380 + 1]) ^ (~_sha512[376 + 1] & _sha512[384 + 1]);
        _sha512[400] = (_sha512[376] & _sha512[380]) ^ (~_sha512[376] & _sha512[384]);
     
        //Sigma1
        //rrot(408, 376, 14);
            //Shift 14
            add1 = _sha512[376 + 3];
            _sha512[408 + 3] = (_sha512[376 + 3] >> 14) | ((_sha512[376 + 2] << 2) & $ffff);
            _sha512[408 + 2] = (_sha512[376 + 2] >> 14) | ((_sha512[376 + 1] << 2) & $ffff);
            _sha512[408 + 1] = (_sha512[376 + 1] >> 14) | ((_sha512[376 + 0] << 2) & $ffff);
            _sha512[408 + 0] = (_sha512[376 + 0] >> 14) | ((add1 << 2) & $ffff);
     
     
        //rrot(412, 376, 18);
            //Shift 16
            add1 = _sha512[376 + 3];
            _sha512[412 + 3] = _sha512[376 + 2];
            _sha512[412 + 2] = _sha512[376 + 1];
            _sha512[412 + 1] = _sha512[376 + 0];
            _sha512[412 + 0] = add1;
         
            //Shift 2
            add1 = _sha512[412 + 3];
            _sha512[412 + 3] = (_sha512[412 + 3] >> 2) | ((_sha512[412 + 2] << 14) & $ffff);
            _sha512[412 + 2] = (_sha512[412 + 2] >> 2) | ((_sha512[412 + 1] << 14) & $ffff);
            _sha512[412 + 1] = (_sha512[412 + 1] >> 2) | ((_sha512[412 + 0] << 14) & $ffff);
            _sha512[412 + 0] = (_sha512[412 + 0] >> 2) | ((add1 << 14) & $ffff);
     
        //rrot(416, 376, 32 + 9);
            //Shift 32
            add1 = _sha512[376 + 1];
            add2 = _sha512[376 + 2];
            _sha512[416 + 1] = _sha512[376 + 3];
            _sha512[416 + 2] = _sha512[376 + 0];
            _sha512[416 + 3] = add1;
            _sha512[416 + 0] = add2;
         
            //Shift 9
            add1 = _sha512[416 + 3];
            _sha512[416 + 3] = (_sha512[416 + 3] >> 9) | ((_sha512[416 + 2] << 7) & $ffff);
            _sha512[416 + 2] = (_sha512[416 + 2] >> 9) | ((_sha512[416 + 1] << 7) & $ffff);
            _sha512[416 + 1] = (_sha512[416 + 1] >> 9) | ((_sha512[416 + 0] << 7) & $ffff);
            _sha512[416 + 0] = (_sha512[416 + 0] >> 9) | ((add1 << 7) & $ffff);
     
        //xor3
        _sha512[396] = _sha512[408] ^ _sha512[412] ^ _sha512[416]; _sha512[396 + 1] = _sha512[408 + 1] ^ _sha512[412 + 1] ^ _sha512[416 + 1]; _sha512[396 + 2] = _sha512[408 + 2] ^ _sha512[412 + 2] ^ _sha512[416 + 2]; _sha512[396 + 3] = _sha512[408 + 3] ^ _sha512[412 + 3] ^ _sha512[416 + 3];;
     
        //Sigma0
        //rrot(408,  360, 28);
            //Shift 12
            add1 = _sha512[360 + 3];
            _sha512[408 + 3] = (_sha512[360 + 3] >> 12) | ((_sha512[360 + 2] << 4) & $ffff);
            _sha512[408 + 2] = (_sha512[360 + 2] >> 12) | ((_sha512[360 + 1] << 4) & $ffff);
            _sha512[408 + 1] = (_sha512[360 + 1] >> 12) | ((_sha512[360 + 0] << 4) & $ffff);
            _sha512[408 + 0] = (_sha512[360 + 0] >> 12) | ((add1 << 4) & $ffff);
         
            //Shift 16
            add1 = _sha512[408 + 3];
            _sha512[408 + 3] = _sha512[408 + 2];
            _sha512[408 + 2] = _sha512[408 + 1];
            _sha512[408 + 1] = _sha512[408 + 0];
            _sha512[408 + 0] = add1;
     
     
        //rrot(412,  360, 32 + 2);
            //Shift 32
            add1 = _sha512[360 + 1];
            add2 = _sha512[360 + 2];
            _sha512[412 + 1] = _sha512[360 + 3];
            _sha512[412 + 2] = _sha512[360 + 0];
            _sha512[412 + 3] = add1;
            _sha512[412 + 0] = add2;
         
            //Shift 2
            add1 = _sha512[412 + 3];
            _sha512[412 + 3] = (_sha512[412 + 3] >> 2) | ((_sha512[412 + 2] << 14) & $ffff);
            _sha512[412 + 2] = (_sha512[412 + 2] >> 2) | ((_sha512[412 + 1] << 14) & $ffff);
            _sha512[412 + 1] = (_sha512[412 + 1] >> 2) | ((_sha512[412 + 0] << 14) & $ffff);
            _sha512[412 + 0] = (_sha512[412 + 0] >> 2) | ((add1 << 14) & $ffff);
     
     
        //rrot(416,  360, 32 + 7);
            //Shift 32
            add1 = _sha512[360 + 1];
            add2 = _sha512[360 + 2];
            _sha512[416 + 1] = _sha512[360 + 3];
            _sha512[416 + 2] = _sha512[360 + 0];
            _sha512[416 + 3] = add1;
            _sha512[416 + 0] = add2;
         
            //Shift 7
            add1 = _sha512[416 + 3];
            _sha512[416 + 3] = (_sha512[416 + 3] >> 7) | ((_sha512[416 + 2] << 9) & $ffff);
            _sha512[416 + 2] = (_sha512[416 + 2] >> 7) | ((_sha512[416 + 1] << 9) & $ffff);
            _sha512[416 + 1] = (_sha512[416 + 1] >> 7) | ((_sha512[416 + 0] << 9) & $ffff);
            _sha512[416 + 0] = (_sha512[416 + 0] >> 7) | ((add1 << 9) & $ffff);
         
     
        _sha512[392] = _sha512[408] ^ _sha512[412] ^ _sha512[416]; _sha512[392 + 1] = _sha512[408 + 1] ^ _sha512[412 + 1] ^ _sha512[416 + 1]; _sha512[392 + 2] = _sha512[408 + 2] ^ _sha512[412 + 2] ^ _sha512[416 + 2]; _sha512[392 + 3] = _sha512[408 + 3] ^ _sha512[412 + 3] ^ _sha512[416 + 3];;
     
        //404
        _sha512[404 + 3] = (_sha512[360 + 3] & _sha512[364  + 3]) ^ (_sha512[360 + 3] & _sha512[368 + 3]) ^ (_sha512[364 + 3] & _sha512[368 + 3]);
        _sha512[404 + 2] = (_sha512[360 + 2] & _sha512[364  + 2]) ^ (_sha512[360 + 2] & _sha512[368 + 2]) ^ (_sha512[364 + 2] & _sha512[368 + 2]);
        _sha512[404 + 1] = (_sha512[360 + 1] & _sha512[364  + 1]) ^ (_sha512[360 + 1] & _sha512[368 + 1]) ^ (_sha512[364 + 1] & _sha512[368 + 1]);
        _sha512[404] = (_sha512[360] & _sha512[364]) ^ (_sha512[360] & _sha512[368]) ^ (_sha512[364] & _sha512[368]);
     
        //j * 4 = k[j]
        add1 = _sha512[388 + 3] + _sha512[396 + 3] + _sha512[400 + 3] + _sha512[j * 4 + 3] + _sha512[(420 + (j) * 4) + 3]; add2 = _sha512[388 + 2] + _sha512[396 + 2] + _sha512[400 + 2] + _sha512[j * 4 + 2] + _sha512[(420 + (j) * 4) + 2] + (add1 >> 16); add3 = _sha512[388 + 1] + _sha512[396 + 1] + _sha512[400 + 1] + _sha512[j * 4 + 1] + _sha512[(420 + (j) * 4) + 1] + (add2 >> 16); add4 = _sha512[388] + _sha512[396] + _sha512[400] + _sha512[j * 4] + _sha512[(420 + (j) * 4)] + (add3 >> 16); _sha512[352 + 3] = add1 & $00ffff; _sha512[352 + 2] = add2 & $00ffff; _sha512[352 + 1] = add3 & $00ffff; _sha512[352] = add4 & $00ffff;
     
        add1 = _sha512[392 + 3] + _sha512[404 + 3]; add2 = _sha512[392 + 2] + _sha512[404 + 2] + (add1 >> 16); add3 = _sha512[392 + 1] + _sha512[404 + 1] + (add2 >> 16); add4 = _sha512[392] + _sha512[404] + (add3 >> 16); _sha512[356 + 3] = add1 & $00ffff; _sha512[356 + 2] = add2 & $00ffff; _sha512[356 + 1] = add3 & $00ffff; _sha512[356] = add4 & $00ffff;
     
        _sha512[388] = _sha512[384]; _sha512[388 + 1] = _sha512[384 + 1]; _sha512[388 + 2] = _sha512[384 + 2]; _sha512[388 + 3] = _sha512[384 + 3];;
        _sha512[384] = _sha512[380]; _sha512[384 + 1] = _sha512[380 + 1]; _sha512[384 + 2] = _sha512[380 + 2]; _sha512[384 + 3] = _sha512[380 + 3];;
        _sha512[380] = _sha512[376]; _sha512[380 + 1] = _sha512[376 + 1]; _sha512[380 + 2] = _sha512[376 + 2]; _sha512[380 + 3] = _sha512[376 + 3];;
        add1 = _sha512[372 + 3] + _sha512[352 + 3]; add2 = _sha512[372 + 2] + _sha512[352 + 2] + (add1 >> 16); add3 = _sha512[372 + 1] + _sha512[352 + 1] + (add2 >> 16); add4 = _sha512[372] + _sha512[352] + (add3 >> 16); _sha512[376 + 3] = add1 & $00ffff; _sha512[376 + 2] = add2 & $00ffff; _sha512[376 + 1] = add3 & $00ffff; _sha512[376] = add4 & $00ffff;
 
        _sha512[372] = _sha512[368]; _sha512[372 + 1] = _sha512[368 + 1]; _sha512[372 + 2] = _sha512[368 + 2]; _sha512[372 + 3] = _sha512[368 + 3];;
        _sha512[368] = _sha512[364]; _sha512[368 + 1] = _sha512[364 + 1]; _sha512[368 + 2] = _sha512[364 + 2]; _sha512[368 + 3] = _sha512[364 + 3];;
        _sha512[364] = _sha512[360]; _sha512[364 + 1] = _sha512[360 + 1]; _sha512[364 + 2] = _sha512[360 + 2]; _sha512[364 + 3] = _sha512[360 + 3];;
        add1 = _sha512[352 + 3] + _sha512[356 + 3]; add2 = _sha512[352 + 2] + _sha512[356 + 2] + (add1 >> 16); add3 = _sha512[352 + 1] + _sha512[356 + 1] + (add2 >> 16); add4 = _sha512[352] + _sha512[356] + (add3 >> 16); _sha512[360 + 3] = add1 & $00ffff; _sha512[360 + 2] = add2 & $00ffff; _sha512[360 + 1] = add3 & $00ffff; _sha512[360] = add4 & $00ffff;
    }
 
 
    add1 = _sha512[320 + 3] + _sha512[360 + 3]; add2 = _sha512[320 + 2] + _sha512[360 + 2] + (add1 >> 16); add3 = _sha512[320 + 1] + _sha512[360 + 1] + (add2 >> 16); add4 = _sha512[320] + _sha512[360] + (add3 >> 16); _sha512[320 + 3] = add1 & $00ffff; _sha512[320 + 2] = add2 & $00ffff; _sha512[320 + 1] = add3 & $00ffff; _sha512[320] = add4 & $00ffff;
    add1 = _sha512[324 + 3] + _sha512[364 + 3]; add2 = _sha512[324 + 2] + _sha512[364 + 2] + (add1 >> 16); add3 = _sha512[324 + 1] + _sha512[364 + 1] + (add2 >> 16); add4 = _sha512[324] + _sha512[364] + (add3 >> 16); _sha512[324 + 3] = add1 & $00ffff; _sha512[324 + 2] = add2 & $00ffff; _sha512[324 + 1] = add3 & $00ffff; _sha512[324] = add4 & $00ffff;
    add1 = _sha512[328 + 3] + _sha512[368 + 3]; add2 = _sha512[328 + 2] + _sha512[368 + 2] + (add1 >> 16); add3 = _sha512[328 + 1] + _sha512[368 + 1] + (add2 >> 16); add4 = _sha512[328] + _sha512[368] + (add3 >> 16); _sha512[328 + 3] = add1 & $00ffff; _sha512[328 + 2] = add2 & $00ffff; _sha512[328 + 1] = add3 & $00ffff; _sha512[328] = add4 & $00ffff;
    add1 = _sha512[332 + 3] + _sha512[372 + 3]; add2 = _sha512[332 + 2] + _sha512[372 + 2] + (add1 >> 16); add3 = _sha512[332 + 1] + _sha512[372 + 1] + (add2 >> 16); add4 = _sha512[332] + _sha512[372] + (add3 >> 16); _sha512[332 + 3] = add1 & $00ffff; _sha512[332 + 2] = add2 & $00ffff; _sha512[332 + 1] = add3 & $00ffff; _sha512[332] = add4 & $00ffff;
    add1 = _sha512[336 + 3] + _sha512[376 + 3]; add2 = _sha512[336 + 2] + _sha512[376 + 2] + (add1 >> 16); add3 = _sha512[336 + 1] + _sha512[376 + 1] + (add2 >> 16); add4 = _sha512[336] + _sha512[376] + (add3 >> 16); _sha512[336 + 3] = add1 & $00ffff; _sha512[336 + 2] = add2 & $00ffff; _sha512[336 + 1] = add3 & $00ffff; _sha512[336] = add4 & $00ffff;
    add1 = _sha512[340 + 3] + _sha512[380 + 3]; add2 = _sha512[340 + 2] + _sha512[380 + 2] + (add1 >> 16); add3 = _sha512[340 + 1] + _sha512[380 + 1] + (add2 >> 16); add4 = _sha512[340] + _sha512[380] + (add3 >> 16); _sha512[340 + 3] = add1 & $00ffff; _sha512[340 + 2] = add2 & $00ffff; _sha512[340 + 1] = add3 & $00ffff; _sha512[340] = add4 & $00ffff;
    add1 = _sha512[344 + 3] + _sha512[384 + 3]; add2 = _sha512[344 + 2] + _sha512[384 + 2] + (add1 >> 16); add3 = _sha512[344 + 1] + _sha512[384 + 1] + (add2 >> 16); add4 = _sha512[344] + _sha512[384] + (add3 >> 16); _sha512[344 + 3] = add1 & $00ffff; _sha512[344 + 2] = add2 & $00ffff; _sha512[344 + 1] = add3 & $00ffff; _sha512[344] = add4 & $00ffff;
    add1 = _sha512[348 + 3] + _sha512[388 + 3]; add2 = _sha512[348 + 2] + _sha512[388 + 2] + (add1 >> 16); add3 = _sha512[348 + 1] + _sha512[388 + 1] + (add2 >> 16); add4 = _sha512[348] + _sha512[388] + (add3 >> 16); _sha512[348 + 3] = add1 & $00ffff; _sha512[348 + 2] = add2 & $00ffff; _sha512[348 + 1] = add3 & $00ffff; _sha512[348] = add4 & $00ffff;
}
 
//convert hash to hex string
hex = "0123456789abcdef";
output = "";
for (i = 0; i < 8; i++)
{
    for(j = 0; j < 4 ; j++)
    {
        b = _sha512[(320 + i * 4) + j];
        output += string_char_at(hex, ((b >> 12) & $f) + 1) +
                    string_char_at(hex, ((b >> 8) & $f) + 1) +
                    string_char_at(hex, ((b >> 4) & $f) + 1) +
                    string_char_at(hex, (b & $f) + 1);
    }
}
 
return output;