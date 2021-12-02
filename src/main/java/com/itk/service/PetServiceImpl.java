package com.itk.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itk.dao.PetDAO;
import com.itk.entity.Pet;

@Service
public class PetServiceImpl implements PetService {
	
	// Inject pet dao
	@Autowired
	private PetDAO petDAO;
	
	@Override
	@Transactional
	public List<Pet> getPets() {
		return petDAO.getPets();
	}

	@Override
	@Transactional
	public void savePet(Pet pet) {
		petDAO.savePet(pet);
	}

	@Override
	@Transactional
	public Pet getPet(int id) {
		return petDAO.getPet(id);
	}

	@Override
	@Transactional
	public void deletePet(int id) {
		petDAO.deletePet(id);
	}
}
