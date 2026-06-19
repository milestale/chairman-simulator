<?php
// sync.php
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request']);
    exit;
}

// Получаем данные от игры
$player_id = $_POST['player_id'] ?? '';
$coins = $_POST['coins'] ?? '';
$stools = $_POST['stools'] ?? '';
$total_stools = $_POST['total_stools'] ?? '';

// Базовая валидация (проверяем, что ID вообще передан)
if (empty($player_id)) {
    echo json_encode(['status' => 'error', 'message' => 'Player ID is missing']);
    exit;
}

try {
    $db = new PDO('sqlite:accountDB.db');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Обновляем данные сохранения для конкретного игрока
    $query = "UPDATE save_data SET coins = :coins, stools = :stools, total_stools = :total_stools WHERE player_id = :player_id";
    $stmt = $db->prepare($query);
    $stmt->execute([
        ':coins' => (int)$coins,
        ':stools' => (int)$stools,
        ':total_stools' => (int)$total_stools,
        ':player_id' => (int)$player_id
    ]);

    echo json_encode(['status' => 'success', 'message' => 'Data synced']);

} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => 'DB Error: ' . $e->getMessage()]);
}
?>