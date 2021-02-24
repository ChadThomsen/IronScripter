<#
Find the hidden message in this cryptogram. You’ll 
have to discover the key intervals. It could be 2,6 
or 3,8 or 6,2. To make it easier, the cryptogram is
 written so that you do not have to loop around.

 https://ironscripter.us/a-powershell-cryptogram/

CMT 22-FEB-2021
#>


$crypto = @"
P k T r 2 s z 2 * c F -
r a z 7 G u D 4 w 6 U #
g c t K 3 E @ B t 1 a Y
Q P i c % 7 0 5 Z v A e
W 6 j e P R f p m I ) H
y ^ L o o w C n b J d O
S i 9 M b e r # ) i e U
* f 2 Z 6 M S h 7 V u D
5 a ( h s v 8 e l 1 o W
Z O 7 l p K y J l D z $
- j I @ t T 2 3 R a i k
q = F & w B 6 c % H l y
"@

$varXs = 1..12
$VarYs = 1..12
$answer = @()

#Remove spaces from string
$data = $crypto.replace(" ","")

#Remove carraige return from string
$data = $data.replace([Environment]::NewLine,"")

#Convert to array
$data = $data.ToCharArray()

foreach($varX in $varXs) {
    foreach($varY in $varYs){
        #Adjust by subtract 1 since arrays start at value 0.
        $total = $varX-1  
        do {
            $answer = $answer + $data[$total]
            $total = $total + $varY
            $answer = $answer + $data[$total]
            $total = $total + $varX   
        } until ($total -gt $data.Length)

        write-host "*********************"
        write-host "Answer: $answer and X=$varX - Y=$varY"

        $answer = $null
        $total = $null
    }
}