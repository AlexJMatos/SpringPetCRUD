package com.itk.service;

import java.util.List;

import com.itk.entity.Pet;

public interface PetService {
	public List<Pet> getPets();

	public void savePet(Pet pet);

	public Pet getPet(int id);

	public void deletePet(int id);
}
