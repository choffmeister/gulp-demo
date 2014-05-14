$ = require("jquery")
Greeter = require("./Greeter")

g = new Greeter()
g.greet()

$(->
  $("body").css("background-color", "black")
)
