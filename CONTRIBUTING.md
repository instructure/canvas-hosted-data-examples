# Contributing to Hosted-Data-Examples #

If you choose to contribute a pull request to Hosted-Data-Examples, following these guidelines will make things easier
for you and for us:

 - Your pull request should generally consist of a single commit.  This helps keep the git history clean
   by keeping each commit focused on a single purpose.  If you have multiple commits that keep that focus
   then that is acceptable, however "train of thought" commits should not be in the history.
 - Your commit message should follow this general format:

   ```
    Summary of the commit (Subject)

    Further explanation of the commit, specifically how it will come in useful to other schools,
    and maybe even a little bit about how it's helped you.

    closes gh-123 (if this closes a GitHub Issue)
   ```

 - The process your pull request goes through is as follows:
    - An Instructure engineer will pull the request down and run it in a demo redshift making sure it returns what appears to be expected results.
    - An Instructure engineer will look through your SQL, and make sure there are no "Huge" performance issues that can be quickly resolved.
    - Once all these things have occurred then an engineer will merge your commit into the repository.
    - Congratulations! You are now a Hosted Data Example contributor!  Thank you for helping make Hosted Data Example great.
