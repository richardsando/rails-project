
# CulturePop  
#### A place to buy and sell fan made pop culture merchandise

### Contributors
|<img src="https://avatars2.githubusercontent.com/u/47937400?s=400&v=4" alt="Richard Sando" width="100"/>|<img src="https://avatars2.githubusercontent.com/u/48897382?s=460&v=4" alt="Jovan Nikolic" width="100"/>|<img src="https://avatars1.githubusercontent.com/u/45807277?s=460&v=4" alt="Melissa McAdam" width="100"/>|
|-----------|-----------|-----------|
| <a href="https://github.com/richardsando">Richard Sando</a>| <a href="https://github.com/Jovnik">Jovan Nikolic</a> | <a href="https://github.com/Bot81892">Melissa McAdam</a> |

Link to live web app:
https://gentle-atoll-70711.herokuapp.com/

Github repository:
https://github.com/richardsando/rails-project

Description of your project, including,
- Problem definition / purpose
- Functionality / features
- Screenshots
- Tech stack (e.g. html, css, deployment platform, etc)
- Instructions on how to setup, configure and use your App.
- Design documentation including,
- Design process
- User stories
- A workflow diagram of the user journey/s.
- Wireframes
- Database Entity Relationship Diagrams
- Details of planning process including,
- Project plan & timeline
- Screenshots of Trello board(s)


**_1. What is the need (i.e. challenge) that you will be addressing in your project?_**

We want to create an app that satisfies the need for pop culture enthusiasts to purchase all of their pop culture items in the one place, whether it be t-shirts, phone cases, stickers and art prints. The challenge of the website is to create a satisfactory experience for people looking to purchase items on the website, and provide an ease of access and simplicity in purchasing these items. Additionally, our website aims at completing the two way marketplace interaction by allowing users to become artists on the site themselves, and add their own products for sale on the marketplace.

**_2. Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?_**

The problem that we are trying to solve is to offer artists a chance to sell the pop culture influenced products that they create, and thereby create a catalogue of pop culture influenced products in our web store. By doing so we will enable enthusiasts to discover favourite artists and purchase products that they like. It is a problem that needs solving as it adds convenience to a users life. 

**_3. Describe the project will you be conducting and how. your App will address the needs._**

The project our team is conducting is simply creating a web store named culturePOP. In doing this project we aim to bring the needs of the artist and the needs of the buyer into account in order to create a seamless experience when selling and purchasing products in this two way marketplace. We hope to satisfy the buyers needs of being able to easily find and access products that appeal to them at the click of a button. On the other hand, we hope to satisfy the artists needs by providing them with an a relatiely easy process of becoming an artist in the first place, adding the specific product to the store and then updating the sizes and stock.

**_4. Describe the network infrastructure the App may be based on._**

Our application is deployed through the Platform Heroku, a software that allows developers to push code directly from GitHub to deployment via Heroku's platform and network infrastructure. When our application is ready, we create a new app on Heroku and push the code in our GitHub repository directly to Heroku so that Heroku can prepare it for deployment. Heroku receives the code and initiates the build process. Heroku bundles together assets that are needed to run the application, to create a 'slug', Which describes the bundled file that’s ready for deployment. Heroku executes the slug in an isolated Unix container that provides an environment for the app to run in. In turn creating you web application. 

**_5. Identify and describe the software to be used in your App._**

In the process of developing Culture POP, we used many different Languages and software to build and deploy our Ruby on Rails application. For Starters Languages, we utilized HTML, ERB and CSS for the logic and styling. 

HTML aka Hypertext Markup language is a language used for certain webpages, it allows you to render text, links, pictures and even videos to the page, that is then viewed by the use. 

ERB aka Embedded Ruby is ruby that can be embedded into HTML files, so you can use html and CSS styling together with ruby logic, this helps to separate the ‘backend’ to the views that the user interacts with.  

CSS aka Cascading Style Sheets is a styling language used to style a web pages views in other words it makes everything look pretty, well from the user's perspective. 

Ruby is another coding Language. It can’t be used to write front-end code, such as HTML or CSS, but is commonly used to write back-end logic in web applications. 

