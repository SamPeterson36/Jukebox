function Jukebox
%sets background color to black 
set (0, 'DefaultFigureColor', [0 0 0])
%global variable 
global box; 
%uicontrols for money, uses pushbuttons with callback functions 
box.money = 0.00; 
box.fig = figure('numbertitle', 'off', 'name', 'Jukebox');
box.moneyDisplayMessage = uicontrol('style', 'text', 'units', 'normalized', 'position', [.024 .10 .09 .05], 'string', 'Balance:', 'horizontalalignment', 'right', 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);
box.moneyDisplay = uicontrol('style', 'text', 'units', 'normalized', 'position', [.15 .10 .09 .05], 'string', num2str(box.money), 'horizontalalignment', 'right', 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);
box.quarterSlot = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position', [.034 .007 .14 .05], 'string', 'Add 25¢', 'callback', {@addMoney, .25}, 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);
box.dollarSlot = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position', [.184 .007 .14 .05], 'string', 'Add $1', 'callback', {@addMoney, 1.00}, 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]); 
%uicontrol for the playbutton, uses a togglebutton with a callback function
box.playbutton = uicontrol('style', 'togglebutton', 'units', 'normalized', 'position', [.20 .60 .18 .05], 'string', 'Play/Pause', 'callback', {@playPause}, 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);
%uicontrols to select each song, uses pushbuttons with callback functions 
box.song(1) = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position', [.50 .65 .35 .05], 'string', 'Wants and Needs (feat. Lil Baby) - Drake', 'callback', {@songSelect, .50}, 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);
box.price(1) = uicontrol('style', 'text', 'units', 'normalized', 'position', [.42 .65 .07 .05], 'string', '50¢', 'horizontalalignment', 'right', 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);

box.song(2) = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position', [.50 .55 .35 .05], 'string', 'Mood (feat. iann dior) - 24kGoldn', 'callback', {@songSelect, .50}, 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);
box.price(2) = uicontrol('style', 'text', 'units', 'normalized', 'position', [.42 .55 .07 .05], 'string', '50¢', 'horizontalalignment', 'right', 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);

box.song(3) = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position', [.50 .45 .35 .05], 'string', 'forget me too (feat. Halsey) - Machine Gun Kelly', 'callback', {@songSelect, .50}, 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);
box.price(3) = uicontrol('style', 'text', 'units', 'normalized', 'position', [.42 .45 .07 .05], 'string', '50¢', 'horizontalalignment', 'right', 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);

box.song(4) = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position', [.50 .75 .35 .05], 'string', 'Peaches (feat. Daniel Caesar & Giveon) - Justin Bieber', 'callback', {@songSelect, .50}, 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);
box.price(4) = uicontrol('style', 'text', 'units', 'normalized', 'position', [.42 .75 .07 .05], 'string', '50¢', 'horizontalalignment', 'right', 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);
%uicontrol for volume, uses callback function to display the current volume
%to the right 
box.volume = uicontrol('style', 'slider','Min', 0,'Max', 10,'SliderStep',[0.1 1], 'units', 'normalized', 'position', [.50 .25 .25 .05], 'string', 'Volume', 'callback', {@volumeSelect}, 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]); 
box.volumeLevel = 0;
box.volumeDisplay = uicontrol('style', 'text', 'units', 'normalized', 'position', [.75 .25 .09 .05], 'string', num2str(box.volumeLevel), 'horizontalalignment', 'right', 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);
box.moneyDisplayMessage = uicontrol('style', 'text', 'units', 'normalized', 'position', [.625 .30 .09 .05], 'string', 'Volume', 'horizontalalignment', 'right', 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);
%uicontrol for bass/treble, uses callback function to display current
%level off to the right 
box.bass = uicontrol('style', 'slider','Min', -10,'Max', 10,'SliderStep',[0.1 1], 'units', 'normalized', 'position', [.50 .10 .25 .05], 'string', 'Volume', 'callback', {@bassSelect}, 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]); 
box.bassLevel = 0;
box.bassDisplay = uicontrol('style', 'text', 'units', 'normalized', 'position', [.75 .10 .09 .05], 'string', num2str(box.volumeLevel), 'horizontalalignment', 'right', 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);
box.moneyDisplayMessage = uicontrol('style', 'text', 'units', 'normalized', 'position', [.625 .15 .1 .06], 'string', 'Bass/Treble', 'horizontalalignment', 'right', 'ForegroundColor', [0.3010 0.7450 0.9330], 'BackgroundColor', [0 0 0]);
end 
%callback function to add more money 
function [] = addMoney(source, event, money)
global box; 
    box.money = box.money + money;
    box.moneyDisplay.String = num2str(box.money);
end
%callback function for play/pause toggle button 
function [] = playPause(source, event)
global box; 
%It is initally set to play, when pushed it turns to paused with a
%messagebox telling you that it has been paused/played 
    if get(box.playbutton,'value') == 0 
        status = 'Your song is now playing'; 
        msgbox(status, 'Playing');
    elseif get(box.playbutton, 'value') == 1
        status = 'Your song is now paused'; 
        msgbox(status, 'Paused');
    end 
end
%Callback function for song selection, subtracts price for song from
%current balance 
function [] = songSelect(source, event, price) 
global box; 
    if box.money >= price 
        song = [source.String, ' has been selected. Enjoy :)'];
        msgbox(song, 'Song Selection'); 
        box.money = box.money - price; 
        box.moneyDisplay.String = num2str(box.money);
    else 
       msgbox('Insufficient Funds :(', 'Juke Box Error', 'error', 'modal');
    end 
end
%callback function for volume slider 
function [] = volumeSelect(source, event)
global box; 
    box.volumeLevel = get(box.volume, 'value'); 
    box.volumeDisplay.String = num2str(box.volumeLevel); 
end
%callback function for bass/treb slider 
function [] = bassSelect(source, event)
global box; 
    box.bassLevel = get(box.bass, 'value'); 
    box.bassDisplay.String = num2str(box.bassLevel); 
end
