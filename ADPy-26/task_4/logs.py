import functools
from loguru import logger


def logger_wraps(*, entry=True, exit=True, level="DEBUG", logpath="logs"):

    def wrapper(func):
        name = func.__name__

        @functools.wraps(func)
        def wrapped(*args, **kwargs):
            logger_ = logger.opt(depth=1)
            logger_.remove()
            logger_.add(f"{logpath}/app.log", encoding="utf8")

            if entry:
                logger_.log(level, "Entering '{}' (args={}, kwargs={})", name, args, kwargs)
            result = func(*args, **kwargs)
            if exit:
                logger_.log(level, "Exiting '{}' (result={})", name, result)
            return result

        return wrapped

    return wrapper