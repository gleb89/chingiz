from pydantic import BaseModel

class UpdateRating(BaseModel):
    user_rating: int
    num_ratings :int