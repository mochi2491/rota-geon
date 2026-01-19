# ドキュメントURL
- [ゲーム企画](https://docs.google.com/document/d/1q0rrwt8abNmdDu-0-WJwyfhkVY_J5wxuLIQ1EHro-E8/edit?usp=sharing)
- [キャラクター性能案](https://docs.google.com/document/d/18RqkeUPAgQrimdIj3HsjR32wYZShi_whPCeZulDTng4/edit?usp=sharing)
- [プロトタイプ](https://docs.google.com/document/d/1dCTnHuhPBlxgrlmGzCe3Q4TYKIQxyHL_WNHmgHPQDCI/edit?usp=sharing)

# memo
キャラは固定でスキルというかスタイルを入れ替えてプレイヤーが四苦八苦する感じにしたい

# Todo

# model構成
* BattleField
  * TurnField
	* Character
	  * Skill
	  * Status
  * SkillDict

# view構成
* battle_view
  * turn_field_view
	* character_avater
* character_panel
  * character_portrait
  * skill_icon
  * health_bar
* enemy_panel
  * health_bar
  * skill_icon (dummy)

# 既知のバグ
- 詠唱が回転しても続く
- TextWindowViewが多分変な挙動
  - tween中に表示しようとすると挙動がおかしくなるはず

# ロードマップ
- [ ] とりあえずbgm
- [ ] 敵実装
  - [ ] 敵の行動アルゴリズム作成
  - [ ] アニメーションの作成
  - [ ] 予備行動演出を追加
- [x] ステータス実装
- [x] ステート実装
- [x] スキル実装
  - [x] ステータスへの反映実装
  - [x] CDの実装
  - [x] 発動時間の実装
  - [ ] スキルの演出追加
- [ ] スキル入れ替え実装
