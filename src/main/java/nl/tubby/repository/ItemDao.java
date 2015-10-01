package nl.tubby.repository;

import java.util.List;

import nl.tubby.model.Item;

public interface ItemDao {

    List<Item> findAll();

    Item saveAndFlush(Item item);

    void delete(Integer id);

}
