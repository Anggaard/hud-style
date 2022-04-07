
enum e_pInfo {
	pHudmode,
};

new PlayerInfo[MAX_PLAYERS][e_pInfo];

public OnPlayerSpawn(playerid)
{
	if(PlayerInfo[playerid][pHudmode] == 1)//buat sistem save sendiri. biar saat player spawn hud akan berubah sesuai yang di panggil
	{
		for(new i = 0; i < 5; i++)
			PlayerTextDrawShow(playerid, ubah[playerid][i]);
		for(new i = 0; i < 7; i++)
			PlayerTextDrawHide(playerid, ubah[playerid][i]);
	}
	else if(PlayerInfo[playerid][pHudmode] == 2)
	{
		for(new i = 0; i < 7; i++)
			PlayerTextDrawShow(playerid, ubah[playerid][i]);

		for(new i = 0; i < 5; i++)
			PlayerTextDrawHide(playerid, ubah[playerid][i]);
	}
	return 1;
}

stock Updatelaparhaus(playerid)
{
    //ini taruh di pengurangan lapar/haus mu biar saat lapar haus berkurang td ga kembali ke td awal
	if(PlayerInfo[playerid][pHudmode] == 2)
	{
		for(new i = 0; i < 5; i++)
			PlayerTextDrawShow(playerid, ubah[playerid][i]);
		for(new i = 0; i < 7; i++)
			PlayerTextDrawHide(playerid, ubah[playerid][i]);
	}
	else if(PlayerInfo[playerid][pHudmode] == 1)
	{
		for(new i = 0; i < 7; i++)
			PlayerTextDrawShow(playerid, ubah[playerid][i]);

		for(new i = 0; i < 5; i++)
			PlayerTextDrawHide(playerid, ubah[playerid][i]);
	}
}

Dialog:options(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(listitem == 0)
		{
			{
                Dialog_Show(playerid, Hudmode, DIALOG_STYLE_LIST, "Hud Type","Modern\nSimple", "Select", "Cancel");
			}
		}
	}
	return 1;
}

Dialog:Hudmode(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(listitem == 0)
		{
			{

				for(new i = 0; i < 7; i++)
					PlayerTextDrawShow(playerid, ubah[playerid][i]);

				for(new i = 0; i < 4; i++)
					PlayerTextDrawHide(playerid, ubah[playerid][i]);

				PlayerInfo[playerid][pHudmode] = 2;
			}
		}
		if(listitem == 1)
		{
			{
				for(new i = 0; i < 4; i++)
					PlayerTextDrawShow(playerid, ubah[playerid][i]);

				for(new i = 0; i < 7; i++)
					PlayerTextDrawHide(playerid, ubah[playerid][i]);
			}
		}
		cmd_options(playerid, "");
	}
	return 1;
}
