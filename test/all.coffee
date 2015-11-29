Yadda = require('yadda')
Yadda.plugins.mocha.StepLevelPlugin.init()
new (Yadda.FeatureFileSearch)('./test/features').each (file) ->
  featureFile file, (feature) ->
    library = require('./steps/main')
    yadda = Yadda.createInstance(library)
    scenarios feature.scenarios, (scenario) ->
      steps scenario.steps, (step, done) ->
        yadda.run step, done
