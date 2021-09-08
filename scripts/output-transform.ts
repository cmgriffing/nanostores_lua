import console from "console";

import fs from "fs-extra";
import glob from "glob";

console.log("TRANSFORMING OUTPUT");

fs.mkdirpSync("lib");

glob.sync("./src/**/*.lua").forEach((luaFile) => {
  const fileContents = fs.readFileSync(luaFile, {
    encoding: "utf8",
  });

  let newFileContents = fileContents
    .replace(
      new RegExp("process\\.env\\.NODE_ENV", "gm"),
      `os.getenv("NODE_ENV")`
    )
    .replace(new RegExp(`require\\("`, "gm"), 'require("lib.')
    .replace(new RegExp(`\\.init"`, "gm"), '"');

  const splitFilePath = luaFile.split("/nanostores/");
  const filePath = splitFilePath[splitFilePath.length - 1];

  const nanostoreModule = filePath
    .replace(".lua", "")
    .replace("/init", "")
    .replace("./src/", "");

  if (nanostoreModule === "./src") {
    fs.writeFileSync(`./nanostores.lua`, newFileContents);
  } else {
    fs.writeFileSync(`./lib/${nanostoreModule}.lua`, newFileContents);
  }
});
