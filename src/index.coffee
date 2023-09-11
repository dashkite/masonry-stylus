import _stylus from "stylus"
import text from "@dashkite/masonry-text"

render = ({ root, source, input }) ->
  _stylus input
  .include source?.directory
  .include root
  .render()

Presets =
  
  css: render

  js: ( context ) ->
    css = render context
    text { context..., input: css }

stylus = ( context ) ->
  if ( preset = Presets[ context.build.preset ])?
    await preset context
  else
    throw new Error "unknown Stylus preset
      #{ context.build.preset }"

export default stylus
export { stylus }
