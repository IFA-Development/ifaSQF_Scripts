// Name: Anthony
// Purpose: Alert players to ongoing story arcs during an operation.
// Files: init.sqf, storyArea.sqf

displayText = {
    params ["_trigger","_text", ["_textSize", 1], ["_duration", 5]];
    _locationArea = "The location of this story area is...";

    waitUntil {triggerActivated _trigger};
    
    _allPlayers = allPlayers;

    //check if local or not
    {
        if (_x inArea _trigger) then {
            titleText [_locationArea, "PLAIN DOWN", 0.5];
            [_text, [0,0.5, _duration, 1]] spawn BIS_fnc_dynamicText;
        };
    }forEach _allPlayers;

    sleep _duration; //prevent premature end

    
};

[trigger1, "STORY ARC: The Crumbling Cookie.", 1.5 , .10] call displayText;
