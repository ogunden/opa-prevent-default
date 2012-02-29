static_form =
 <form id=#static options:onsubmit="prevent_default">
  <input type="text" name="foo" value="static"/>
  <button onclick={_ -> println("submit")}>submit</button>
 </form>

render_dynamic_form_a() =
  html =
   <form id=#dynamic_a options:onsubmit="prevent_default">
    <input type="text" name="foo" value="dynamic-a"/>
    <button onclick={_ -> println("submit-dyn-a")}>submit</button>
   </form>
  #dynamic_a_div <- html

submit() =
  do println("submit-dyn-b")
  render_dynamic_form_b()

render_dynamic_form_b() =
  html =
   <form id=#dynamic_b options:onsubmit="prevent_default">
    <input type="text" name="foo" value="dynamic-b"/>
    <button onclick={_ -> submit()}>submit</button>
   </form>
  #dynamic_b_div <- html

page() =
  <>
   {static_form}
   <div id=#dynamic_a_div/>
   <div id=#dynamic_b_div/>
   <a href="#" onclick={_ -> render_dynamic_form_a()}>render form a</a>
   <a href="#" onclick={_ -> render_dynamic_form_b()}>render form b</a>
  </>


server = Server.one_page_server("foo", page)
