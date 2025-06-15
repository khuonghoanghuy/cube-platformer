package com.huy1234th.cubeplatformer;

import com.badlogic.gdx.Input;
import com.badlogic.gdx.ApplicationAdapter;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.Sprite;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.utils.ScreenUtils;

/** {@link com.badlogic.gdx.ApplicationListener} implementation shared by all platforms. */
public class Main extends ApplicationAdapter {
    // all players config
    private Texture playerTexture;
    private Sprite playerSprite;
    float playerSpeed = 100f;

    // all objects thingie
    private SpriteBatch spriteBatch;
    
    @Override
    public void create() {
        playerTexture = new Texture("player.png");
        playerSprite = new Sprite(playerTexture);

        spriteBatch = new SpriteBatch();
    }

    @Override
    public void render() {
        draw();
        inputGame();
    }

    private void draw() {
        ScreenUtils.clear(Color.GRAY);

        // begin the sprite draw
        spriteBatch.begin();
        
        playerSprite.draw(spriteBatch);

        // after that, end the sprite draw
        spriteBatch.end();
    }

    private void inputGame() {
        float delta = Gdx.graphics.getDeltaTime();

        if (Gdx.input.isKeyPressed(Input.Keys.RIGHT)) {
            playerSprite.translateX(playerSpeed * delta);
        } else if (Gdx.input.isKeyPressed(Input.Keys.LEFT)) {
            playerSprite.translateX(-playerSpeed * delta);
        }
    }

    @Override
    public void dispose() {
        // player.dispose();
    }
}
