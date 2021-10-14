#  IS 543 Project 1 README -- Katie Bankhead

## What I did well

- I finished all of the main requirements, which was honestly unexpected. Based on my experience in IS 542 last semester, I was prepared to be unable to complete everything, but I feel really good about how much I was able to learn, understand, and accomplish in this short time.
- I learned a lot about SwiftUI and how to find answers in Apple's documentation
- Learning about the differences between models, views, and viewmodels, and how the three interact
- Understanding the logic of UserDefaults and AppStorage: it was really confusing at first but I have a decent understanding now
- I loved building the interfaces! That's my favorite thing to do.
- Pushing through the struggle of learning: I tried a lot of different solutions that didn't work. I'd look at documentation and plug in different options, only to find out that something wasn't possible (turns out it's really hard to loop through the gameType enum in a View). But I learned the most from the times that I had to struggle to find an answer.
- I had a good mix of being helped from friends, lecture recordings, Youtube videos, and Slack, but I also helped a lot of friends and answered questions on Slack. Coding is a much better experience when you have a good team to support you. Thanks for all the resources you gave us!

## What I did not so well

- Even though I finished the main requirements, there's a few bugs, or details that I didn't get to:
    - Non-played themes have a high score of 0, not "Never played"
    - Invalid frame dimension warning: This occurred in the Temple Match theme when I drew the capsule bonus time countdown. I can understand why the warning is happening, but didn't figure out how to fix it without breaking the capsule countdown.
- I'm sure that several parts of my project are not as elegant as they could be
    - Model file is a little difficult to read and understand
    - Some logic is split in weird ways between Model and ViewModel
    - I had to mix using AppStorage and regular UserDefault for the sound effects and card pair counts, because my ViewModel would not accept AppStorage in my createGame() function
    - Shape Scape theme will break when user specifies more card pairs than Shape Scape has
