import lin

var build = sequence("build", help = "Build Nim")
var clean = sequence("clean", help = "Clean up nim build", reverse = true)

var srcRepo = strVar("src-repo", help = "URL to clone Nim from", default = "https://github.com/nim-lang/Nim.git")
var srcBranch = strVar("src-branch", help = "Branch to base build on", default = "version-1-6")

var srcDir = "nimsrc" / srcBranch.strVal

build.step "clone":
  if dirExists(srcDir):
    skip "Already cloned"
  sh "git", "clone", srcRepo.strVal, "--branch", srcBranch.strVal, srcDir

clean.step "clone":
  if not dirExists(srcDir):
    skip "Already deleted"
  removeDir(srcDir)
