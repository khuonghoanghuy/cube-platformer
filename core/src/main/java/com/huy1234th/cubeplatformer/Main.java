package com.huy1234th.cubeplatformer;

import com.badlogic.gdx.ApplicationAdapter;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.utils.ScreenUtils;

/** {@link com.badlogic.gdx.ApplicationListener} implementation shared by all platforms. */
public class Main extends ApplicationAdapter {
    private Texture player;
    private SpriteBatch spriteBatch;
    
    @Override
    public void create() {
        player = new Texture("player.png");
        spriteBatch = new SpriteBatch();
    }

    @Override
    public void render() {
        draw();
    }

    private void draw() {
        ScreenUtils.clear(Color.BLACK);

        // begin the sprite draw
        spriteBatch.begin();

        spriteBatch.draw(player, 1, 1);

        // after that, end the sprite draw
        spriteBatch.end();
    }

    @Override
    public void dispose() {
        player.dispose();
    }
}
