app_servers={
  frontend={
    name="frontend"
    instance_type="t3.micro"
    script_name="1FrontendSetup"
  }
  user={
    name="user"
    instance_type="t3.micro"
    script_name="5UserSetup"
  }

  catalogue={
    name="catalogue"
    instance_type="t3.micro"
    script_name="3CatalogueSetup"
  }
  cart={
    name="cart"
    instance_type="t3.micro"
    script_name="6CartSetup"
  }
  payment={
    name="payment"
    instance_type="t3.micro"
    script_name="10PaymentSetup"
  }
  shipping={
    name="shipping"
    instance_type="t3.micro"
    script_name="8ShippingSetup"
  }
  dispatch={
    name="dispatch"
    instance_type="t3.micro"
    script_name="11DispatchSetup"
  }
}
database_servers={
  mongodb={
    name="mongodb"
    instance_type="t3.micro"
    script_name="2MongoDBSetup"
  }
  rabbitmq={
    name="rabbitmq"
    instance_type="t3.micro"
    script_name="9RabbitMQSetup"
  }
  mysql={
    name="mysql"
    instance_type="t3.micro"
    script_name="7MySqlSetup"
  }
  redis={
    name="redis"
    instance_type="t3.micro"
    script_name="4RedisSetup"
  }
}