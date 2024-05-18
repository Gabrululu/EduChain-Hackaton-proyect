// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataVerification {
    // Estructura para almacenar la información
    struct Info {
        string data;
        address creator;
    }

    // Mapeo de claves a la información
    mapping(bytes32 => Info) private infoStorage;

    // Evento que se emitirá cuando se almacene información
    event InfoStored(bytes32 indexed key, address indexed creator, string data);

    // Evento que se emitirá cuando se verifique información
    event InfoVerified(bytes32 indexed key, address indexed verifier, bool success);

    // Función para almacenar información
    function storeInfo(string memory data) public {
        bytes32 key = keccak256(abi.encodePacked(data, msg.sender, block.timestamp));
        infoStorage[key] = Info(data, msg.sender);

        emit InfoStored(key, msg.sender, data);
    }

    // Función para verificar información
    function verifyInfo(bytes32 key, string memory data) public returns (bool) {
        Info storage info = infoStorage[key];
        bool success = (keccak256(abi.encodePacked(info.data)) == keccak256(abi.encodePacked(data)));

        emit InfoVerified(key, msg.sender, success);
        return success;
    }

    // Función para obtener información almacenada (solo para fines de verificación)
    function getInfo(bytes32 key) public view returns (string memory data, address creator) {
        Info storage info = infoStorage[key];
        return (info.data, info.creator);
    }
}
