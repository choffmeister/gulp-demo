fs = require("fs")
path = require("path")

# find all tasks
tasks = fs.readdirSync("./project/tasks").filter((file) -> /\.(js|coffee)$/i.test(file))

# include all tasks
tasks.forEach((task) -> require("./tasks/" + task))
