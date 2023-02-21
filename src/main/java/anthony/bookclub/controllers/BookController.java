package anthony.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import anthony.bookclub.models.Book;
import anthony.bookclub.services.BookService;

@Controller
public class BookController {

  @Autowired
  BookService bookService;

  // show all books
  @GetMapping("/books")
  public String books(Model model, HttpSession session) {

    if(session.getAttribute("userID") == null) {
      return "redirect:/";
    }
    model.addAttribute("books", bookService.getAll());
    return "/books/index.jsp";
  }

  // ***** create a new book *****
  @GetMapping("/books/new")
  public String addBook(@ModelAttribute("book") Book book, HttpSession session) {
    if(session.getAttribute("userID") == null) {
      return "redirect:/";
    }
    return "/books/new.jsp";
  }

  @PostMapping("/books")
  public String newBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {

    if (result.hasErrors()) {
      return "/books/new.jsp";
    } else {

      bookService.addBook(book);
    }
    return "redirect:/books";
  }

  // ***** get one book by id *****
  @GetMapping("/books/{id}")
  public String oneBook(@PathVariable("id") Long id, Model model, HttpSession session) {
    if(session.getAttribute("userID") == null) {
      return "redirect:/";
    }
    Book book = bookService.getOneBook(id);
    model.addAttribute("book", book);

    return "/books/onebook.jsp";
  }

  // ***** edit a book by id*****
  @GetMapping("/books/{id}/edit")
  public String editBook(@PathVariable("id") Long id, Model model, HttpSession session) {
    if(session.getAttribute("userID") == null) {
      return "redirect:/";
    }
    Book book = bookService.getOneBook(id);
    model.addAttribute("book", book);
    return "/books/edit.jsp";
  }

  @PutMapping("/books/{id}/update")
  public String updateBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
    if (result.hasErrors()) {
      return "/books//edit.jsp";
    } else {

      bookService.updateBook(book);
    }
    return "redirect:/books";
  }

  // ****** delete a book *****
  @DeleteMapping("/books/{id}/delete")
  public String deleteBook(@PathVariable("id") Long id) {
    bookService.deleteBook(id);

    return "redirect:/books";
  }
}
