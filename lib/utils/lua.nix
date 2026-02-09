_:

{
  callLua = path: builtins.readFile (../../lua + "/${path}.lua");
}
