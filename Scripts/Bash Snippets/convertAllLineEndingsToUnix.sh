#convert all line endings to unix format in current directory
find . -type f -print0 | xargs -0 dos2unix