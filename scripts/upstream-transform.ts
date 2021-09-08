import console from "console";

console.log("TRANSFORMING UPSTREAM");

import fs from "fs-extra";
import glob from "glob";

const nanostoreFiles = glob.sync("./temp/nanostores/**/*.js");

nanostoreFiles.forEach((file) => {
  const fileContents = fs.readFileSync(file, {
    encoding: "utf8",
  });

  const newFileContents = fileContents
    .replace(new RegExp("Builder\\.", "gm"), "(Builder as any).")
    .replace(new RegExp("\\.js", "gm"), "")
    .replace(new RegExp("store\\.", "gm"), "(store as any).")
    .replace(new RegExp("/index", "gm"), "/init");

  fs.writeFileSync(file, newFileContents);

  const newFileName = file.replace(".js", ".ts").replace("index", "init");
  fs.renameSync(file, newFileName);
});

// modify the package.json

const tsconfigPath = "./temp/nanostores/tsconfig.json";

const tsconfigJson = fs.readFileSync(tsconfigPath, {
  encoding: "utf8",
});

const tsconfig = JSON.parse(tsconfigJson);

tsconfig.compilerOptions.noImplicitAny = false;

fs.writeFileSync(tsconfigPath, JSON.stringify(tsconfig, undefined, 2));
