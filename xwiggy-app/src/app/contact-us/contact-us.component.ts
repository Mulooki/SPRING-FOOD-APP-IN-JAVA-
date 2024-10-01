import { Component, OnInit } from '@angular/core';
import { Router } from "@angular/router";
import { User } from "../app.component";
import { HttpClient } from "@angular/common/http";

@Component({
  selector: 'app-contact-us',
  templateUrl: './contact-us.component.html',
  styleUrls: ['./contact-us.component.css']
})
export class ContactUsComponent implements OnInit {

  // Initialize the modelUser object to hold user information
  modelUser: User = {
    username: '',
    password: '',
    email: '',
    phone: 0,
    firstname: '',
    lastname: '',
    address: '',
    merchant: null
  };

  // Initialize the modelMessage object for the contact form
  modelMessage: Contact = {
    name: '',
    email: '',
    message: ''
  };

  gif: boolean = false; // Loading gif flag

  constructor(private http: HttpClient, private router: Router) { }

  ngOnInit() {
    // Check if user data exists in sessionStorage, otherwise redirect to login
    const userDataStr = sessionStorage.getItem('userData');
    if (userDataStr === null) {
      this.router.navigate(["login"]);
    } else {
      try {
        // Retrieve user data from sessionStorage if it exists
        const userData = JSON.parse(userDataStr);
        if (userData) {
          Object.assign(this.modelUser, userData);
        }
      } catch (error) {
        console.error('Error parsing userData from sessionStorage', error);
        sessionStorage.clear();  // Clear sessionStorage in case of corrupted data
        this.router.navigate(["login"]);
      }
    }
  }

  // Function to handle sending the feedback
  sendFeedback() {
    this.gif = true; // Show loading gif

    // Populate contact message data from user information
    this.modelMessage.name = `${this.modelUser.firstname} ${this.modelUser.lastname}`;
    this.modelMessage.email = this.modelUser.email;

    const url = "http://localhost:8080/contact";
    
    // Send the contact message to the backend
    this.http.post<Contact>(url, this.modelMessage).subscribe(
      res => {
        // Stop loading and display success alert if the message is sent
        this.gif = false;
        alert("Message Sent Successfully");
      },
      err => {
        // Handle errors during the message sending process
        alert("An error has occurred while sending the message");
        this.gif = false;
      }
    );
  }

  // Clear sessionStorage on logout or reset
  clearLocal() {
    sessionStorage.clear();
  }

}

// Interface for contact message structure
export interface Contact {
  message: string;
  name: string;
  email: string;
}
