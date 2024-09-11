from transformers import pipeline

from transformers import logging
logging.set_verbosity_error() # suppress warning message


sentiment_pipeline = pipeline("sentiment-analysis")
data = ["you suck", "I hate you", "I sent you an email",
        "You killed my father", "Prepare to die"]

result = sentiment_pipeline(data)

for s, sentiment in zip(data, result):
    print(s, sentiment)