Secondly we have Ruby on Rails. Ruby on Rails  is  a web application framework written in Ruby. It’s used to create web applications. It brings in the concept of MVC (Model, Controller, View), this framework is used to separate key parts of your code into, Models - add database records, find particular data you're looking for, update that data, or remove data. Controllers - coordinates between the user, the views, and the model and Views -  using ERB shares data with the controllers and the browser so basically the main interface for the user. 

Third PostgreSQL Database. Postgres is a Database Management System based on the SQL Database Language.  Big words I know, so in really simple words Postgres collects information that is organized  in a way that can be easily accessed, managed and updated. 

Forth is Active Record, Active Record is an Object Relational Mapping tool.  It abstracts SQL query language so that code can be written in another language, like Ruby. And is used to speak to the database to request and send information. 

In Fifth place (not ranked on importance) is GitHub!! Arguably the most refreshingly helpful software in existence. GitHub is a Source Control software that allows you to work as a team on the same project without accidently destroying the work of your team mates and also a singular, which then gives you a display of progress and backup as you develop. Git is a tool that allows you to work on your local machine by yourself, or with remote teams together on a project using the Web Application connected to your local Command Line Interface. Most popular features are the ability to 'commit'/save a piece of code at a certain point in development, which can be returned to at a later date. Also using 'branches' off the project that are written independently to you own ‘master’ and ‘origin’ and doesn’t effect the core branch unless merged at a later time. 

Now lastly Deployment! In development we used Heroku. Heroku is a popular platform that allows for deployment of web applications without owning your own database or server. Users can push code in many different languages directly from GitHub to the internet via Heroku where it handles building and deployment of the application. 

**_6. Identify the database to be used in your App and provide a justification for your choice._**

The database used in the application is PostgresSQL. The sole reason behind using this as our database was so that we could successfully deploy the project to Heroku. 

**_7. Identify and describe the production database setup (i.e. postgres instance)._**

The postgres instance was set up by running 'rails new rails-project --database=postgresql' in our VS code command line when we created the app. After switching directory so that we were within the project directory we then ran 'rails db:create' to create the postgres instance.  

**_8. Describe the architecture of your App.

The Client displays the web page in a web browser and handles User Interface and user interactions with the web page. The HTTP requests and directs to the Route asked for by the users prompt. A map of pathways defined by the application, define which functions are called in the controller depending on different requests from the server. What is to be accessed and shown to the user is defined in the controller. The controller checks if the user is allowed access to the prompted route and if not, the controller then shows an error. 

In our application we have allowed users to see products, make an account, buy a product, become an artist (by subscription) and sell products. In that order. 

**_9. Explain the different high-level components (abstractions) in your App._**

Culturepop is built using Ruby on Rails, which follows the MVC (model, views and controller) configuration. 

The model is what queries the database we use and makes the data usable by Ruby. This is called Active Record within Ruby on Rails. 

The views we use within this application are what are viewed on the front end in the browser. These are embebbed ruby files which are htmls with an extension that allows ruby code to be used in the front end. 

The controllers we use within Ruby on Rails are used to direct the user to certain pages and functions within the applictaion. Eg when a user clicks on a link in a view that link is sent from browser to the controller which then points to a function. These functions or actions as they are called in rails often manipulate data in the database. They also can result in a different view.

**_10. Detail any third party services that your App will use._**

Third party applications sevice used:
- Hirb: mini view framework for the rails console that displays entries in a no-wrap table
- Devise: flexible authentication solution composed of several modules; allows for user authentication, registration and confirmation
- Amazon Simple Storage Service (Amazon S3): object storage service that offers industry-leading scalability, data availability, security, and performance. 
- Stripe: online payment processing for businesses, allowing users to pay for services within the app using a credit card.
- inline_svg: embed svg documents inside the rails view and style them with css
- Pundit: build a simple, robust and scaleable authorization system
- Ionicons: library for svg icons

**_11. Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb)._**

There are several existing marketplace apps that operate in a similar way to the app that we created. The most notable ones include:
- https://www.redbubble.com/
- https://www.etsy.com/au/
- https://society6.com/
- https://www.designbyhumans.com/

Although it is hard to know exactly how the databases behind these websites operate, it is reasonable to the assume that they are all quite similar and share many of the same intricacies in their model set ups and database relations.

