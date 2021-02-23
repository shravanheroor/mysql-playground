-- Preventing Self-Follows

DELIMITER ##

CREATE TRIGGER insta_self_follow
AFTER INSERT ON follows FOR EACH ROW
    BEGIN
        IF NEW.followee_id = NEW.follower_id
            THEN 
                SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot Follow yourself';
        END IF;
    END;
##

DELIMITER ;

-- Logging Unfollows
DELIMITER $$

CREATE TRIGGER log_unfollows
AFTER DELETE ON follows FOR EACH ROW
    BEGIN
        -- Insert into a table
    END;
$$

DELIMITER ;