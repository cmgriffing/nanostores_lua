import console from "console";
import glob from "glob";
import fs from "fs-extra";
import path from "path";

console.log("PRUNING UPSTREAM");

fs.removeSync(path.resolve("./temp/nanostores/react"));
fs.removeSync(path.resolve("./temp/nanostores/preact"));
fs.removeSync(path.resolve("./temp/nanostores/vue"));
fs.removeSync(path.resolve("./temp/nanostores/test"));
fs.removeSync(path.resolve("./temp/nanostores/img"));
fs.removeSync(path.resolve("./temp/nanostores/.github"));

glob.sync("./temp/**/*.d.ts").forEach(fs.removeSync);
glob.sync("./temp/**/*.test.ts").forEach(fs.removeSync);
glob.sync("./temp/**/*.test.js").forEach(fs.removeSync);
glob.sync("./temp/**/errors.ts").forEach(fs.removeSync);
glob.sync("./temp/**/types.ts").forEach(fs.removeSync);