Most of these sites have the same relationships between a user/profile, carts, wishlists, and products. Furthermore within these models there will be similar fields that cover all attributes of the model. However, one of the biggest focuses of these sites that sell items in variations, is the database set up for how the variants and different sizes/colors will be implemented.

Since a product has many variations it is fair to assume that there will be models in these sites that address this issue. There would certainly be structures in the database that handle all of the possible options for all products. Unlike our site which blankets all products under a product model, other web apps may have inidividual models for all categories of items, such as shoes, t-shirts, hats etc. This helps keep products categorised and seperate, allowing them to have fields that apply specific to those types of products.


**_12. Discuss the database relations to be implemented._**

For out project solution to be implemented properly, we had to carefully consider, as well as reconsider at some points, the database relations that we would have. 

We began with the user model that would relate to the role that the user has (as regular user or seller). A user would also have a 'has one' relationship with a profile. It was this profile model that we would use as a springboard to implement all our other relevant database relations. 

Having a profile meant that naturally the profile would have one wishlist, which would be able to access products that were added to it through a join table between the wishlist and product models. In addition, the profile would have many carts, some that were inactive but always having one that was active as part of that users current session. 

A product itself would have many variants to it as we needed to account for the different sizes and prices that each variant would have as part of the sellers stock. So this meant that a product would have many product variants to its name. This further meant that a profile would have access to products with their specific selected size (product variants) through a join tabled titled ProductsPurchased. This model would essentially keep track of which product variants belonged to which cart and would keep track of the quantity purchased. 

There were some further database relations that were implemented to categorise the products. A product would have one fandom and one category. Furthermore a product variant would have one size. 


**_13. Describe your project’s models in terms of the relationships (active record associations) they have with each other._**

In the current build of the project, there are a total of 12 models that are in use. The active record associations are as follows:

**Cart**
- belongs_to :profile
- has_many :products_purchaseds, dependent: :destroy
- has_many :product_variants, :through => :products_purchaseds

**Category**
- has_many :products

**Fandom**
- has_many :products
- has_one_attached :uploaded_image

**ProductVariant**
- belongs_to :product
- belongs_to :size
- belongs_to :color, optional: true
- has_many :products_purchaseds, dependent: :destroy
- has_many :carts, :through => :products_purchaseds

**Product**
- belongs_to :profile
- belongs_to :category
- belongs_to :fandom
- has_many :wishlist_products, dependent: :destroy
- has_many :wishlists, :through => :wishlist_products
- has_one_attached :uploaded_image
- has_many :product_variants, dependent: :destroy

**ProductsPurchased**
- belongs_to :cart
- belongs_to :product_variant

**Profile**
- belongs_to :user
- has_many :carts, dependent: :destroy
- has_many :products, dependent: :destroy
- has_one :wishlist, dependent: :destroy
- has_one_attached :avatar
- has_one_attached :cover_image

**Role**
- has_many :users

**User**
- belongs_to :role
- after_initialize :set_default_role, :if => :new_record?
- after_create :create_initial_profile
- has_one :profile, dependent: :destroy

**WishlistProduct**
- belongs_to :wishlist
- belongs_to :product

**Wishlist**
- belongs_to :profile
- has_many :wishlist_products
- has_many :products, through: :wishlist_products


**_14. Provide your database schema design._**

![alt text](app/assets/readme/ERD.jpeg "Database Schema Design")

**_15. Provide User stories for your App._**

*User*
- as a >fandom< hobbyist i would like to buy cool items related to >fandom< all in the one place because it makes shopping and searching easier and seamless
- as a (guest) user with no account i would like to view the products freely without restrictions so that i can still view products i might purchase
- as a user i want to be able to navigate the site by product and fandom categories as it allows me to find what im looking for specifically
- as a user with an account, i would like to add products to by wishlist so i can manage the items that i would like to purchase in the future
- as a user with an account, i would like to view the product im buying, and select the size i need with the correct price being displayed for that size
- as a user purchasing items i would like to be able to increase the quantity easily or remove items in my cart 
- as a user who has ordered with the site before, i would like to view my previous orders and what i purchased, including the time i made the order

