uses crt;
procedure logo;
	var 
		a: Char;
	begin
		a:= chr(176);
		gotoxy(37, 5);
		writeln('       ',a,'                       ',a,'       ');
		gotoxy(37, 6);
		writeln('    ',a,'     ',a,'                 ',a,'     ',a,'    ');
		gotoxy(37, 7);
		writeln(' ',a,'           ',a,'  ',a,'  ',a,'  ',a,'  ',a,'           ',a,' ');
		gotoxy(37, 8);
		writeln('    ',a,'                             ',a,'    ');
		gotoxy(37, 9);
		writeln('       ',a,'   BAO - BUA - KEO   ',a,'     ');
		gotoxy(37, 10);
		writeln('    ',a,'                             ',a,'    ');
		gotoxy(37, 11);
		writeln(' ',a,'           ',a,'  ',a,'  ',a,'  ',a,'  ',a,'           ',a,' ');
		gotoxy(37, 12);
		writeln('    ',a,'     ',a,'                 ',a,'     ',a,'    ');
		gotoxy(37, 13);
		writeln('       ',a,'                       ',a,'       ');
	end;
procedure background;
	var 
		row,column,y: Byte;
	begin
		gotoxy(15, 3);
		for row:=1 to 85 do write(chr(164));
		gotoxy(55, 3);
		write(' FLO ');
		y:=3;
		for row:=1 to 15 do 
			begin
				inc(y);
				gotoxy(15,y);
				write(chr(164));
				for column:=1 to 83 do write(' ');
				writeln(chr(164));
			end;
		gotoxy(15, 19);
		for row:=1 to 85 do write(chr(164));
		gotoxy(55, 19);
		write(' FLO ');
		writeln;
	end;                      
var 
	player,upcase_player,computer: String;
	rd: Byte;
	presskey: char;
begin
	repeat
	textcolor(green);
	background;
	logo;
	randomize;
	gotoxy(49, 14);
	write('YOU CHOOSE: ');
	readln(upcase_player);
	player:= upcase(upcase_player);
	rd:= random(3);
	if rd = 0 then computer:= 'BAO';
	if rd = 1 then computer:= 'KEO';
	if rd = 2 then computer:= 'BUA';
	gotoxy(49, 15);
	writeln('BOT CHOOSE: ',computer);
	gotoxy(49, 16);
	write('RESULT    : ');
	if player = computer then write('Draw')
	else
		if player = 'BAO' then 
			if computer = 'KEO' then write('Lose') else write('Win')
		else 
			if player = 'KEO' then 
				if computer = 'BAO' then write('Win') else write('Lose')
			else 
				if player = 'BUA' then 
					if computer = 'BAO' then write('Lose') else write('Win');
	gotoxy(37, 17);
	write('Do you want to play again ?');
	gotoxy(37, 18);
	write('Press any key to continue, ESC to exit.');
	presskey:= readkey;
	until presskey = chr(27);
	readln
end.
