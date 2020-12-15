# habit-tracker
A habit tracker app: Track events, habits, and random things in your day-to-day life.

Problem Statement: 
When keeping track of habits, routines, or recurring events in life, I can't stay motivated and stay organized of all responsibilities because...
1. I easily forget about smaller tasks when I have multiple overlapping responsibilities. (be more specific about what smaller task is)
2. It takes long-term consistent effort to accomplish a goal or see a physical progress. (why is this an issue, takes dedication and discipline, not everyone has on their own)
3. There is no sense of competitiveness in self-driven activities. (can be a source of stress, think about wording, what contents they can share)


GitHub Repository: https://github.com/nduhiulinda/habit-tracker
Design Prototype: https://www.figma.com/file/ZWx8TE9ynG3SXdkorvUgbD/Hack-Challenge---Habit%2F-Life-Tracker-App?node-id=136%3A5

App Description/iOS Requirements
- The main page (a Navigation View Controller) displays a UITableView of all of the user’s currently tracked habits/trackers. This page accesses the backend API through a GET request to get all existing trackers
- From the main page, users can click the plus button to add a new tracker, which is presented modally. This page features a form with all of the information needed to establish a new tracker, and by clicking the Save button at the bottom, the application uses a POST request to add this information to the database, where it will be accessed and displayed on the rest of the app.
- The main page, specifically in the UITableView, also allows users to log a record of the trackers, which appears on a UIView with enough information to add a record to the tracker at hand
- The bottom navigation of the home page features the Summary tab icon, which shows users trends in their habits, using an external library called PNChart
- The profile page shows users an overview of their completed/in progress habits and their preferences

Backend Requirements
- Implemented SQLAlchemy models for tracker with entities Tracker, Day, CustomRecord, and Template
- API documentation for endpoints: https://documenter.getpostman.com/view/12873040/TVsoGW3v#1b9a598f-9569-4723-996e-d46c3fd4f266
- Deployed on host address: https://cs1998trackers.herokuapp.com/
- 5 GET, 2 POST and 2 DELETE routes.


