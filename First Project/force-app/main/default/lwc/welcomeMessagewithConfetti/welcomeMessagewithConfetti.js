import { LightningElement } from 'lwc';
import { loadStyle } from 'lightning/platformResourceLoader';
import confettiCSS from '@salesforce/resourceUrl/confettiCSS';

export default class WelcomeMessage extends LightningElement {
    connectedCallback() {
        this.loadConfettiCSS();
        this.displayWelcomeMessage();
    }

    loadConfettiCSS() {
        loadStyle(this, confettiCSS);
    }

    displayWelcomeMessage() {
        const welcomeMessage = `Welcome to our Experience Cloud site!`;
        const confettiContainer = this.template.querySelector('[data-id="confetti-container"]');
        
        if (confettiContainer) {
            const confetti = document.createElement('div');
            confetti.classList.add('confetti');
            confettiContainer.appendChild(confetti);
        
            const colors = ['#2980b9', '#3498db', '#5eb6dd', '#9cd3e6', '#c5e1eb'];
        
            for (let i = 0; i < 100; i++) {
                const square = document.createElement('div');
                square.classList.add('square');
                square.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                confetti.appendChild(square);
            }
        
            const welcomeMessageElement = document.createElement('div');
            welcomeMessageElement.classList.add('welcome-message');
            welcomeMessageElement.appendChild(document.createTextNode(welcomeMessage));
            confettiContainer.appendChild(welcomeMessageElement);
        }
    }
    
    }
