#### Let's make a deal   Simulator
#

N = 10000
n = 3      # number of doors
doors = LETTERS[1:n]
prize = sample(doors, replace=TRUE, N)   # laptop is behind door ...
guess = sample(doors, replace=TRUE, N)   # contestant guess
eq = as.numeric(prize==guess)
cat('Success proportion without changing the door\n')
print(sum(eq)/N)					   # success proportion, at first look (you don't change)

# imagine you do change...
guess2 = array(NA, dim=N)
for (i in 1:N) {
   if (guess[i]==prize[i])  {            # host can offer n-1 empty doors, and opens one at random.
                                                # You fail always, because you leave the right one.
      hostchoice = sample(setdiff(doors,prize[i]), 1)
      guess2[i] = sample(setdiff(doors,union(guess[i], hostchoice)), 1)
   } else {
                                        # host can offer n-2 empty doors, and opens one at random.
      empties = setdiff(doors, prize[i])
      hostchoice = sample(setdiff(empties,guess[i]), 1)
      guess2[i] = sample(setdiff(doors,union(guess[i], hostchoice)), 1) # sometimes you can succeed
   }                                                              # if n=3, you succeed always
}
eq = as.numeric(prize==guess2)
cat('Success proportion changing the door\n')
print(sum(eq)/N)

