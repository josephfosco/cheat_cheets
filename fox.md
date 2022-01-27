---
---

hey, for the record, assets were broken in qa fox for mobile.store.cox.com. in addition to pulling back the fox db back from production to qa (bottom of https://github.com/gdo-media-usa/phoenix/tree/main/docs/deployment_checklists), i had to run the following manually in a phoenix shell on the server:


```
site = Site.where(domain: "mobile.store.cox.com").first
cinval = Caching::Invalidation.new(nil)
pages = site.pages.active_for_change_set(nil)
pages.each { |page| cinval.invalidate_page(page) }
```