*Seller*
- as a user with a basic profile, i would like to become a seller at the click of a link for ease of access
- as a seller i would like to add my own products to the store, including the product name and description, as well as select what category and fandom it falls under
- as a seller i would like to add different stock and sizes for the products that i have added to the store

 
**_16. Provide Wireframes for your App._**

(Refer to wireframes provided earlier in the document)

**_17. Describe the way tasks are allocated and tracked in your project._**

Although we sometimes used our own notes to keep track of sub tasks when working on our own product goals, we implemented the use of Trello in order to keep an overall track of the projects completion. 

After daily discussions with the group about how we wanted to approach the goals for the day, we split up the tasks that needed to be completed based on what everyone was comfortable with doing. However. there were some tasks that were completed as a group on one computer, as the shared input was beneficial in working through the problem and attaining the teams vision for that part of the app.

The specific tasks that the team needed to complete were kept track of in Trello using lists. These lists varied in name and were divided into 'in progress', 'to do', and 'completed'. We would note down certain functionality and products that the site needed to have in the 'to do' list, and then move that over to the 'in progress' list once someone had begun work on that task. These ability to move these sub-tasks to different completion status lists allowed us to visualise how our project was progressing overall. 

Additional lists that we had lon our trello board were 'readme', 'MVP' and 'stretch'. These lists werent inherently crucial to our task management but enabled us to see our project plan and what we wanted to achieve for our minimum viable product and what we wanted to knock off down the line as a stretch goal.


**_18. Discuss how Agile methodology is being implemented in your project._**

Agile methodology was implemented in several ways through the lifetime of the project. At the beginning of our days we would discuss what everyone was working on at the time, whether any help was needed from other group members with that task, and ultimately, what it was that we wanted to achieve for the day.

By having these discussions with the group we were able to gain  a grander picture of how our site was developing and how to better allocate our time to complete certain functionalities for the web app. In addition, in accordance to the agile methodology, we were also able to continuously view and interact with the product (app) that we were working on. Because we could so easily see the progress that we were making we were easily able to review the strengths and weakneses of the site as a team which allowed us to revise our plan when needed and review our current goals.


**_19. Provide an overview and description of your Source control process._**

The source control process that the group engaged in was done wholly through GitHub. Initially, at the beginning of the project, we created a dummy html file and ensured that the whole group was able to successfully pull the file from the master branch, edit it in their own local branch and then push it back up to the master branch on github. We then practiced creating a pull request and merging the existing changes. 

After we all got comfortable with the commands required to make this whole process transition seamlessly, we created a repository on one of our github accounts, which became the home for our project files.

In terms of the version control management for the project itself, our team would work on different parts of the project in branches created on our personal machines. These branches were aptly named after the part of the project we were contributing to. After we had completed a certain version of the project feature in these branches, we notified each other that were going to push the branch to the master. Most of the time the group was together when these pushes happened so we could easily create a pull request and then review and discuss the relevant changes with the merge process. 

After everyone had successfully merged their files with the master on github and therefore updated the project to the latest version, we would then pull the latest version back down to our local machine and check it out to another branch, before repeating the same process outlined above. By pushing to github and having various branches on our own machines we made sure that we always had a version that we could fall back to in case serious errors arose.

**_20. Provide an overview and description of your Testing process._**

The testing process to ensure that the app was working the way we intended was completed through manual 'run-throughs' instead of creating specific test cases in our code. 

These run-throughs were essentially tests where we used the site by adopting the average users point of view by considering their thoughts regarding the accessibility and functions of the site.

The functions that we wanted to prioritize in our testing were the ones that were essential to the integrity and overall completeness of the site. 

The first set of manual tests that we focused on were in relation to devise and profile creation. We wanted to make sure that a site user could:
- sign up for an account
- create a profile by filling in the relevant information
- sign in with an already existing profile 

We then proceeded to test the main functionality and purpose of our site. The two main goals of these tests were to check off if a user with an account and a profile could browse and purchase the items they wanted, as well as become an artist for the site and sell their own products. 

The specific site functions tested for a regular user were to: 
- browse the available fandoms on the home page and click on the desired fandom, which would display all products belonging to the fandom
- browse by the available categories through the navigation tabs so the user could access specific products such as a phone case
- search for products in the search bar 
- add a product to the wishlist
- select the desired product size and have the correct pricing appear on the products display page
- add the product to the cart and have a 'successfully added' render message
- update quantities on the cart page, and remove items
- pay with card and checkout

