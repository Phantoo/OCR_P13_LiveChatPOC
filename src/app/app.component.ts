import { Component, ViewChild } from '@angular/core';
import { Router, RouterOutlet } from '@angular/router';
import { TalkjsChatComponent } from './components/talkjs-chat/talkjs-chat.component';

@Component({
    selector: 'app-root',
    standalone: true,
    imports: [RouterOutlet, TalkjsChatComponent],
    templateUrl: './app.component.html',
    styleUrl: './app.component.scss'
})
export class AppComponent 
{
    title = 'LiveChatPOC';

    @ViewChild(TalkjsChatComponent) chat!: TalkjsChatComponent;

    constructor(private router: Router) {}

    onToggleChanged(event: Event) 
    {
        const isChecked = (<HTMLInputElement>event.target).checked;
        this.chat.isHelper = isChecked;
        this.chat.refreshChatSession();
    }
}
