function displayTime() {
  // Bangkok time
  var bangkokTime = new Date().toLocaleString("en-US", {timeZone: "Asia/Bangkok"});
  document.getElementById("bangkok").innerHTML = "Bangkok: " + bangkokTime;

  // Seattle time
  var seattleTime = new Date().toLocaleString("en-US", {timeZone: "America/Los_Angeles"});
  document.getElementById("seattle").innerHTML = "Seattle: " + seattleTime;

  // Denver time
  var denverTime = new Date().toLocaleString("en-US", {timeZone: "America/Denver"});
  document.getElementById("denver").innerHTML = "Denver: " + denverTime;

  // Texas time
  var texasTime = new Date().toLocaleString("en-US", {timeZone: "America/Chicago"});
  document.getElementById("texas").innerHTML = "Texas: " + texasTime;

  // New York time
  var newYorkTime = new Date().toLocaleString("en-US", {timeZone: "America/New_York"});
  document.getElementById("new-york").innerHTML = "New York: " + newYorkTime;
}

// call the displayTime function every second to update the time
setInterval(displayTime, 1000);
