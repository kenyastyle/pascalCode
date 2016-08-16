{
   FeldMerge.pas
   
   Copyright 2016 Roman Kostal <Wonder@Romans-MacBook-Pro.local>
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
}


program merge (input, output);
{ liest ohne Eingabeueberpruefung zwei sortierte Felder mit 
  integer-Zahlen ein; beide Felder werden in einem weiteren Feld
  sortiert zusammengefuegt; das Ergebnis wird ausgegeben; ist 
  die Eingabe unsortiert, so ist das Ergebnisfeld undefiniert }
  const
  FELDLAENGE1 = 5;
  FELDLAENGE2 = 8;
  ERGEBNISFELDLAENGE = FELDLAENGE1 + FELDLAENGE2; { FELDLAENGE1 + FELDLAENGE2 }
        
  type
  tFeld1 = array [1..FELDLAENGE1] of integer;
  tFeld2 = array [1..FELDLAENGE2] of integer;
  tErgebnisFeld = array [1..ERGEBNISFELDLAENGE] of integer;

  var
  Feld1 : tFeld1;
  Feld2 : tFeld2;
  ErgebnisFeld : tErgebnisFeld;
  i : integer;
  j : integer;
  k : integer;
  
begin
  { sortierte Felder einlesen }
  writeln ('Bitte', FELDLAENGE1:2, ' Werte des ersten Feldes ',
           'sortiert eingeben!');
  for i := 1 to FELDLAENGE1 do
    readln (Feld1[i]);
  writeln ('Bitte', FELDLAENGE2:2, ' Werte des zweiten Feldes ',
           'sortiert eingeben!');
  for j := 1 to FELDLAENGE2 do
    readln (Feld2[j]);

  { Verschmelzungsprozess beginnen }
  i := 1;
  j := 1;
  for k := 1 to ERGEBNISFELDLAENGE do
  begin
    if (FELDLAENGE2 < j) or ((i <= FELDLAENGE1) and (Feld1[i] <= Feld2[j])) then
    begin
      ErgebnisFeld[k] := Feld1[i];
      i := i + 1;
    end
    else
    begin
      if (FELDLAENGE1 < i) or ((j <= FELDLAENGE2) and (Feld2[j] <= Feld1[i])) then
      ErgebnisFeld[k] := Feld2[j];
      j := j + 1;
    end;
    
    
    {beautyCheck}
    if k > 1 then
      if (ErgebnisFeld[k]) < (ErgebnisFeld[k-1]) then
      begin
        for i := 1 to ERGEBNISFELDLAENGE do
        begin
          ErgebnisFeld[k] := 0;
        end;
        writeln('entered lists are not sorted!');
      end;
      
  end; {fulfills requirement}
   
   
  writeln ('Das Ergebnisfeld ist:');
  for k := 1 to ERGEBNISFELDLAENGE do
    write (ErgebnisFeld[k], ' ');
  writeln
end.
