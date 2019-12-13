CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mydwh.animal_with_stripes (animal_name,stripe_one,stripe_two) AS
SELECT
    animal_name,
    (
    SELECT stripe_color FROM (
        SELECT stripe_color,
            rank() over (partition by ANIMAL_ID order by animal_stripe_id) stripe_rank
        FROM animal_stripe
        where animal.ANIMAL_ID = ANIMAL_STRIPE.ANIMAL_ID
        )
    where stripe_rank = 1
    ) stripe_one,
    (
    SELECT stripe_color FROM (
        SELECT stripe_color,
            rank() over (partition by ANIMAL_ID order by animal_stripe_id) stripe_rank
        FROM animal_stripe
        where animal.ANIMAL_ID = ANIMAL_STRIPE.ANIMAL_ID
        )
    where stripe_rank = 2
    ) stripe_two
FROM animal;