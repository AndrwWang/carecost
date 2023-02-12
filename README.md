# CareCost - healthcare expenses made simpler

For Hacklytics 2023 @ Georgia Tech, our team created CareCost, a mobile iOS application that forecasts a user's out-of-pocket healthcare expenses based on a variety of metrics. Authors: Frank Gao & Andrew Wang

## The Inspiration

After scouring data lakes, we came upon a dataset([instruction.csv](https://github.com/frankg0485/carecost/blob/main/insurance.csv)) that involved thousands of respondents. They were asked what their annual out-of-pocket healthcare costs were, and six different metrics were recorded:
* age
* sex
* BMI(body mass index)
* number of children
* whether or not they smoke regularly
* which region of the U.S. they reside in(northeast, northwest, southeast, southwest)

## The Model

From the dataset, we created a regression model using Python. The pandas and sklearn libraries enabled us to read the CSV file and convert the categorical columns into numerical ones.  From there, it generated a series of weights that we used in our application to make predictions. The r-squared value is approximately 0.751, which is solid for most financial models.

## The App

[App Demo Video](https://drive.google.com/file/d/1xh0ovouedBrqT030aVysNWF5OVIerT9n/view?usp=share_link)

The CareCost app was built entirely in Xcode using Apple's Swift language. Due to its flexibility as well as robust layout tools, we could easily fix GUI issues as they came up. Additionally, we utilized a powerful third-party library, [Charts](https://github.com/danielgindi/Charts), to help the user visualize our model's predictions.

The app itself contains four main screens, each serving a distinct purpose. After the user is welcomed by our vivid colors and stunning logo, they are taken directly to a page where they can input the metrics needed for our model to do the calculations. On the very next screen, the user is presented with a beautiful graph(again, courtesy of Charts and has the option to select from a range of years, which helps them plan for the future. The app's final screen provides the user with a handful of financial tips and ways to save money, as well as the credible sources from which they came from.

## The Challenges

Given that this hackathon revolved around data science, our group's main challenge was figuring out how to create a project that could positively impact individual users. After trying to brainstorm without guidance, we found that browsing online data sources helped us tremendously in coming up with ideas. Our next biggest challenge was integrating Charts into our app. Although we realized how powerful it was, none of us had much experience working with tools outside of the built-in ones. From reading the documentation to making numerous tests, our team gained lots of insight into the possibilities and struggles of third-party software.

## Closing Thoughts

Regardless of how we place, Hacklytics 2023 and CareCost has inspired us as developers, learners, and community members. After discovering the vast amounts of data that come from all over the world, we now understand the impact that data science has on future generations of technology, just like the endless array of constellations in the night sky...
