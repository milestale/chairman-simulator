<?php
// login.php
header('Content-Type: application/json');

// Ensure it's a POST request
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method.']);
    exit;
}

// Grab the POST data
$username = trim($_POST['username'] ?? '');
$password = trim($_POST['password'] ?? '');

// Validation
if (empty($username) || empty($password)) {
    echo json_encode(['status' => 'error', 'message' => 'Username and password cannot be empty.']);
    exit;
}

try {
    // Connect to SQLite database
    $db = new PDO('sqlite:accountDB.db');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // 1. Find the user in the accounts table
    $queryUser = "SELECT id, password, bio FROM accounts WHERE username = :username";
    $stmtUser = $db->prepare($queryUser);
    $stmtUser->execute([':username' => $username]);
    
    $user = $stmtUser->fetch(PDO::FETCH_ASSOC);

    // Check if user exists AND the password matches the hash
    if ($user && password_verify($password, $user['password'])) {
        
        // 2. Fetch the player's save data using a JOIN or a second query
        // Here we use a second query using the player's ID
        $querySave = "SELECT coins, stools, total_stools FROM save_data WHERE player_id = :player_id";
        $stmtSave = $db->prepare($querySave);
        $stmtSave->execute([':player_id' => $user['id']]);
        
        $saveData = $stmtSave->fetch(PDO::FETCH_ASSOC);

        // 3. Return everything to GameMaker
        echo json_encode([
            'status' => 'success',
            'message' => 'Login successful!',
            'data' => [
                'player_id' => $user['id'],
                'bio' => $user['bio'],
                'coins' => $saveData['coins'],
                'stools' => $saveData['stools'],
                'total_stools' => $saveData['total_stools']
            ]
        ]);

    } else {
        // Generic error message for security (don't tell them if it was the username OR password that was wrong)
        echo json_encode(['status' => 'error', 'message' => 'Invalid username or password.']);
    }

} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => 'Database error: ' . $e->getMessage()]);
}