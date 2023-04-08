Unit 8: Group Milestone - README
===

:::info
**Below is an example** of what your **Group Project README** should include and how it should be structured for the **Unit 8 Group Milestone Submission**.
:::

# WalletWise
Spending made smart


## Problem
Many people struggle with financial literacy and keeping their finances organized. This can lead to overspending and missed opportunities for saving money. Traditional methods of tracking expenses can be time-consuming and inefficient. However, with the help of technology and tools like expense tracking apps, it is now easier than ever to manage finances effectively. By providing a calendar-based system, automatic metadata retrieval, and other features, expense tracking apps like WalletWise are helping to solve the common problem of financial illiteracy and disorganization.

## Proposal
Develop an ios calendar-based expense tracker app that would allow the user to track his/her expenses throughout the week/month/year and access the details of each expense(receipt picture? locations on a map? description?)

## Requirements
Apple Calendar API, Apple Pay API, Map API…

## Stretch Requirements
Instead of allowing the user to manually enter expenses, we could additionally integrate Apple Pay/Wallet API so the user’s expenses will automatically show up on the calendar and we can retrieve the picture and location by accessing the metadata of the expense. We could also add a Tip Calculator feature that would calculate the tip amount for the user and add it as an expense.



# VIEWS
* Login View
* Signup View
* Profile View 
* Calendar View - Home Screen
* Tab Bar -  with the following options: Summary, Tips Calculator, Logout, Profile
* Subview: Summary View
* Subview: Infographics view - summary of expenses based on each category
* Subview: List of Expenses for that specific Day
* Subview: Expense View - receipt, location, description, category…




### App Evaluation
- **Category:** Social Networking / Music
- **Mobile:** This app would be primarily developed for mobile but would perhaps be just as viable on a computer, such as tinder or other similar apps. Functionality wouldn't be limited to mobile devices, however mobile version could potentially have more features.
- **Story:** Analyzes users music choices, and connects them to other users with similar choices. The user can then decide to message this person and befriend them if wanted.
- **Market:** Any individual could choose to use this app, and to keep it a safe environment, people would be organized into age groups.
- **Habit:** This app could be used as often or unoften as the user wanted depending on how deep their social life is, and what exactly they're looking for.
- **Scope:** First we would start with pairing people based on music taste, then perhaps this could evolve into a music sharing application as well to broaden its usage. Large potential for use with spotify, apple music, or other music streaming applications.

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User logs in to access previous chats and preference settings
* User picks what their favorite artist/genre/etc. (Think Spotify interface)
* Matches have a chat window to get to know each other, with the ability to skip music and unmatch (Tinder Style).
* Profile pages for each user
* Settings (Accesibility, Notification, General, etc.)

**Optional Nice-to-have Stories**

* Log of past songs/people with album art covers matching
* Page of most played songs (i.e. songs that most users are connecting through)
* Profile Add-On: Top music choices, etc.
* Optional Shuffle Button (i.e. random encounter/random song)
* Listening/Encounter Queue

### 2. Screen Archetypes

* Login 
* Register - User signs up or logs into their account
   * Upon Download/Reopening of the application, the user is prompted to log in to gain access to their profile information to be properly matched with another person. 
   * ...
* Messaging Screen - Chat for users to communicate (direct 1-on-1)
   * Upon selecting music choice users matched and message screen opens
* Profile Screen 
   * Allows user to upload a photo and fill in information that is interesting to them and others
* Song Selection Screen.
   * Allows user to be able to choose their desired song, artist, genre of preference and begin listening and interacting with others.
* Settings Screen
   * Lets people change language, and app notification settings.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Music selection
* Profile
* Settings

Optional:
* Music/Encounter Queue
* Discover (Top Choices)

**Flow Navigation** (Screen to Screen)
* Forced Log-in -> Account creation if no log in is available
* Music Selection (Or Queue if Optional) -> Jumps to Chat
* Profile -> Text field to be modified. 
* Settings -> Toggle settings

## Wireframes
<img src="https://i.imgur.com/9CrjH1K.jpg" width=800><br>

### [BONUS] Digital Wireframes & Mockups
<img src="https://i.imgur.com/lYHn37F.jpg" height=200>

### [BONUS] Interactive Prototype
<img src="https://i.imgur.com/AiKfE5g.gif" width=200>
