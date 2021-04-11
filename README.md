# terminal-application-T1A3

#### R3. Provide full attribution to referenced sources

[Graphics in PPT presentation](https://www.vecteezy.com/vector-art/172026-piggy-bank-vector-set)
#### R4. Provide a link to your source control repository
[Source control repository](https://github.com/KateAnisha/terminal-application-T1A3)

#### R5. Develop a statement of purpose and scope for your application. It must include:
#### Describe at a high level what the application will do
Pennyful helps the average person keep track of their finances, savings goals and to live within their means (but is not intended to restrict entertainment and other lifestyle enjoyments). It does this by allowing the user to enter in their income and expenditure. Gain insight to where their money is going and create positive financial habits. Spending too much on take away? Pennyful will let you know. 

Pennyful also helps you set a savings goal and track your progress as you make regular contributions. Pennyful also allows you to set up an emergency fund in addition to your savings goals. Contribute to your emergency fund and check your progress.

#### Identify the problem it will solve and explain why you are developing it
Pennyful gives you insight to where your money is going and helps keep you on track for your financial goals. Pennyful aims to teach healthy money management and good financial habits for those struggling to keep track of their expenditure and stay focused on their financial goals.   

With the cost of living and housing prices increasing at a rate higher than the average income, increasing credit card debt and now applications like Afterpay and Zip becoming popular, our personal relationship with finances is often overlooked or ignored. I am developing this application as I have an interest in Self Wealth and ensuring that I don't live above my means. I wish to help those struggling with their finances or anyone wanting to keep a record of their expenditure to ensure they don't live above their means and stick to their budget. 

#### Identify the target audience
My target audience will be anyone looking to track their finance and savings goals whether it be kids or adults. This terminal application is for those wanting accountability and focus. Use Pennful to assist with your savings goals, whether it be saving for a house, car or a trip overseas.

#### Explain how a member of the target audience will use it
Pennyful operates on the command line. Users will be able to enter in their income and expenses, create a savings goal, contribute to the savings goal, set up an emergency fund and contribute to the emergency fund. Users will also be able to see their balances at any point and their current expenditure. 

#### R6. Develop a list of features that will be included in the application.
#### 1. Feature - Custom accounts
The user will be able to set up and create custom accounts to track expenditure. For example, they could allocate funds spent on food, health, bills etc. Once custom accounts have been set up, they can record expenses towards them.
##### Implementation 
I have implemented this by using an array stored in a hash. The data can be accessed by iterating over the array. By default the user will be set up with an income account which the balance will start at 0.

#### 2. Feature - Record income and expenses
Once the user has set up their desired categories, they can record expenses and income towards it. By default, the user will be set up with an income account which they can put any earnings towards. Whenever they spend money and allocate it to their desired expense account, it will be deducted from the income account. 

##### Implementation
This will be stored into a hash then pushed to an array within a hash.
I have implemented this feature by pulling the data from the array stored within the hash and allocating balances to the key/value pair. I have also utilized the operand subtraction to deduct from the income account.

#### 3. Feature
The user will be able to display the information as chart. This will give the user a visual breakdown to what they have spent the most money on. The chart will be displayed in different colours and this will also provide the user with a legend. Not only is the pie chart color coded, it will randomly select a symbol to differentiate between the different accounts. 
##### Implementation
This feature will be implemented and executed by using the Ruby Gem TTY-Pie. Implementing this feature proved to be quite tricky as TTY-Pie requires a specific format.  

Firstly I created an empty array called data. 
Then I iterated over the key accounts within the user hash. 
I set up two more arrays, one to hold the colours and the other to hold the synbols. 

Then another temporary hash was created to convert my users key and value into the correct key value format that TTY-Pie accepts.The colours and symbols were randomized and the temp hash pushed into the data array. Lastly, the Pie chart was called.

#### R7. Develop an outline of the user interaction and experience for the application.
The user will interact with my program via keyboard input.

For example, to access menus and sub-menus, the user will be required to enter a number between 1-5 or a letter from a-b. Further guided instructions are provided within the application. The user will also utilise the number keys from 1 - 0 and the enter key. 

#### R8. Develop a diagram which describes the control flow of your application. 
![UML Diagram](docs/UMLDiagram.png)

#### R9. Develop an implementation plan which outlines how each feature will be implemented and a checklist of tasks for each feature
[Link to Trello Board](https://trello.com/b/cawbGXTJ/t1a3)
##### Custom user profiles
- Create empty hash to store users information
- Display options to user to create profile
- Get profile name from user using keyboard input
- push/store users name to the hash created in step 1
- Create empty data type to store users custom category
- push and store profile name to CSV which includes the default income account with a balance of 0. 
- Begin loop to prompt user to create another account
- Return user to log in menu

##### Track expenses and income
- Loop through the menu options
- By using the menu options the user will be able to deposit funds into their income account. The program will loop through and request the user input funds. This will also be converted to a float. 
- The income will be stored against the key/value pair in the hash
- Next the loop will return the user to the sub-menu and they will then be able to create custom categories.
- This will continue until the user is finished
- Next the user can then choose an account and apply expenses towards it. Whatever amount they put towards the account will be subtracted from the income account. 

##### Export to pie graph
- Upon selecting this option in the main menu, the program will get all users expense accounts from the hash.
- The program then formats the data into the correct format
- The users information will then be displayed in a colour coded format which outputs to the screen. 

#### R10. Steps to install the code. 
If you do not have Ruby on your computer, follow these instructions to download and install https://www.ruby-lang.org/en/documentation/installation/

Clone the project files [Here](https://github.com/KateAnisha/terminal-application-T1A3) onto your computer.

On the terminal command line, navigate to the directory you have just cloned.

Run the file `./install_script.sh` in your terminal. The application should install all necessary gems and related files.

Please note tht this application has not been tested on windows. 

##### Dependencies 
colorize
ruby_figlet
tty-pie 
