#!/bin/bash

# Sales input
read -p "Enter Product 1: " product1
read -p "Enter Price: $" price1

read -p "Enter Product 2: " product2
read -p "Enter Price: $" price2

read -p "Enter Product 3: " product3
read -p "Enter Price: $" price3

echo

# Input mode of payment terms
read -p "Cash Discount: " cash_discount
echo  "Your input $cash_discount for Cash Discount: "
read -p "3 Months Installment: " installment3
echo "Your input $installment3 for 3 Months Installment: " 
read -p "6 Months Installment: " installment6
echo "Your input $installment6 for 6 Months Installment: "
read -p "12 Months Installment: " installment12
echo "Your input $installment12 for 12 Months Installment: "

echo

# Main menu
echo "Main Menu"
echo "Press (I): $product1 \$$price1"
echo "Press (S): $product2 \$$price2"
echo "Press (X): $product3 \$$price3"
read -p "Enter Item: " item

echo

case $item in
 "I")
name=$product1
price=$price1
;;

 "S")
name=$product2
price=$price2
;;

 "X")
name=$product3
price=$price3
;;
esac

#Print the Item & Price
echo "Your Item is: $name"
echo "Price: \$$price"

echo

# Select mode of payment
echo "Select Mode of Payment"
echo "Press 1: Cash 10% Discount ($cash_discount% Discount)"
echo "Press 2: 3 Months Installment ($installment3% Interest)"
echo "Press 3: 6 Months Installment ($installment6% Interest)"
echo "Press 4: 12 Months Installment ($installment12% Interest)"
read -p "Enter Mode of Payment: " payment

echo
    
# Calculate and print output
#If the User Picks Number 1
if [ "$payment" == "1" ]; then
  discount=$(echo "scale=2; $price * $cash_discount / 100" | bc)
  total=$(echo "scale=2; $price - $discount" | bc)
  echo "Mode of Payment: Cash Discount"
  echo "Item: $name"
  echo "Price: \$$price"
  echo "Discount/Interest: \$$discount"
  echo "Total Amount: \$$total"
  echo "Monthly: None"

#If the User Picks Number 2
elif [ "$payment" == "2" ]; then
  interest_pay=$installment3
  interest=$(echo "scale=2; $price * $interest_pay / 100" | bc)
  total=$(echo "scale=2; $price + $interest" | bc)
  monthly=$(echo "scale=2; $total / 3" | bc)
  echo "Mode of Payment: 3 Months Installment"
  echo "Item: $name"
  echo "Price: \$$price"
  echo "Discount/Interest: \$$interest"
  echo "Total Amount: \$$total"
  echo "Monthly: \$$monthly"
 
#If the User Picks Number 3
 elif [ "$payment" == "3" ]; then
  interest_pay=$installment6
  interest=$(echo "scale=2; $price * $interest_pay / 100" | bc)
  total=$(echo "scale=2; $price + $interest" | bc)
  monthly=$(echo "scale=2; $total / 6" | bc)
  echo "Mode of Payment: 6 Months Installment"
  echo "Item: $name"
  echo "Price: \$$price"
  echo "Discount/Interest: \$$interest"
  echo "Total Amount: \$$total"
  echo "Monthly: \$$monthly"

#If the User Picks Number 4
  elif [ "$payment" == "4" ]; then
  interest_pay=$installment12
  interest=$(echo "scale=2; $price * $interest_pay / 100" | bc)
  total=$(echo "scale=2; $price + $interest" | bc)
  monthly=$(echo "scale=2; $total / 12" | bc)
  echo "Mode of Payment: 12 Months Installment"
  echo "Item: $name"
  echo "Price: \$$price"
  echo "Discount/Interest: \$$interest"
  echo "Total Amount: \$$total"
  echo "Monthly: \$$monthly"
fi
