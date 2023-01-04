package tech.codingclub.helix.entity;

public class Follower {

    public long user_id;
    public long following_id;

    public Follower() {
    }

    public Follower(long user_id, long following_id) {
        this.user_id = user_id;
        this.following_id = following_id;
    }
}
