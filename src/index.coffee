import _stylus from "stylus"
import modularize from "@dashkite/masonry-modularize"

stylus = modularize ({ root, source, input }) ->
  _stylus input
  .include source?.directory
  .include root
  .render()

export default stylus
export { stylus }
