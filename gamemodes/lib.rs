use samp::prelude::*;
use samp::{initialize_plugin, SampPlugin};
use log::info;

#[derive(SampPlugin)]
struct GameEris;

impl Default for GameEris {
    fn default() -> Self {
        Self
    }
}

impl GameEris {
    fn on_load(&mut self) {
    	let _ = samp::enable_logger!();
        log::info!("[Eris] | Gamemode Carregada com Sucesso!");
    }

    fn on_unload(&self) {
    }

    fn on_tick(&self) {
    }

    fn on_amx_load(&self, amx: &Amx) {
    }

    fn on_amx_unload(&self, amx: &Amx) {
    }
}

initialize_plugin!(type: GameEris, natives: []);
