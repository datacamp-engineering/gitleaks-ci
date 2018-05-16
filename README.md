# Gitleaks-CI
## Audit PRs on github before you hit that merge button
### What is?
[Gitleaks](https://github.com/zricethezav/gitleaks) is great for doing thorough audits on repos, organizations, and/or users but 
not so great for hooking into CI pipelines. **Gitleaks-CI** is 50 lines of bash code that checks your PRs for secrets you probably shouldn't be commiting 


### How to?
Gitleaks-CI is a single line of code placed in whatever CI service you or your organization uses.
```
bash <(curl -s https://raw.githubusercontent.com/zricethezav/gitleaks-ci/master/gitleaks.sh)
```
**You should fork this repo and use the `gitleaks.sh` script you own rather than assuming my trust.**

---

Here's a video demonstrating what this is all about:
TODO MAKE THAT YOUTUBE VIDEO


#### If you find leaks in your PR
Please read the [Github article on removing sensitive data from a repository](https://help.github.com/articles/removing-sensitive-data-from-a-repository/) to remove the sensitive information from your history.
