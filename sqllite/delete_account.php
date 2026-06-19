<?php
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request']);
    exit;
}

$player_id = trim($_POST['player_id'] ?? '');

if (empty($player_id)) {
    echo json_encode(['status' => 'error', 'message' => 'Player ID is missing.']);
    exit;
}

try {
    $db = new PDO('sqlite:accountDB.db');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Удаляем аккаунт. Сохранения (save_data) удалятся автоматически благодаря ON DELETE CASCADE
    $stmt = $db->prepare("DELETE FROM accounts WHERE id = :id");
    $stmt->execute([':id' => $player_id]);

    // Проверяем, есть ли у игрока загруженная аватарка, и удаляем сам файл
    $avatarPath = 'avatars/' . $player_id . '.png';
    if (file_exists($avatarPath)) {
        unlink($avatarPath);
    }

    echo json_encode(['status' => 'success', 'message' => 'Account deleted.']);

} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => 'DB Error: ' . $e->getMessage()]);
}