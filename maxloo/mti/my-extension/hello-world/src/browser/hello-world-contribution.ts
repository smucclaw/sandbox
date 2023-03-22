import { injectable, inject } from '@theia/core/shared/inversify';
import { Command, CommandContribution, CommandRegistry, MenuContribution, MenuModelRegistry, MessageService } from '@theia/core/lib/common';
import { CommonMenus } from '@theia/core/lib/browser';

export const HelloWorldCommand: Command = {
    id: 'HelloWorld.command',
    label: 'Say Hello'
};

@injectable()
export class HelloWorldCommandContribution implements CommandContribution {

    constructor(
        @inject(MessageService) private readonly messageService: MessageService | undefined,
    ) { }

    registerCommands(registry: CommandRegistry): void {
        registry.registerCommand(HelloWorldCommand, {
            execute: () => this.messageService.info('Hello World!')
        });
    }
}

@injectable()
export class HelloWorldMenuContribution implements MenuContribution {

    registerMenus(menus: MenuModelRegistry): void {
        menus.registerMenuAction(CommonMenus.EDIT_FIND, {
            commandId: HelloWorldCommand.id,
            label: HelloWorldCommand.label
        });
    }
}



