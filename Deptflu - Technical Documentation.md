> Guide to use [deptflu](https://github.com/rahardien/deptflu) package to generate boilerplate code for upcoming Flutter projects


## Background
### Boilerplate 101
Boilerplate code refers to sections of code that are repetitive and standardized, often required to set up or implement certain functionalities in programming. This code doesn't typically change much between different projects but is necessary for the application to run properly. Examples include:
- Config files
- Initialization code for frameworks
- Basic structure for classes or functions
Boilerplate code ensure consistency dan reduce repetitive work developers have to do. Although it can also lead to increased file size (if not managed properly), it helps developers to code more faster, since developers doesn't have to write the nitty-gritty code all by themselves.
### Why do we need Boilerplate?
1. **Standardization**: It provides a consistent structure across different projects, making it easier for developers to understand and collaborate on code.
2. **Efficiency**: By using boilerplate code, developers can save time on repetitive tasks, allowing them to focus on the unique aspects of their application.
3. **Framework Integration**: Many frameworks require specific setups or configurations to function properly, and boilerplate code ensures that these requirements are met.
4. **Best Practices**: Boilerplate often embodies established best practices and design patterns, helping developers write more maintainable and scalable code.
5. **Readability**: It can enhance code readability by providing a clear framework and organization, making it easier for new team members to onboard.
6. **Error Reduction**: By using tried-and-tested code snippets, the likelihood of introducing errors decreases, especially in common tasks.
## Our Situation
After examining project `Tara Cash` for several weeks, it is clear that the project structured based on Clean Architecture pattern by Uncle Bob. This approach separate the app and its features into 3 main layers, which have different responsibilities.
1. Data
	Handle direct interaction with external or 3rd party service, such as REST API, Database, WebSocket, Push Notification, Map Service, and many more.
2. Domain
	Holds the business logic of the app; how we provide relevant data to user, how we save user profile, how we manage user's session, etc.
3. Presentation
	Manage code that builds up UI components and screen, handling form, managing app's state, etc.
### Do we have Boilerplate?
> No, not exactly. 

First of all, `Tara Cash`  project as far as we know is our home-grown product, which means we're building it by ourself. We decide what state management we gonna use, which routing package we gonna choose, and how we structure the project. It doesn't have certain limitations or requirements like project from our client, we have freedom on how we build this product. 

While you look on `tara-mobile`, you could find local folder called `featureboilerplate`. This folder contain several folders to structure singe feature in Clean Architecture manner.
Apparently, if you want to generate those folders, you have to run one of these script (`.bat` for Windows system, and `sh` for UNIX system) from terminal.
After you run the script, you will get new folder representing the feature you want to make, with 3 folders and module class inside. But after further inspection, you will see that altho you already have the folder, you have nothing inside it. No `data_source`, `repository`, or even `model` class to start building your feature.
![[Pasted image 20241031160701.png]]

You have to write your own classes or copy classes from other feature, then rename it; which is so tiring. 

So at the end, we don't really have boilerplate for `tara-cash`. And since we know that `tara-cash` is our home-grown product, we can assume that we don't really have any boilerplate yet `core` template to create new Flutter project.
### Do we need it?
After examining `tara-cash` project as study case, we can conclude that:
1. We don't have any boilerplate code to build new app in Flutter
2. Even tho we have generator for single feature structure, we only generate the folder, not including necessary class such as `data_source`, `repository`, or `model`. We have to manually create it, or copy-paste other feature's class then rename it. (Which obviously tiring)
3. In further context, we currently don't have core template to creating new Flutter project, complete with it's required dependencies and pattern. We still need to write all-over from scratch, which quite cumbersome and time-consuming
4. We don't really enforce our code-style guidelines in this project (event tho we already have it). We're expecting the boilerplate will help developer to understand the standardize way to writing code.
Considering insights found from `tara-cash`, we need to create our own boilerplate code or template to maintain code consistency, define code-style guideline, reduce time-consuming and repetitive task, and keep the developers happy :) 
There are some points we need to consider when building our own boilerplate code or template, to improve our development experience:
1. We need core template to have necessary dependencies and configuration that ready out-of-the-box, so we could jump straight-ahead into building features
2. We need core template that provide options for important package, such as routing, api service, immutability, and many more
3. We need boilerplate template to create new feature, complete with files or classes such as `data_source`, `repository`, `model`, etc.
4. We need boilerplate template to create new state management implementation, that will integrated within specific feature (for now, limit the state management option to only bloc)
5. We need boilerplate to create new model, complete with it's `entity` or `dto` class, that also will integrated within specific feature
## Proposed Solution
After exploring some time, we finally found a package that meets our requirement to building our own boilerplate code, called [mason](https://github.com/felangel/mason/tree/master/packages/mason). 
### Mason
> A template generator which helps teams generate files quickly and consistently.

Mason is capable to:
1. Generate pre-defined code
2. Receive user input with interactive terminal
3. Receive user input in various data types
4. Format user input with with [built-in lambdas](https://docs.brickhub.dev/brick-syntax#built-in-lambdas)
5. Run code right before and after template generation, using hooks or callback
#### Mustache Template
Mason utilize [mustache](https://mustache.github.io/), a logic-less templating system that support many languages. It can be used for HTML, config files, source code or anything. It works by expanding tags in a template using values provided in a hash or object. We would see many `{{}}` tags, because that's how we'd structured our template.
Event tho logic-less, it still have some "logic" with tag `{{}}`, such as:
1. Variable
2. Conditionals (if-else)
3. Loops
4. Lambdas function
5. Partials
### Mason CLI
Mason also provide CLI tools to create and consume reusable templates called [[#Bricks]]. Mason CLI provide interactive way to generate template with Mason, providing useful information and generating progress.
#### Installation
```shell
# 🎯 Activate from https://pub.dev
dart pub global activate mason_cli

# 🍺 Or install from https://brew.sh (MacOS only)
brew tap felangel/mason
brew install mason
```
#### Initialization
```shell
mason init
```
This command will generate `mason.yaml` in current directory.  
```yaml
# Register bricks which can be consumed via the Mason CLI.
# Run "mason get" to install all registered bricks.
# To learn more, visit https://docs.brickhub.dev.
bricks:
  # Bricks can be imported via version constraint from a registry.
  # Uncomment the following line to import the "hello" brick from BrickHub.
  # hello: 0.1.0+1
  # Bricks can also be imported via remote git url.
  # Uncomment the following lines to import the "widget" brick from git.
  # widget:
  #   git:
  #     url: https://github.com/felangel/mason.git
  #     path: bricks/widget
```
### Bricks
Bricks is a reusable-template that can be generated through `mason_cli`. Bricks, as it is called, is a 'brick' that compile our app. We could have  as many bricks as we want, just defined it inside `mason.yaml`. In this very brick, we should write our boilerplate template with necessary code.
#### Installing Bricks
We can install bricks by adding these code inside`mason.yaml`.
- Remote Brick hosted on Github
```yaml
bricks:
   widget:
     git:
       # (URL to your brick hosted in Git repository) 
       url: https://github.com/felangel/mason.git 
       # (Path to brick inside Git repository)
       path: bricks/widget 
```
- Local Brick hosted on Local Machine
```yaml
bricks:
   widget:
     path: bricks/widget
```
Then, we can use the `get` command to install all bricks defined in the nearest parent `mason.yaml`.
```shell
mason get
```
#### Using Bricks
To generate template code using brick, run this command
```shell
mason make widget
```
You'll be prompted with required input. You can also use config file to fill out that prompt. For example create a file named `brick-input.json`
```json
{
	"feature": "profile",
}
```
Now we can run this command to generate code with predefined input inside `brick-input.json`
```shell
mason make widget -c brick-input.json
```
By default `mason make` will generate the output in the current working directory but a custom output directory can be specified via the `-o` option:
```shell
mason make widget -c brick-input.json -o ./template
```
#### Creating Bricks
The `mason new` command allows us to create a new, custom brick template in the current working directory:
```shell
mason new example
```
After running those command, we should see these generated code and folder
```
├── CHANGELOG.md
├── LICENSE
├── README.md
├── __brick__
└── brick.yaml
```
### Hooks 🪝
Custom script execution before and after code generation process
- `pre_gen` - executed immediately before the generation step
	You can use `pre_gen` hook to mostly manipulate variables and input from user
- `post_gen` - executed immediately after the generation step
	While you can use `post_gen` to run certain command after generation completed, such as:
	`dart pub get` or `dart run build_runner build`
## [deptflu](https://github.com/rahardien/deptflu)
> List of bricks to build Boilerplate code for Deptech's Flutter projects

`deptflu` is a set of bricks that can be used to create new Flutter project, or generate boring-repetitive process while building features, with Deptech's architecture and configuration

| Brick name                                                                             | Version | Description                                                   |
| -------------------------------------------------------------------------------------- | ------- | ------------------------------------------------------------- |
| [deptflu_core](https://github.com/rahardien/deptflu/tree/master/bricks/deptflu_core)   | 1.2.0   | Core Flutter template with necessary dependencies and config  |
| [deptflu_feat](https://github.com/rahardien/deptflu/tree/master/bricks/deptflu_feat)   | 0.2.2   | Generate feature's boilerplate code                           |
| [deptflu_model](https://github.com/rahardien/deptflu/tree/master/bricks/deptflu_model) | 0.2.1   | Generate model and entity boilerplate code                    |
| [deptflu_bloc](https://github.com/rahardien/deptflu/tree/master/bricks/deptflu_bloc)   | 0.4.5   | Generate BLoC/Cubit boilerplate code (event & state included) |
## Benefits
- Reduce development time by 30% on initial development
- Speed up development process, every major step to build a feature can be generated instantly
- Impose standard guidelines and rules to achieve readability and maintainability
### [depflu_core](https://github.com/rahardien/deptflu/tree/master/bricks/deptflu_core)
> Core Flutter template with necessary dependencies and config
#### Installation
```bash
mason add deptflu_core -g --git-url https://github.com/rahardien/deptflu --git-path bricks/deptflu_core
```
#### Usage
Run this command to create new Flutter project, complete with necessary config and dependencies
```bash
mason make deptflu_core
```
This command will prompt you to fill out app's name, organization id, state management, immutable package, routing, etc. After that, you'll see generated code in your project, with structure as below:
```
├── common
	├── data
		├── datasources
		├── models
		└── repositories
	├── domain
		├── entities
		└── repositories
	└── presentation
		├── bloc
		└── pages
├── cores
	├── constants
	├── errors
		├── exceptions
		├── app_failure.dart
		└── error_object.dart
	├── models
		├── requests
			├── base_pagination_request.dart
			└── base_request.dart
		├── base_list_response.dart
		├── base_response.dart
		├── base_status.dart
		├── list_model.dart
		└── pagination.dart
	├── routes
		├── app_navigation.dart
		├── navigation_interface.dart
		├── router_interface.dart
		└── routes.dart
	├── services
		├── api
			├── api_dio.dart
			├── api_log_interceptor.dart
			├── api_service.dart
			└── response_helper.dart
		├── logger_service.dart
		├── secure_storage_service.dart
		└── shared_pref_service.dart
	├── ui
		├── app_colors.dart
		└── app_theme.dart
	├── utils
		├── extensions
		├── input_types
		├── form_validation_utils.dart
		├── map_utils.dart
		└── text_utils.dart
	├── initializer.dart
	└── injection.dart
├── features
├── localization
	└── language
		├── app_en.arb
		└── app_id.arb
├── app.dart
├── environment.dart
├── main.dart
├── main_prod.dart
└── main_staging.dart
```
- `/common`
	Used for shared features or functionality across the app. The folder structure is similar to `/features`
	- `/data`
		Store all external connection related code, such as database connection, REST API call, and other external 3rd party provider integration
		- `/datasources`
			Classes to connect with external services, such as database, REST API, and other 3rd party provider
		- `/models`
			Classes to define response data from external services
		- `/repositories`
			Classes to implement repository contract from `/domain` folder
	- `/domain`
		- `/entities`
			Define response data that  mapped from `/models`, to accomodate app's requirements
		- `/repositories`
			Define the repository contract
	- `/presentation`
		- `/bloc`
			Store BLoC classes
		- `/pages`
			Store pages
- `/cores`
	Store core functionality, routing system, theme definition, and utils
	- `/constants`
		Store constants definition
	- `/errors`
		Store errors object and exceptions
	- `/models` 
		Store base response model for REST API responses
	- `/routes`
		Store routing config and definition
	- `/services`
		Store core services, such as REST API service, logger service, storage service, and shared_pref service
	- `/ui`
		Store theme and colors definition
	- `/utils`
		Store utility functions and extensions functions
	-  initializer.dart
		Initialize all config
	- injection.dart
		Inject all dependencies
- `/features`
	Store all features into individual folder
- `/localization/language`
	Store localization content. By default generate contents in two language (English and Indonesian)
- `app.dart`
	Main app, where configs initialized
- `environment.dart`
	Env config for different environment or build type (Production or Staging)
- `main.dart`
	Main class to run app
- `main_staging.dart`
	Run app with `staging` environment and config
- `main_prod.dart`
	Run app with `production` environment and config
### [depflu_feat](https://github.com/rahardien/deptflu/tree/master/bricks/deptflu_feat)
> Generate feature's boilerplate, complete with data, domain, and presentation layer
#### Installation
Add brick in your `mason.yaml` file
```bash
# Register bricks which can be consumed via the Mason CLI.
# Run "mason get" to install all registered bricks.
# To learn more, visit https://docs.brickhub.dev.
bricks:
  # Bricks can be imported via version constraint from a registry.
  # Uncomment the following line to import the "hello" brick from BrickHub.
  # hello: 0.1.0+1
  # Bricks can also be imported via remote git url.
  deptflu_feat:
    git:
      url: https://github.com/rahardien/deptflu.git
      path: bricks/deptflu_feat
```
Then run `mason get` to download brick from repository
#### Usage
Run this command to create new Flutter project, complete with necessary config and dependencies
```bash
mason make deptflu_feat
```
After that, you'll see generated code in your project, with structure as below:
```
├── data
	├── datasources
		├── {feature_name}_local_data_source.dart
		└── {feature_name}_remote_data_source.dart
	└── repositories
		└── {feature_name}_repository_impl.dart
├── domain
	├── usecases
		└── {feature_name}_uc.dart
	└── repositories
		└── {feature_name}_repository.dart
├── presentation
	└── pages
		└── {feature_name}_page.dart
└── {feature_name}_module.dart
```
- `/data`
	Store all external connection related code, such as database connection, REST API call, and other external 3rd party provider integration
	- `/datasources`
		Classes to connect with external services, such as database, REST API, and other 3rd party provider
	- `/repositories`
		Classes to implement repository contract from `/domain` folder
- `/domain`
	- `/usecases`
		Define use cases for interacting with repository
	- `/repositories`
		Define the repository contract
- `/presentation`
	- `/pages`
		Store feature's pages
### [deptflu_model](https://github.com/rahardien/deptflu/tree/master/bricks/deptflu_model)
> Generate model and entity boilerplate class
#### Installation
Add brick in your `mason.yaml` file
```bash
# Register bricks which can be consumed via the Mason CLI.
# Run "mason get" to install all registered bricks.
# To learn more, visit https://docs.brickhub.dev.
bricks:
  # Bricks can be imported via version constraint from a registry.
  # Uncomment the following line to import the "hello" brick from BrickHub.
  # hello: 0.1.0+1
  # Bricks can also be imported via remote git url.
  deptflu_feat:
    git:
      url: https://github.com/rahardien/deptflu.git
      path: bricks/deptflu_model
```
Then run this command to download brick from repository
```bash
mason get
```
#### Usage
Run this command to create new Flutter project, complete with necessary config and dependencies
```bash
mason make deptflu_model
```
After that, you'll see generated code in your project, with structure as below:
```
└── {feature_name}
	├── data
		└── models
			└── {model_name}_model.dart
	└── domain
		└── entities
			└── {model_name}_entity.dart
```
- `/data`
	Store all external connection related code, such as database connection, REST API call, and other external 3rd party provider integration
	- `/models`
		Classes to define response data from external services
- `/domain`
	- `/entities`
		Define response data that  mapped from `/models`, to accomodate app's requirements
### [deptflu_bloc](https://github.com/rahardien/deptflu/tree/master/bricks/deptflu_bloc)
> Generate BLoC/Cubit boilerplate (event & state included) for Deptech Fluter projects
#### Installation
Add brick in your `mason.yaml` file
```bash
# Register bricks which can be consumed via the Mason CLI.
# Run "mason get" to install all registered bricks.
# To learn more, visit https://docs.brickhub.dev.
bricks:
  # Bricks can be imported via version constraint from a registry.
  # Uncomment the following line to import the "hello" brick from BrickHub.
  # hello: 0.1.0+1
  # Bricks can also be imported via remote git url.
  deptflu_feat:
    git:
      url: https://github.com/rahardien/deptflu.git
      path: bricks/deptflu_bloc
```
Then run this command to download brick from repository
```bash
mason get
```
#### Usage
Run this command to create new Flutter project, complete with necessary config and dependencies
```bash
mason make deptflu_bloc
```
After that, you'll see generated code in your project, with structure as below:
```
└── {feature_name}
	└── presentation
		└── {bloc/cubit} (Depends on your choice)
			├── validation (Optional -- If you opt in generate validation)
				├── {bloc_name}_validation_state.dart
				└── {bloc_name}_validation_cubit.dart
			├── {bloc_name}_event.dart
			├── {bloc_name}_state.dart
			└── {bloc_name}_{bloc/cubit}.dart
```
- `/bloc` or `/cubit`
	Store bloc or cubit class to manage state
	 - `/validation`
		Store cubit class to manage state related to validation functionality (Usually form)
	- `{bloc_name}_event.dart`
		Events for the state management
	- `{bloc_name}_state.dart`
		States for the state management
	- `{bloc_name}_{bloc/cubit}.dart`
		Bloc/Cubit class that manage states and events
## Further Improvements
- Adding other state management implementation, such as `Riverpod`.
## References
- [https://docs.brickhub.dev/](https://docs.brickhub.dev/)
- https://mustache.github.io/mustache.1.html
- https://github.com/rahardien/deptflu

> Developed by: [homindolentrahar](https://github.com/homindolentrahar)