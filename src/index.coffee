import Path from "node:path"
import _stylus from "stylus"
import text from "@dashkite/masonry-text"

render = ({ root, build, source, input }) ->
  root = build.root ? root
  _stylus input
    .set "filename", source.path
    .include Path.join root, source.directory
    .include root
    .render()

Presets =
  
  css: render

  js: ( context ) ->
    css = render context
    text { context..., input: css }

stylus = ( context ) ->
  preset = Presets[ context.build.preset ] ? Presets.css
  preset context

export default stylus
export { stylus }
