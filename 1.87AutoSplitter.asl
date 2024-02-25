
//                      _        _             _____                  
//                     | |      | |           |  __ \                 
//  _ __ ___   __ _  __| | ___  | |__  _   _  | |  | |_ __ __ _ _   _ 
// | '_ ` _ \ / _` |/ _` |/ _ \ | '_ \| | | | | |  | | '__/ _` | | | |
// | | | | | | (_| | (_| |  __/ | |_) | |_| | | |__| | | | (_| | |_| |
// |_| |_| |_|\__,_|\__,_|\___| |_.__/ \__, | |_____/|_|  \__,_|\__, |
//                                      __/ |                    __/ |
//                                     |___/                    |___/ 
// 
// Massive thanks to itsMaximum and Mysterion352

state("flashplayer") {
    int stackedData: "flashplayer.exe", 0x00A6262C, 0x3C0, 0xA4;
    int stackedDataBackup: "flashplayer.exe", 0x00A624B4, 0x13C, 0xE74;
    // stacked data is some random memory address that holds one of A or B... (ONLY B WORKS)

    // level select: 3 or 2
    // in level: 4 or 3
    // paused in level: 5 or 4
    // finish + pause: 6 or 5
    // unpause after finish 5 or 4

    // TO GO FROM A to B, CHANGE YOUR GRAPHICS QUALITY!!!
    // this will lock you in B and the autoSplitter will work
}

start {
    if (current.stackedData == 3 && old.stackedData == 1) { 
        return true;
    }
}

split {
    if (current.stackedData == 5 && old.stackedData == 3){
        return true;
    }
}

isLoading {
    if(current.stackedData == 1){
        return true;
    } else {
        return false;
    }
}

update {
	//print("stackedData: " + current.stackedData);
}
