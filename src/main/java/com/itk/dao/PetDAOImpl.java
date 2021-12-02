package com.itk.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itk.entity.Pet;

@Repository
public class PetDAOImpl implements PetDAO {

	// Inject the hibernate session factory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Pet> getPets() {
		// Get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// Create a query
		Query<Pet> theQuery = currentSession.createQuery("from Pet order by petName", Pet.class);

		// Execute query and get result list
		List<Pet> pets = theQuery.getResultList();

		// Return the results
		return pets;
	}

	@Override
	public void savePet(Pet pet) {
		// Get hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// Save the pet
		currentSession.saveOrUpdate(pet);
	}

	@Override
	public Pet getPet(int id) {
		// Get hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// Get the pet
		return currentSession.get(Pet.class, id);
	}

	@Override
	public void deletePet(int id) {
		// Get hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// Delete the pet
		@SuppressWarnings("rawtypes")
		Query query = currentSession.createQuery("DELETE FROM Pet WHERE id=:id");
		query.setParameter("id", id);
		query.executeUpdate();
	}
}
