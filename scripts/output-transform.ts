import console from "console";

import fs from "fs-extra";
import glob from "glob";

console.log("TRANSFORMING OUTPUT");

glob.sync("./src/**/*.lua").forEach((luaFile) => {
  const fileContents = fs.readFileSync(luaFile, {
    encoding: "utf8",
  });

  const newFileContents = fileContents
    .replace(
      new RegExp("process\\.env\\.NODE_ENV", "gm"),
      `os.getenv("NODE_ENV")`
    )
    .replace(new RegExp("\\.init", "gm"), "");

  fs.writeFileSync(luaFile, newFileContents);
});
