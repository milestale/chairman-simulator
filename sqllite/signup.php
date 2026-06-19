<?php
// signup.php
header('Content-Type: application/json');

// Ensure it's a POST request
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method.']);
    exit;
}

// Grab the POST data from GameMaker
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

    // Start a transaction so we don't accidentally create an account without save data
    $db->beginTransaction();

    // Securely hash the password
    $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

    // 1. Insert into accounts table
    $queryAccount = "INSERT INTO accounts (username, password) VALUES (:username, :password)";
    $stmtAccount = $db->prepare($queryAccount);
    $stmtAccount->execute([
        ':username' => $username,
        ':password' => $hashedPassword,
    ]);

    // Get the newly generated player ID
    $playerId = $db->lastInsertId();

    // 2. Insert into save_data table with starting items
    $querySave = "INSERT INTO save_data (player_id, coins, stools, total_stools) VALUES (:player_id, 150, 0, 0)";
    $stmtSave = $db->prepare($querySave);
    $stmtSave->execute([
        ':player_id' => $playerId
    ]);

    // Commit changes if everything succeeded
    $db->commit();
    echo json_encode([
        'status' => 'success', 
        'message' => 'Account created!', 
        'player_id' => $playerId
    ]);

} catch (PDOException $e) {
    // Rollback changes if something went wrong
    if (isset($db) && $db->inTransaction()) {
        $db->rollBack();
    }

    // Check if the error is due to a duplicate username (SQLITE_CONSTRAINT = 19, or code 23000)
    if ($e->getCode() == '23000') {
        echo json_encode(['status' => 'error', 'message' => 'Username already taken.']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Database error: ' . $e->getMessage()]);
    }
}