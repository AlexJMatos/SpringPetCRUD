package com.itk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itk.entity.Pet;
import com.itk.service.PetService;

@Controller
public class PetsController {
	private final String[] types = new String[] { "DOG", "CAT", "BIRD", "OTHER" };

	// Inject the Pet service
	@Autowired
	private PetService petService;

	@GetMapping("/list")
	public String listPets(Model model) {
		// Get the pets from the dao
		List<Pet> pets = petService.getPets();

		// Add the pets to the model
		model.addAttribute("pets", pets);

		return "list-pets";
	}

	@GetMapping("/add")
	public String addPetForm(Model model) {
		// Create model to bind form data
		Pet pet = new Pet();

		model.addAttribute("pet", pet);
		model.addAttribute("types", types);

		return "pet-form";
	}

	@PostMapping("/save")
	public String savePet(@ModelAttribute("pet") Pet pet) {

		// Save the pet using the service
		petService.savePet(pet);

		return "redirect:/list";
	}

	@GetMapping("/update")
	public String updatePetForm(@RequestParam("petId") int id, Model model) {
		// get the pet from the database
		Pet pet = petService.getPet(id);
		
		// set the pet as a model attribute to pre-populate the form
		model.addAttribute("pet", pet);
		model.addAttribute("types", types);
		
		// send the pet to the form
		return "pet-form";
		
	}
	
	@GetMapping("/delete")
	public String deletePet(@RequestParam("petId") int id) {
		// delete the pet
		petService.deletePet(id);
		
		return "redirect:/list"; 
	}
}