use mlua::{Lua, Result, Table};

#[mlua::lua_module]
fn rume(lua: &Lua) -> Result<Table> {
    let exports = lua.create_table()?;

    // Define the 'greet' function
    let greet_fn = lua.create_function(|_, name: String| {
        println!("Hello, {}!", name);
        Ok(())
    })?;

    // Set the 'greet' function in the exports table
    exports.set("greet", greet_fn)?;

    Ok(exports)
}
