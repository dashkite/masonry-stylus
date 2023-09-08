import _stylus from "stylus"
import modularize from "@dashkite/masonry-export"

render = ({ root, source, input }) ->
  _stylus input
  .include source?.directory
  .include root
  .render()

stylus = [
  render
  modularize
]

export default stylus
export { stylus }
