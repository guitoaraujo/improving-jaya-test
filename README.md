This **rails** api application is a challenge code for [Jaya Tech](https://jaya.tech/). 
The main goal here is provide an api to track repositories issues using a **Github Webhook**.

### Requirements 
* Ruby 3.0.1
* Rails 6.1.4.1
* Ngrok

### Setup
> bundle

> rails db: create db:migrate

If you have any trouble here, please make that you have **Mysql** (or something like) properly installed in your computer. 

After that, you need to create a **.env** file in **root folder** as containing three informations as below:

```
GIT_SECRET=xxxxxx
LOGIN=xxxxxxx
PASSWORD=xxxxxxx
```

Keep in mind that you have to properly set up this informations before start to use this API.

If everything was done as expected, now you just need to start **rails** and **ngrok**. As you need to specify different ports for both, you can use this example below:

> rails s 

> ./ngrok http 4000

### Tests
For tests you can use the command below:
> rspec