(function() {
    // Cloudflare "tracking"

    // Cloudflare's analytics are fully privacy compliant and store no 
    // personal data or create a profile of you  (unlike google which Sphinx 
    // has builtin support for :facepalm:)

    // How to opt out:
    //   - Enable "doNotTrack" in your browser
    //   - Execute this command in your javascript console:
    //       "localStorage.setItem('doNotTrack', '1')"

    if(navigator.doNotTrack != 1 && !localStorage.getItem("doNotTrack")) {
        const script = document.createElement("script");
        script.src = "https://static.cloudflareinsights.com/beacon.min.js";
        script.setAttribute("defer", "");
        script.setAttribute("data-cf-beacon", '{"token": "6576070d11914e8c95d138f3a1a8440f"}');
        script.addEventListener("error", function() {
            console.log("Welp, cloudflare analytics are blocked. You're probably using some extension to block the script... you're save from analytics (for now)!")
        })
        document.head.appendChild(script);

        console.log("Cloudflare analytics enabled.\nYou can opt out by enabling 'doNotTrack' in your browser or executing the follow command in your console:");
        console.log("localStorage.setItem('doNotTrack', '1')");
    }

    if(localStorage.getItem("doNotTrack")) {
        console.log("Cloudflare analytics disabled through the localStorage. You can enable analytics with the follow command:");
        console.log("localStorage.removeItem('doNotTrack')")
    }
})();