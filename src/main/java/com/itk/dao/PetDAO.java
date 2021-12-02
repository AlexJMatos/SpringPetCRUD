package com.itk.dao;

import java.util.List;

import com.itk.entity.Pet;

public interface PetDAO {
	public List<Pet> getPets();

	public void savePet(Pet pet);

	public Pet getPet(int id);

	public void deletePet(int id);
}
