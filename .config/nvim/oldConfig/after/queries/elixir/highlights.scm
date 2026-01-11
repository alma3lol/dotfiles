; extends
 (
  [
   (identifier)
   (keyword)
   (keyword)
   ] @cond (#match? @cond "(if|do: |else: )")
  )

(
 (identifier) @indexToInsert (#eq? @indexToInsert "indexToInsert")
 )
