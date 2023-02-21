package anthony.bookclub.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import anthony.bookclub.models.LoginUser;
import anthony.bookclub.models.User;
import anthony.bookclub.repositories.UserRepository;

@Service
public class UserService {

  @Autowired
  private UserRepository userRepository;

  // TO-DO: Write register and login methods!
  public User register(User newUser, BindingResult result) {
    // TO-DO: Additional validations!
    Optional<User> user = userRepository.findByEmail(newUser.getEmail());
    // checks to see if a user already exists in the database by email
    if (user.isPresent()) {
      result.rejectValue("email", "Email", "Email already registered");
    }
    // does the new users password match the confirm password
    // if NOT, we want to give another error
    if (!newUser.getPassword().equals(newUser.getConfirm())) {
      result.rejectValue("confirm", "Confirm", "Passwords must match");
    }

    if (result.hasErrors()) {

      return null;
    }
    String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    newUser.setPassword(hashed);
    return userRepository.save(newUser);
  }

  public User login(LoginUser newLoginObject, BindingResult result) {
    // TO-DO: Additional validations!
    // check if the email exists in the database

    Optional<User> potentialUser = userRepository.findByEmail(newLoginObject.getEmail());

    if (!potentialUser.isPresent()) {
      result.rejectValue("email", "noEmail", "Invalid login");
      result.rejectValue("password", "wrongPassword", "Invalid login");
      return null;
    }
    User user = potentialUser.get();
    if (!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
      result.rejectValue("email", "noEmail", "Invalid login");
      result.rejectValue("password", "wrongPassword", "Invalid login");
      return null;
    }



    return user;
  }

}