After the 'run-through' tests were completed for the normal user, we tested the functionality for a normal user to become an artist. This involved tests for: 
- clicking 'sell your products' to be directed to a payment page to become an artist
- adding their own products on the store for sale
- adding product variants (stock) in different sizes and having the stock display for the artist once they visit the product page
- removing items in stock

The ability for a user to complete the above actions further meant that the basic CRUD operations that were required for the relevant models and controllers were also in working order. In addition, the code for the third party payment system stripe was also working correctly.

Finally, we wanted to test the accessibility that users had to certain areas of the site depending on their role and whether they were signed up or not. In order to check if pundit was working we entered url's that the users didnt have access to so we could see if they were directed to a page which handled these attempts at acessing parts of the site they weren't allowed in. In addition, the users were restrited to only browse products on the site and were successfully prompted to sign up if they tried to add a product to the cart.


**_21. Discuss and analyse requirements related to information system security._**

**Information systems security** (INFOSEC) refer to the various processes and methodologies employed by a business to keep its precious information confidential, available and assured in its integrity. The key goal of these processes are to reduce the possiblity of malicious access by unauthorised parties and mitigate information risks.

These requirements for maintaining security, which are often abbreviated as the CIA triad, have their own specific focuses to ensure a balanced protection of the data.

**Confidentiality**, a key component of privacy, is the act of making information unavailable and undisclosable to those unauthorised individuals and other entities seeking to gain access to this information, but allowing authorised viewers to access the data in question. Data is commonly categorised by the severity it can cause in the case of a leak, with strict measures being placed appropriately depending on this categorisation. Instances of a comprimise of confidentiality include the theft of passwords or financial information. 

**Integrity** refers to maintaining an accuracy, completeness and trustworthiness of data throughout its entire life cycle. This means that data may not be modified by unauthorized users as well as erroneous changes and accidental deletion by users who are authorised. 

**Availability** of information is important so that ultimately a site can serve its intended purpose. The availability of the data and resources is ensured through proper maintenance and functioning of the systems used to store and process this data, including both the hardware and software components. 


**_22. Discuss methods you will use to protect information and data._**

There are many steps and measures that can be taken to ensure that the business's information is secure. One of the first measures to be taken is to employ security tools such as malware detection, vulnerability scanning and firewalls so that any malicious activity with the itention of breaching the site is detected and identified before being dealt with appropriately.

However, in the unfortunate event of a successful breach, it is absolutely vital that the businesses data and the customers information and records are still available through remote back ups. Thus, there should be an emphasis on regularly backing up data using multiple back-up methods. These can include backin-up the data to either a cloud storage service, or to a more tangible portable device. If a device is used it should be copied multiple times and placed in several separate locations with ease of access. The regularity of the back-ups will vary, and can occur on a daily, weekly, quarterly or yearly basis. 

Furthermore, the customers data should be encrypted by the site when handling sensitive information such as passwords, as to avoid interception by malicious third parties. The encryption for the authorisation process used in our web app is handled by devise, which itself relies on a gem named 'bcrypt' that manages the encryptions specifically. 



**_23. Research what your legal obligations are in relation to handling user data._**

Many businesses have the legal obligation of protecting and keeping their customers' personal information secure and private. Australian privacy laws, contained in the "Privacy Acts", are what entities must adhere to be responsible for regulating the collection, use and disclosure of personal information about their users and their data. 

The personal information of a user is anything that can personally identify them, and for the most part includes their name, addresses, contact information such as their phone number and email, photos, videos, authentication details for the site and most importantly their financial and payment information in the form of bank and credit card details.  

These businesses must be transparent in the way that they will handle and use the data that is collected. In order to achieve this transparency, sites must disclose the purpose for which the data will be used and limit the use of data for the outlined and intended purposes only.

In order to fully satisfy these legal obligations, businesses need to comply to the Australian Privacy Principles (APPs). The business entities have the onus of providing an up to date privacy policy which details how the users information will be managed. Furthermore, steps need to be taken so that the user's information is accurate and up to date, and accessible to the user upon request by the individual.
