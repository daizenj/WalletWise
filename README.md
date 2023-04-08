Unit 8: Group Milestone - README
===

# WalletWise
> Spending made smart

## Category
Finance

## Problem
Many people struggle with financial literacy and keeping their finances organized. This can lead to overspending and missed opportunities for saving money. Traditional methods of tracking expenses can be time-consuming and inefficient. However, with the help of technology and tools like expense tracking apps, it is now easier than ever to manage finances effectively. By providing a calendar-based system, automatic metadata retrieval, and other features, expense tracking apps like WalletWise are helping to solve the common problem of financial illiteracy and disorganization.

## Proposal
Develop an ios calendar-based expense tracker app that would allow the user to track his/her expenses throughout the week/month/year and access the details of each expense(receipt picture? locations on a map? description?)

## Requirements
Apple Calendar API, Apple Pay API, Map API…

## Stretch Requirements
Instead of allowing the user to manually enter expenses, we could additionally integrate Apple Pay/Wallet API so the user’s expenses will automatically show up on the calendar and we can retrieve the picture and location by accessing the metadata of the expense. We could also add a Tip Calculator feature that would calculate the tip amount for the user and add it as an expense.

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User logs in to account
* User can access detailed spending view by clicking on calendar
* In the detailed spending view, user can upload receipt
* Once a receipt is uploaded user can view image/mapview of exact spending
* Profile (Customize Personal Information, Connect to Apple Pay/Bank, Logout, Help, Settings)

**Optional Nice-to-have Stories**

* User can calculate tips through the app
* Make Profile View Functional. Right now only buttons are implemented
* User's account is intergrated with Apple Pay/Wallet API

## Views
* Login View
* Signup View
* Profile View 
* Calendar View - Home Screen
* Tab Bar -  with the following options: Summary, Tips Calculator, Logout, Profile
* Subview: Summary View
* Subview: Infographics view - summary of expenses based on each category
* Subview: List of Expenses for that specific Day
* Subview: Expense View - receipt, location, description, category…

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Summary
* Tip Calculator
* Profile

**Flow Navigation** (Screen to Screen)
* Forced Log-in -> Account creation if no log in is available
* Calendar date Selection -> Jumps to Detailed View
* Profile -> Text field to be modified. 

## Wireframes
https://www.figma.com/file/5aoPD56IVWZSggGhBG4T7R/WalletWise?node-id=301%3A73213&t=FK1I2NPLHPq5SKMC-1
