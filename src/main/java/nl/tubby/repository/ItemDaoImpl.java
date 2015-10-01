package nl.tubby.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import nl.tubby.model.Item;

@Repository
public class ItemDaoImpl implements ItemDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Item> findAll() {
        CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
        CriteriaQuery<Item> cq = cb.createQuery(Item.class);
        Root<Item> mask = cq.from(Item.class);
        cq.select(mask);
        TypedQuery<Item> query = getEntityManager().createQuery(cq);
        return query.getResultList();
    }

    @Override
    @Transactional
    public Item saveAndFlush(Item item) {
        this.entityManager.persist(item);
        return item;
    }

    @Override
    @Transactional
    public void delete(Integer id) {
        Item item = this.entityManager.find(Item.class, id);
        if (item != null) {
            this.entityManager.remove(item);
        }

    }

    public EntityManager getEntityManager() {
        return entityManager;
    }
}