<?php
header('Content-Type: application/json');

$inputJSON = file_get_contents('php://input');
$data = json_decode($inputJSON, true);

if (!$data) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid data format.']);
    exit;
}

$player_id = $data['player_id'] ?? '';
$new_username = trim($data['username'] ?? '');
$new_password = trim($data['password'] ?? '');
$avatar_base64 = $data['avatar'] ?? '';

if (empty($player_id)) {
    echo json_encode(['status' => 'error', 'message' => 'Player ID missing.']);
    exit;
}

try {
    $db = new PDO('sqlite:accountDB.db');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if (!empty($new_username)) {
        $stmt = $db->prepare("UPDATE accounts SET username = :username WHERE id = :id");
        $stmt->execute([':username' => $new_username, ':id' => $player_id]);
    }

    if (!empty($new_password)) {
        $hashedPassword = password_hash($new_password, PASSWORD_BCRYPT);
        $stmt = $db->prepare("UPDATE accounts SET password = :password WHERE id = :id");
        $stmt->execute([':password' => $hashedPassword, ':id' => $player_id]);
    }

    if (!empty($avatar_base64)) {
        $imageData = base64_decode($avatar_base64);
        
        $avatarPath = 'avatars/' . $player_id . '.png';
        file_put_contents($avatarPath, $imageData);
    }

    echo json_encode(['status' => 'success', 'message' => 'Settings updated successfully!']);

} catch (PDOException $e) {
    if ($e->getCode() == '23000') {
        echo json_encode(['status' => 'error', 'message' => 'Username is already taken.']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'DB Error: ' . $e->getMessage()]);
    }
}