import { DevproPage } from './app.po';

describe('devpro App', () => {
  let page: DevproPage;

  beforeEach(() => {
    page = new DevproPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
