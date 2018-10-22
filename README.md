# Description

Rails starter for a Restful API :

# Gems included
- Database: PosgreSQL
- Test framework: Rspec
- Fixture replacement: FactoryBot
- Json serialization: Fast json api
- Authentication : devise / devise-jwt
- Scaffolding : api scaffold gem
- Pagination : pagy / api-pagination

# Instructions

```
git clone this repository
```

delete the master.key at the root of the app and generate two secrets keys which we will add in our credentials.

```
rails credentials:edit
```
Add this in your credentials :
```
secret_key_base : secret key 1 
jwt_secret: secret key 2
```


```
rake db:create
rake db:migrate
rails s
```



See https://github.com/stefatkins/api_scaffold for scaffolding templates
