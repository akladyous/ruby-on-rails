// const path = require("path");
// const rails = require("esbuild-rails");

// require("esbuild")
//     .build({
//         entryPoints: ["application.js"],
//         bundle: true,
//         outdir: path.join(process.cwd(), "app/assets/builds"),
//         absWorkingDir: path.join(process.cwd(), "app/javascript"),
//         watch: process.argv.includes("--watch"),
//         plugins: [rails()],
//     })
//     .catch(() => process.exit(1));

const path = require("path");

const watch = process.argv.includes("--watch");
const minify = process.argv.includes("--minify");

const watchOptions = {
    onRebuild: (error, result) => {
        if (error) {
            console.error("watch build failed:", error);
        } else {
            console.log(result);
            console.log("watch build succeeded. ");
        }
    },
};

require("esbuild")
    .build({
        entryPoints: ["application.js"],
        logLevel: "info",
        bundle: true,
        outdir: path.join(process.cwd(), "app/assets/builds"),
        absWorkingDir: path.join(process.cwd(), "app/javascript"),
        watch: watch && watchOptions,
        // custom plugins will be inserted is this array
        plugins: [],
    })
    .then((result) => {
        console.log(result);
        if (watch) {
            console.log("Build complete. Watching for changes...");
        } else {
            console.log("Build complete. No watch.");
        }
    })
    .catch((result) => {
        console.error(result);
        process.exit(1);
    });
