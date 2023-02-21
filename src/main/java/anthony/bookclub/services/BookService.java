package anthony.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import anthony.bookclub.models.Book;
import anthony.bookclub.repositories.BookRepository;


@Service
public class BookService {

  @Autowired BookRepository bookRepository;

  // add a book
  public void addBook(Book book){
    bookRepository.save(book);
  }

  // get all books
  public List<Book> getAll() {
    return bookRepository.findAll();
  }

  //get one book
  public Book getOneBook(Long id) {
    Optional<Book> optionalBook = bookRepository.findById(id);
    return optionalBook.orElse(null);
  }

  // update book
  public void updateBook(Book book) {
    bookRepository.save(book);
  }

  public void deleteBook(Long id) {
    bookRepository.deleteById(id);
  }
}
