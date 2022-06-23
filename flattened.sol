// Sources flattened with hardhat v2.9.9 https://hardhat.org

// File @openzeppelin/contracts/utils/introspection/IERC165.sol@v4.6.0

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (utils/introspection/IERC165.sol)

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}


// File @openzeppelin/contracts/token/ERC721/IERC721.sol@v4.6.0

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC721/IERC721.sol)

pragma solidity ^0.8.0;

/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721 is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);
}


// File @openzeppelin/contracts/token/ERC721/IERC721Receiver.sol@v4.6.0

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC721/IERC721Receiver.sol)

pragma solidity ^0.8.0;

/**
 * @title ERC721 token receiver interface
 * @dev Interface for any contract that wants to support safeTransfers
 * from ERC721 asset contracts.
 */
interface IERC721Receiver {
    /**
     * @dev Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     *
     * It must return its Solidity selector to confirm the token transfer.
     * If any other value is returned or the interface is not implemented by the recipient, the transfer will be reverted.
     *
     * The selector can be obtained in Solidity with `IERC721Receiver.onERC721Received.selector`.
     */
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}


// File @openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol@v4.6.0

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC721/extensions/IERC721Metadata.sol)

pragma solidity ^0.8.0;

/**
 * @title ERC-721 Non-Fungible Token Standard, optional metadata extension
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 */
interface IERC721Metadata is IERC721 {
    /**
     * @dev Returns the token collection name.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the token collection symbol.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the Uniform Resource Identifier (URI) for `tokenId` token.
     */
    function tokenURI(uint256 tokenId) external view returns (string memory);
}


// File @openzeppelin/contracts/utils/Address.sol@v4.6.0

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.5.0) (utils/Address.sol)

pragma solidity ^0.8.1;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     *
     * [IMPORTANT]
     * ====
     * You shouldn't rely on `isContract` to protect against flash loan attacks!
     *
     * Preventing calls from contracts is highly discouraged. It breaks composability, breaks support for smart wallets
     * like Gnosis Safe, and does not provide security since it can be circumvented by calling from a contract
     * constructor.
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize/address.code.length, which returns 0
        // for contracts in construction, since the code is only stored at the end
        // of the constructor execution.

        return account.code.length > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain `call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        (bool success, bytes memory returndata) = target.staticcall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        (bool success, bytes memory returndata) = target.delegatecall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Tool to verifies that a low level call was successful, and revert if it wasn't, either by bubbling the
     * revert reason using the provided one.
     *
     * _Available since v4.3._
     */
    function verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}


// File @openzeppelin/contracts/utils/Context.sol@v4.6.0

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (utils/Context.sol)

pragma solidity ^0.8.0;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}


// File @openzeppelin/contracts/utils/Strings.sol@v4.6.0

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (utils/Strings.sol)

pragma solidity ^0.8.0;

/**
 * @dev String operations.
 */
library Strings {
    bytes16 private constant _HEX_SYMBOLS = "0123456789abcdef";

    /**
     * @dev Converts a `uint256` to its ASCII `string` decimal representation.
     */
    function toString(uint256 value) internal pure returns (string memory) {
        // Inspired by OraclizeAPI's implementation - MIT licence
        // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation.
     */
    function toHexString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0x00";
        }
        uint256 temp = value;
        uint256 length = 0;
        while (temp != 0) {
            length++;
            temp >>= 8;
        }
        return toHexString(value, length);
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation with fixed length.
     */
    function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i) {
            buffer[i] = _HEX_SYMBOLS[value & 0xf];
            value >>= 4;
        }
        require(value == 0, "Strings: hex length insufficient");
        return string(buffer);
    }
}


// File @openzeppelin/contracts/utils/introspection/ERC165.sol@v4.6.0

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (utils/introspection/ERC165.sol)

pragma solidity ^0.8.0;

/**
 * @dev Implementation of the {IERC165} interface.
 *
 * Contracts that want to implement ERC165 should inherit from this contract and override {supportsInterface} to check
 * for the additional interface id that will be supported. For example:
 *
 * ```solidity
 * function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
 *     return interfaceId == type(MyInterface).interfaceId || super.supportsInterface(interfaceId);
 * }
 * ```
 *
 * Alternatively, {ERC165Storage} provides an easier to use but more expensive implementation.
 */
abstract contract ERC165 is IERC165 {
    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IERC165).interfaceId;
    }
}


// File @openzeppelin/contracts/token/ERC721/ERC721.sol@v4.6.0

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC721/ERC721.sol)

pragma solidity ^0.8.0;







/**
 * @dev Implementation of https://eips.ethereum.org/EIPS/eip-721[ERC721] Non-Fungible Token Standard, including
 * the Metadata extension, but not including the Enumerable extension, which is available separately as
 * {ERC721Enumerable}.
 */
contract ERC721 is Context, ERC165, IERC721, IERC721Metadata {
    using Address for address;
    using Strings for uint256;

    // Token name
    string private _name;

    // Token symbol
    string private _symbol;

    // Mapping from token ID to owner address
    mapping(uint256 => address) private _owners;

    // Mapping owner address to token count
    mapping(address => uint256) private _balances;

    // Mapping from token ID to approved address
    mapping(uint256 => address) private _tokenApprovals;

    // Mapping from owner to operator approvals
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    /**
     * @dev Initializes the contract by setting a `name` and a `symbol` to the token collection.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165, IERC165) returns (bool) {
        return
            interfaceId == type(IERC721).interfaceId ||
            interfaceId == type(IERC721Metadata).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    /**
     * @dev See {IERC721-balanceOf}.
     */
    function balanceOf(address owner) public view virtual override returns (uint256) {
        require(owner != address(0), "ERC721: balance query for the zero address");
        return _balances[owner];
    }

    /**
     * @dev See {IERC721-ownerOf}.
     */
    function ownerOf(uint256 tokenId) public view virtual override returns (address) {
        address owner = _owners[tokenId];
        require(owner != address(0), "ERC721: owner query for nonexistent token");
        return owner;
    }

    /**
     * @dev See {IERC721Metadata-name}.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev See {IERC721Metadata-symbol}.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev See {IERC721Metadata-tokenURI}.
     */
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString())) : "";
    }

    /**
     * @dev Base URI for computing {tokenURI}. If set, the resulting URI for each
     * token will be the concatenation of the `baseURI` and the `tokenId`. Empty
     * by default, can be overridden in child contracts.
     */
    function _baseURI() internal view virtual returns (string memory) {
        return "";
    }

    /**
     * @dev See {IERC721-approve}.
     */
    function approve(address to, uint256 tokenId) public virtual override {
        address owner = ERC721.ownerOf(tokenId);
        require(to != owner, "ERC721: approval to current owner");

        require(
            _msgSender() == owner || isApprovedForAll(owner, _msgSender()),
            "ERC721: approve caller is not owner nor approved for all"
        );

        _approve(to, tokenId);
    }

    /**
     * @dev See {IERC721-getApproved}.
     */
    function getApproved(uint256 tokenId) public view virtual override returns (address) {
        require(_exists(tokenId), "ERC721: approved query for nonexistent token");

        return _tokenApprovals[tokenId];
    }

    /**
     * @dev See {IERC721-setApprovalForAll}.
     */
    function setApprovalForAll(address operator, bool approved) public virtual override {
        _setApprovalForAll(_msgSender(), operator, approved);
    }

    /**
     * @dev See {IERC721-isApprovedForAll}.
     */
    function isApprovedForAll(address owner, address operator) public view virtual override returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    /**
     * @dev See {IERC721-transferFrom}.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        //solhint-disable-next-line max-line-length
        require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");

        _transfer(from, to, tokenId);
    }

    /**
     * @dev See {IERC721-safeTransferFrom}.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        safeTransferFrom(from, to, tokenId, "");
    }

    /**
     * @dev See {IERC721-safeTransferFrom}.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) public virtual override {
        require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");
        _safeTransfer(from, to, tokenId, _data);
    }

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * `_data` is additional data, it has no specified format and it is sent in call to `to`.
     *
     * This internal function is equivalent to {safeTransferFrom}, and can be used to e.g.
     * implement alternative mechanisms to perform token transfer, such as signature-based.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function _safeTransfer(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) internal virtual {
        _transfer(from, to, tokenId);
        require(_checkOnERC721Received(from, to, tokenId, _data), "ERC721: transfer to non ERC721Receiver implementer");
    }

    /**
     * @dev Returns whether `tokenId` exists.
     *
     * Tokens can be managed by their owner or approved accounts via {approve} or {setApprovalForAll}.
     *
     * Tokens start existing when they are minted (`_mint`),
     * and stop existing when they are burned (`_burn`).
     */
    function _exists(uint256 tokenId) internal view virtual returns (bool) {
        return _owners[tokenId] != address(0);
    }

    /**
     * @dev Returns whether `spender` is allowed to manage `tokenId`.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function _isApprovedOrOwner(address spender, uint256 tokenId) internal view virtual returns (bool) {
        require(_exists(tokenId), "ERC721: operator query for nonexistent token");
        address owner = ERC721.ownerOf(tokenId);
        return (spender == owner || isApprovedForAll(owner, spender) || getApproved(tokenId) == spender);
    }

    /**
     * @dev Safely mints `tokenId` and transfers it to `to`.
     *
     * Requirements:
     *
     * - `tokenId` must not exist.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function _safeMint(address to, uint256 tokenId) internal virtual {
        _safeMint(to, tokenId, "");
    }

    /**
     * @dev Same as {xref-ERC721-_safeMint-address-uint256-}[`_safeMint`], with an additional `data` parameter which is
     * forwarded in {IERC721Receiver-onERC721Received} to contract recipients.
     */
    function _safeMint(
        address to,
        uint256 tokenId,
        bytes memory _data
    ) internal virtual {
        _mint(to, tokenId);
        require(
            _checkOnERC721Received(address(0), to, tokenId, _data),
            "ERC721: transfer to non ERC721Receiver implementer"
        );
    }

    /**
     * @dev Mints `tokenId` and transfers it to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {_safeMint} whenever possible
     *
     * Requirements:
     *
     * - `tokenId` must not exist.
     * - `to` cannot be the zero address.
     *
     * Emits a {Transfer} event.
     */
    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), "ERC721: mint to the zero address");
        require(!_exists(tokenId), "ERC721: token already minted");

        _beforeTokenTransfer(address(0), to, tokenId);

        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(address(0), to, tokenId);

        _afterTokenTransfer(address(0), to, tokenId);
    }

    /**
     * @dev Destroys `tokenId`.
     * The approval is cleared when the token is burned.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     *
     * Emits a {Transfer} event.
     */
    function _burn(uint256 tokenId) internal virtual {
        address owner = ERC721.ownerOf(tokenId);

        _beforeTokenTransfer(owner, address(0), tokenId);

        // Clear approvals
        _approve(address(0), tokenId);

        _balances[owner] -= 1;
        delete _owners[tokenId];

        emit Transfer(owner, address(0), tokenId);

        _afterTokenTransfer(owner, address(0), tokenId);
    }

    /**
     * @dev Transfers `tokenId` from `from` to `to`.
     *  As opposed to {transferFrom}, this imposes no restrictions on msg.sender.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     *
     * Emits a {Transfer} event.
     */
    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {
        require(ERC721.ownerOf(tokenId) == from, "ERC721: transfer from incorrect owner");
        require(to != address(0), "ERC721: transfer to the zero address");

        _beforeTokenTransfer(from, to, tokenId);

        // Clear approvals from the previous owner
        _approve(address(0), tokenId);

        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);

        _afterTokenTransfer(from, to, tokenId);
    }

    /**
     * @dev Approve `to` to operate on `tokenId`
     *
     * Emits a {Approval} event.
     */
    function _approve(address to, uint256 tokenId) internal virtual {
        _tokenApprovals[tokenId] = to;
        emit Approval(ERC721.ownerOf(tokenId), to, tokenId);
    }

    /**
     * @dev Approve `operator` to operate on all of `owner` tokens
     *
     * Emits a {ApprovalForAll} event.
     */
    function _setApprovalForAll(
        address owner,
        address operator,
        bool approved
    ) internal virtual {
        require(owner != operator, "ERC721: approve to caller");
        _operatorApprovals[owner][operator] = approved;
        emit ApprovalForAll(owner, operator, approved);
    }

    /**
     * @dev Internal function to invoke {IERC721Receiver-onERC721Received} on a target address.
     * The call is not executed if the target address is not a contract.
     *
     * @param from address representing the previous owner of the given token ID
     * @param to target address that will receive the tokens
     * @param tokenId uint256 ID of the token to be transferred
     * @param _data bytes optional data to send along with the call
     * @return bool whether the call correctly returned the expected magic value
     */
    function _checkOnERC721Received(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) private returns (bool) {
        if (to.isContract()) {
            try IERC721Receiver(to).onERC721Received(_msgSender(), from, tokenId, _data) returns (bytes4 retval) {
                return retval == IERC721Receiver.onERC721Received.selector;
            } catch (bytes memory reason) {
                if (reason.length == 0) {
                    revert("ERC721: transfer to non ERC721Receiver implementer");
                } else {
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
        } else {
            return true;
        }
    }

    /**
     * @dev Hook that is called before any token transfer. This includes minting
     * and burning.
     *
     * Calling conditions:
     *
     * - When `from` and `to` are both non-zero, ``from``'s `tokenId` will be
     * transferred to `to`.
     * - When `from` is zero, `tokenId` will be minted for `to`.
     * - When `to` is zero, ``from``'s `tokenId` will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {}

    /**
     * @dev Hook that is called after any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _afterTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {}
}


// File src/Structures/CreditorStructures.sol

// SPDX-License-Identifier: ISC

pragma solidity ^0.8.13;

interface CreditorStructures {
    struct Credit {
        uint256 loanId; // id of loan associated with
        uint256 trancheNumber;
        uint256 amountSupplied;
        uint256 amountClaimed;
        uint256 lastClaimedAt;
    }

    struct CreditMintParams {
        uint256 loanId;
        uint256 trancheNumber;
        uint256 amountSupplied;
        address creditor;
    }
}


// File src/Borrowers/ERC721Credit.sol

// SPDX-License-Identifier: ISC

pragma solidity ^0.8.13;








contract ERC721Credit is ERC721, CreditorStructures {
    mapping(uint256 => Credit) creditData; // Maps tokenIds to credit structure
    address minter;
    uint256 linesOfCredit;

    constructor(address _minter) ERC721("Credit Receipts", "CRED") {
        minter = _minter;
        linesOfCredit = 0;
    }

    modifier only_minter() {
        require(msg.sender == minter, "Unauthorized");
        _;
    }

    function getCreditInfo(uint256 tokenId)
        external
        view
        returns (Credit memory credit, address owner)
    {
        require(_exists(tokenId), "Line of credit does not exist");
        credit = creditData[tokenId];
        owner = ownerOf(tokenId);
    }

    function setAmountClaimed(uint256 tokenId, uint256 amountClaimed)
        external
        only_minter
    {
        require(_exists(tokenId), "Line of credit does not exist");
        Credit storage credit = creditData[tokenId];
        credit.amountClaimed = amountClaimed;
    }

    function mint(CreditorStructures.CreditMintParams calldata params)
        external
        only_minter
        returns (uint256)
    {
        Credit storage credit = creditData[linesOfCredit];
        credit.amountSupplied = params.amountSupplied;
        credit.loanId = params.loanId;
        credit.trancheNumber = params.trancheNumber;
        _mint(params.creditor, linesOfCredit);
        return linesOfCredit++;
    }

    function burn(uint256 tokenId) external only_minter {
        _burn(tokenId);
    }
}


// File src/Borrowers/IERC721Credit.sol

// SPDX-License-Identifier: ISC

pragma solidity ^0.8.13;








interface IERC721Credit is IERC721, CreditorStructures {
    function getCreditInfo(uint256 tokenId)
        external
        view
        returns (Credit memory credit, address owner);

    function mint(CreditorStructures.CreditMintParams calldata params)
        external
        returns (uint256);

    function burn(uint256 tokenId) external;

    function setAmountClaimed(uint256 tokenId, uint256 amountClaimed) external;
}


// File src/Structures/LoanStructures.sol

// SPDX-License-Identifier: ISC

// license: MIT

pragma solidity ^0.8.13;

contract LoanStructures {
    uint256 public constant PERCENT_DENOMINATOR = 10**10;

    struct OutstandingLoan {
        uint256 amount;
        uint256 time;
    }

    enum LoanPurpose {
        FOOD,
        WATER,
        HEALTH,
        SCHOOL,
        BILLS,
        TRANSPORT,
        OTHER
    }

    struct Tranche {
        uint256 percent;
        uint256 weight;
    }

    struct Loan {
        uint256 start;
        uint256 deadline;
        uint256 id;
        address borrower;
        uint256 totalPaid;
        LoanPurpose purpose;
        bool closed;
        uint256 amount;
    }

    struct LoanRequest {
        uint256 amount;
        uint256 amountFilled;
        address borrower;
        int256 creditScore;
        uint256 duration;
        LoanPurpose purpose;
    }
}


// File src/Structures/MicroLoanEvents.sol

// SPDX-License-Identifier: ISC

pragma solidity ^0.8.13;

interface MicroLoanEvents {
    event LoanRequested(
        uint256 indexed id,
        address indexed requestor,
        int256 indexed creditScore,
        uint256 timestamp,
        uint256 amount,
        uint256 rate
    );
    event LoanFulfilled(
        uint256 indexed id,
        uint256 time,
        address indexed borrower,
        uint256 amount
    );
    event LoanPaymentMade(
        uint256 indexed id,
        uint256 time,
        address indexed borrower,
        uint256 indexed amountPaid,
        uint256 outstandingLoanAmount
    );
    event LoanFullyPaid(
        uint256 indexed id,
        uint256 time,
        address indexed borrower,
        uint256 amountBorrowed,
        uint256 elapsedTime,
        int256 changeToCredit
    );
}


// File @openzeppelin/contracts/access/Ownable.sol@v4.6.0

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (access/Ownable.sol)

pragma solidity ^0.8.0;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _transferOwnership(_msgSender());
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}


// File @openzeppelin/contracts/token/ERC20/IERC20.sol@v4.6.0

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}


// File src/Borrowers/MicroLoanFactory.sol

// SPDX-License-Identifier: ISC

pragma solidity ^0.8.10;






interface InterestModuleLike {
    function incDebt(uint256 loan, uint256 currencyAmount) external;

    function decDebt(uint256 loan, uint256 currencyAmount) external;

    function debt(uint256 loan) external view returns (uint256);

    function rateDebt(uint256 rate) external view returns (uint256);

    function setRate(uint256 loan, uint256 rate) external;

    function changeRate(uint256 loan, uint256 newRate) external;

    function accrue(uint256 loan) external;

    function newLoan(
        uint256 loan,
        uint256 ratePerSecond,
        uint256 fixedRate
    ) external;
}

contract MicroLoanFactory is LoanStructures, MicroLoanEvents, Ownable {
    mapping(uint256 => Loan) public loans;
    mapping(uint256 => LoanRequest) public requestsById;
    mapping(address => uint256) public requestsByAddress;
    mapping(address => int256) public creditScores;
    uint256 public interestRate = 10**9; // 10% interest rate
    address public settlementToken;
    address public creditToken;
    uint256 public IDs;
    InterestModuleLike public interestModule;

    constructor(address token, address _interestModule) Ownable() {
        settlementToken = token;
        IDs = 1;
        interestModule = InterestModuleLike(_interestModule);
    }

    modifier loanExists(uint256 id) {
        require(loans[id].start > 0, "Loan does not exist");
        _;
    }

    modifier requestExists(uint256 id) {
        require(requestsById[id].amount > 0, "Request does not exist");
        _;
    }

    function setCreditToken(address token) external onlyOwner {
        creditToken = token;
    }

    function getAmountOwed(uint256 id) public view returns (uint256) {
        if (loans[id].closed || loans[id].id == 0) {
            return 0;
        }

        return interestModule.debt(id);
    }

    function requestLoan(
        LoanPurpose purpose,
        uint256 amount,
        uint256 duration
    ) external {
        LoanRequest storage request = requestsById[IDs];
        request.amount = amount;
        request.borrower = msg.sender;
        request.creditScore = creditScores[msg.sender];
        request.purpose = purpose;
        request.duration = duration;

        requestsByAddress[msg.sender] = IDs;
        emit LoanRequested(
            IDs,
            msg.sender,
            creditScores[msg.sender],
            block.timestamp,
            amount,
            interestRate
        );
        IDs++;
    }

    function _fulfillLoan(uint256 id) internal requestExists(id) {
        LoanRequest storage request = requestsById[id];
        require(
            loans[requestsByAddress[request.borrower]].start == 0 &&
                loans[id].start == 0,
            "User has an outstanding loan"
        );
        Loan storage loan = loans[id];
        loan.start = block.timestamp;
        loan.deadline = block.timestamp + request.duration;
        loan.id = id;
        loan.borrower = request.borrower;
        loan.purpose = request.purpose;
        loan.amount = request.amount;
        interestModule.newLoan(id, interestRate, interestRate);

        IERC20(settlementToken).transfer(request.borrower, request.amount);
        emit LoanFulfilled(
            id,
            block.timestamp,
            request.borrower,
            request.amount
        );
    }

    function contribute(
        uint256 id,
        uint256 tranche,
        uint256 amount
    ) external {
        LoanRequest storage request = requestsById[id];
        uint256 amountToFill = request.amount - request.amountFilled;
        uint256 fillAmount = amount > amountToFill ? amountToFill : amount;
        require(
            IERC20(settlementToken).transferFrom(
                msg.sender,
                address(this),
                fillAmount
            )
        );
        request.amountFilled -= fillAmount;
        if (request.amountFilled == request.amount) {
            _fulfillLoan(id);
        }
        IERC721Credit(creditToken).mint(
            CreditorStructures.CreditMintParams({
                loanId: id,
                trancheNumber: tranche,
                amountSupplied: fillAmount,
                creditor: msg.sender
            })
        );
    }

    function calculateInterest(uint256 id) internal view returns (uint256) {
        return interestModule.debt(id);
    }

    function closeLoan(uint256 id) internal {
        Loan storage loan = loans[id];
        loan.closed = true;
        uint256 elapsedTime = block.timestamp - loan.start;
        int256 creditChange = int256(block.timestamp) - int256(loan.start);
        creditScores[loan.borrower] =
            creditScores[loan.borrower] +
            creditChange;
        emit LoanFullyPaid(
            id,
            block.timestamp,
            loan.borrower,
            loan.amount,
            elapsedTime,
            creditChange
        );
    }

    function repayLoan(uint256 id, uint256 amount) external {
        Loan storage loan = loans[id];
        interestModule.accrue(id);
        uint256 totalOwed = interestModule.debt(id);
        uint256 amountPaid = amount > totalOwed ? totalOwed : amount;
        loan.totalPaid += amountPaid;
        require(
            IERC20(settlementToken).transferFrom(
                loan.borrower,
                address(this),
                amountPaid
            )
        );
        interestModule.decDebt(id, amountPaid);
        if (amountPaid == totalOwed) {
            closeLoan(id);
        }
        emit LoanPaymentMade(
            id,
            block.timestamp,
            loan.borrower,
            amountPaid,
            totalOwed - amountPaid
        );
    }

    function claimCredit(uint256 creditId) external returns (uint256) {
        (
            CreditorStructures.Credit memory credit,
            address owner
        ) = IERC721Credit(creditToken).getCreditInfo(creditId);
        Loan storage loan = loans[credit.loanId];
        uint256 effectiveAmount = loan.totalPaid - credit.lastClaimedAt;
        uint256 entitledTo = (credit.amountSupplied * effectiveAmount) /
            loan.amount;

        credit.lastClaimedAt = loan.totalPaid;
        IERC721Credit(creditToken).setAmountClaimed(creditId, entitledTo);
        IERC20(settlementToken).transfer(owner, entitledTo);
        return entitledTo;
    }
}


// File @1754-factory/packages/src/math/math.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
// Copyright (C) 2018 Rain <rainbreak@riseup.net>
pragma solidity ^0.8.10;

contract Math {
    uint256 constant ONE = 10 ** 27;

    function safeAdd(uint x, uint y) public pure returns (uint z) {
        require((z = x + y) >= x, "safe-add-failed");
    }

    function safeSub(uint x, uint y) public pure returns (uint z) {
        require((z = x - y) <= x, "safe-sub-failed");
    }

    function safeMul(uint x, uint y) public pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, "safe-mul-failed");
    }

    function safeDiv(uint x, uint y) public pure returns (uint z) {
        z = x / y;
    }

    function rmul(uint x, uint y) public pure returns (uint z) {
        z = safeMul(x, y) / ONE;
    }

    function rdiv(uint x, uint y) public pure returns (uint z) {
        require(y > 0, "division by zero");
        z = safeAdd(safeMul(x, ONE), y / 2) / y;
    }

    function rdivup(uint x, uint y) internal pure returns (uint z) {
        require(y > 0, "division by zero");
        // always rounds up
        z = safeAdd(safeMul(x, ONE), safeSub(y, 1)) / y;
    }


}


// File @1754-factory/packages/src/auth/auth.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
// Copyright (C) Centrifuge 2020, based on MakerDAO dss https://github.com/makerdao/dss
pragma solidity ^0.8.10;

contract Auth {
    mapping (address => uint256) public wards;
    
    event Rely(address indexed usr);
    event Deny(address indexed usr);

    function rely(address usr) external auth {
        wards[usr] = 1;
        emit Rely(usr);
    }
    function deny(address usr) external auth {
        wards[usr] = 0;
        emit Deny(usr);
    }

    modifier auth {
        require(wards[msg.sender] == 1, "not-authorized");
        _;
    }

}


// File @1754-factory/packages/src/ownership/title.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;


contract Title is Auth, ERC721 {
    // --- Data ---
    uint public count;

    constructor (string memory name, string memory symbol) ERC721(name, symbol) {
        wards[msg.sender] = 1;
        count = 1;
    }

    // --- Title ---
    function issue (address usr) public auth returns (uint) {
        return _issue(usr);
    }

    function _issue (address usr) internal returns (uint) {
        _mint(usr, count);
        count += 1; // can't overflow, not enough gas in the world to pay for 2**256 nfts.
        return count-1;
    }

    function close (uint tkn) public auth {
        _burn(tkn);
    }
}

interface TitleLike {
    function issue(address) external returns (uint);
    function close(uint) external;
    function ownerOf (uint) external view returns (address);
    function count () external view returns (uint);
}

contract TitleOwned {
    TitleLike title;
    constructor (address title_) {
        title = TitleLike(title_);
    }

    modifier owner (uint loan) { require(title.ownerOf(loan) == msg.sender); _; }
}


// File @1754-factory/tinlake/src/borrower/shelf.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;


interface NFTLike {
    function ownerOf(uint256 tokenId) external view returns (address owner);

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;
}

interface TokenLike {
    function totalSupply() external view returns (uint256);

    function balanceOf(address) external view returns (uint256);

    function transferFrom(
        address,
        address,
        uint256
    ) external returns (bool);

    function transfer(address, uint256) external returns (bool);

    function approve(address, uint256) external;
}

interface PileLike {
    function total() external view returns (uint256);

    function debt(uint256) external returns (uint256);

    function accrue(uint256) external;

    function incDebt(uint256, uint256) external;

    function decDebt(uint256, uint256) external;
}

interface NAVFeedLike {
    function borrow(uint256 loan, uint256 currencyAmount) external;

    function repay(uint256 loan, uint256 currencyAmount) external;

    function presentValue(uint256 loan) external view returns (uint256);

    function futureValue(uint256 loan) external view returns (uint256);

    function zeroPV(uint256 loan) external view returns (bool);
}

interface ReserveLike {
    function deposit(uint256 currencyAmount) external;

    function payoutForLoans(uint256 currencyAmount) external;
}

interface SubscriberLike {
    function borrowEvent(uint256 loan, uint256 amount) external;

    function repayEvent(uint256 loan, uint256 amount) external;

    function lockEvent(uint256 loan) external;

    function unlockEvent(uint256 loan) external;
}

interface AssessorLike {
    function reBalance() external;
}

contract Shelf is Auth, TitleOwned, Math {
    // --- Data ---
    NAVFeedLike public ceiling;
    PileLike public pile;
    TokenLike public currency;
    ReserveLike public reserve;
    AssessorLike public assessor;
    SubscriberLike public subscriber;

    uint256 public balance;

    struct Loan {
        address registry;
        uint256 tokenId;
    }

    mapping(uint256 => uint256) public balances;
    mapping(uint256 => Loan) public shelf;
    mapping(bytes32 => uint256) public nftlookup;

    // Events
    event Close(uint256 indexed loan);
    event Issue(address indexed registry_, uint256 indexed token_);
    event Borrow(uint256 indexed loan, uint256 currencyAmount);
    event Withdraw(uint256 indexed loan, uint256 currencyAmount, address usr);
    event Repay(uint256 indexed loan, uint256 currencyAmount);
    event Recover(uint256 indexed loan, address usr, uint256 currencyAmount);
    event Lock(uint256 indexed loan);
    event Unlock(uint256 indexed loan);
    event Claim(uint256 indexed loan, address usr);
    event Depend(bytes32 indexed contractName, address addr);

    constructor(
        address currency_,
        address title_,
        address pile_,
        address ceiling_
    ) TitleOwned(title_) {
        currency = TokenLike(currency_);
        pile = PileLike(pile_);
        ceiling = NAVFeedLike(ceiling_);

        wards[msg.sender] = 1;
        emit Rely(msg.sender);
    }

    // sets the dependency to another contract
    function depend(bytes32 contractName, address addr) external auth {
        if (contractName == "token") {
            currency = TokenLike(addr);
        } else if (contractName == "title") {
            title = TitleLike(addr);
        } else if (contractName == "pile") {
            pile = PileLike(addr);
        } else if (contractName == "ceiling") {
            ceiling = NAVFeedLike(addr);
        } else if (contractName == "reserve") {
            if (address(reserve) != address(0))
                currency.approve(address(reserve), uint256(0));
            currency.approve(addr, type(uint256).max);
            reserve = ReserveLike(addr);
        } else if (contractName == "assessor") {
            assessor = AssessorLike(addr);
        } else if (contractName == "subscriber") {
            subscriber = SubscriberLike(addr);
        } else revert();
        emit Depend(contractName, addr);
    }

    function token(uint256 loan)
        public
        view
        returns (address registry, uint256 nft)
    {
        return (shelf[loan].registry, shelf[loan].tokenId);
    }

    // issues a new loan in Tinlake - it requires the ownership of an nft
    // first step in the loan process - everyone could add an nft
    function issue(address registry_, uint256 token_)
        external
        returns (uint256)
    {
        require(
            NFTLike(registry_).ownerOf(token_) == msg.sender,
            "nft-not-owned"
        );
        bytes32 nft = keccak256(abi.encodePacked(registry_, token_));
        require(nftlookup[nft] == 0, "nft-in-use");
        uint256 loan = title.issue(msg.sender);
        nftlookup[nft] = loan;
        shelf[loan].registry = registry_;
        shelf[loan].tokenId = token_;

        emit Issue(registry_, token_);
        return loan;
    }

    function close(uint256 loan) external {
        require(!nftLocked(loan), "nft-locked");
        (address registry, uint256 tokenId) = token(loan);
        require(
            title.ownerOf(loan) == msg.sender ||
                NFTLike(registry).ownerOf(tokenId) == msg.sender,
            "not-loan-or-nft-owner"
        );
        title.close(loan);
        bytes32 nft = keccak256(
            abi.encodePacked(shelf[loan].registry, shelf[loan].tokenId)
        );
        nftlookup[nft] = 0;
        _resetLoanBalance(loan);
        emit Close(loan);
    }

    // starts the borrow process of a loan
    // informs the system of the requested currencyAmount
    // interest accumulation starts with this method
    // the method can only be called if the nft is locked
    // a max ceiling needs to be defined by an oracle
    function borrow(uint256 loan, uint256 currencyAmount) external owner(loan) {
        require(nftLocked(loan), "nft-not-locked");

        if (address(subscriber) != address(0)) {
            subscriber.borrowEvent(loan, currencyAmount);
        }

        pile.accrue(loan);

        balances[loan] = safeAdd(balances[loan], currencyAmount);
        balance = safeAdd(balance, currencyAmount);

        // payout to shelf
        reserve.payoutForLoans(currencyAmount);

        // increase NAV
        ceiling.borrow(loan, currencyAmount);
        pile.incDebt(loan, currencyAmount);

        // reBalance lender interest bearing amount based on new NAV
        assessor.reBalance();

        emit Borrow(loan, currencyAmount);
    }

    // withdraw transfers the currency to the borrower account
    function withdraw(
        uint256 loan,
        uint256 currencyAmount,
        address usr
    ) external owner(loan) {
        require(nftLocked(loan), "nft-not-locked");
        require(currencyAmount <= balances[loan], "withdraw-amount-too-high");

        balances[loan] = safeSub(balances[loan], currencyAmount);
        balance = safeSub(balance, currencyAmount);
        require(
            currency.transfer(usr, currencyAmount),
            "currency-transfer-failed"
        );
        emit Withdraw(loan, currencyAmount, usr);
    }

    // repays the entire or partial debt of a loan
    function repay(uint256 loan, uint256 currencyAmount) external owner(loan) {
        require(nftLocked(loan), "nft-not-locked");
        require(balances[loan] == 0, "withdraw-required-before-repay");

        if (address(subscriber) != address(0)) {
            subscriber.repayEvent(loan, currencyAmount);
        }

        pile.accrue(loan);
        uint256 loanDebt = pile.debt(loan);

        // only repay max loan debt
        if (currencyAmount > loanDebt) {
            currencyAmount = loanDebt;
        }
        require(
            currency.transferFrom(msg.sender, address(this), currencyAmount),
            "currency-transfer-failed"
        );
        ceiling.repay(loan, currencyAmount);
        pile.decDebt(loan, currencyAmount);
        reserve.deposit(currencyAmount);

        // reBalance lender interest bearing amount based on new NAV
        assessor.reBalance();

        emit Repay(loan, currencyAmount);
    }

    // a collector can recover defaulted loans
    // it is not required to recover the entire loan debt
    function recover(
        uint256 loan,
        address usr,
        uint256 currencyAmount
    ) external auth {
        pile.accrue(loan);

        uint256 loanDebt = pile.debt(loan);

        require(
            currency.transferFrom(usr, address(this), currencyAmount),
            "currency-transfer-failed"
        );

        ceiling.repay(loan, loanDebt);
        // sets loan debt to 0
        pile.decDebt(loan, loanDebt);
        _resetLoanBalance(loan);
        reserve.deposit(currencyAmount);
        // reBalance lender interest bearing amount based on new NAV
        assessor.reBalance();
        emit Recover(loan, usr, currencyAmount);
    }

    function _repay(
        uint256 loan,
        address usr,
        uint256 currencyAmount
    ) internal {
        pile.accrue(loan);
        uint256 loanDebt = pile.debt(loan);

        // only repay max loan debt
        if (currencyAmount > loanDebt) {
            currencyAmount = loanDebt;
        }
        require(
            currency.transferFrom(usr, address(this), currencyAmount),
            "currency-transfer-failed"
        );
        ceiling.repay(loan, currencyAmount);
        pile.decDebt(loan, currencyAmount);

        reserve.deposit(currencyAmount);
        // reBalance lender interest bearing amount based on new NAV
        assessor.reBalance();
    }

    // locks an nft in the shelf
    // requires an issued loan
    function lock(uint256 loan) external owner(loan) {
        if (address(subscriber) != address(0)) {
            subscriber.lockEvent(loan);
        }
        NFTLike(shelf[loan].registry).transferFrom(
            msg.sender,
            address(this),
            shelf[loan].tokenId
        );
        emit Lock(loan);
    }

    // unlocks an nft in the shelf
    // requires zero debt or 100% write off
    function unlock(uint256 loan) external owner(loan) {
        // loans can be unlocked and closed when the debt is 0, or the loan is written off 100%
        uint256 debt_ = pile.debt(loan);

        require(
            debt_ == 0 || ceiling.zeroPV(loan),
            "loan-has-outstanding-debt"
        );

        if (address(subscriber) != address(0)) {
            subscriber.unlockEvent(loan);
        }

        NFTLike(shelf[loan].registry).transferFrom(
            address(this),
            msg.sender,
            shelf[loan].tokenId
        );

        emit Unlock(loan);
    }

    function nftLocked(uint256 loan) public view returns (bool) {
        return
            NFTLike(shelf[loan].registry).ownerOf(shelf[loan].tokenId) ==
            address(this);
    }

    // a loan can be claimed by a collector if the loan debt is above the loan threshold
    // transfers the nft to the collector
    function claim(uint256 loan, address usr) public auth {
        NFTLike(shelf[loan].registry).transferFrom(
            address(this),
            usr,
            shelf[loan].tokenId
        );
        emit Claim(loan, usr);
    }

    function _resetLoanBalance(uint256 loan) internal {
        uint256 loanBalance = balances[loan];
        if (loanBalance > 0) {
            balances[loan] = 0;
            balance = safeSub(balance, loanBalance);
        }
    }

    // returns the total number of loans including closed loans
    function loanCount() public view returns (uint256) {
        return title.count();
    }
}


// File @1754-factory/tinlake/src/lender/operator.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

interface TrancheLike {
    function supplyOrder(address usr, uint256 currencyAmount) external;

    function redeemOrder(address usr, uint256 tokenAmount) external;

    function disburse(address usr)
        external
        returns (
            uint256 payoutCurrencyAmount,
            uint256 payoutTokenAmount,
            uint256 remainingSupplyCurrency,
            uint256 remainingRedeemToken
        );

    function disburse(address usr, uint256 endEpoch)
        external
        returns (
            uint256 payoutCurrencyAmount,
            uint256 payoutTokenAmount,
            uint256 remainingSupplyCurrency,
            uint256 remainingRedeemToken
        );

    function currency() external view returns (address);
}

interface RestrictedTokenLike {
    function hasMember(address) external view returns (bool);
}

interface EIP2612PermitLike {
    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;
}

interface DaiPermitLike {
    function permit(
        address holder,
        address spender,
        uint256 nonce,
        uint256 expiry,
        bool allowed,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;
}

contract Operator is Auth {
    TrancheLike public tranche;
    RestrictedTokenLike public token;

    // Events
    event SupplyOrder(uint256 indexed amount);
    event RedeemOrder(uint256 indexed amount);
    event Depend(bytes32 indexed contractName, address addr);

    constructor(address tranche_) {
        tranche = TrancheLike(tranche_);
        wards[msg.sender] = 1;
        emit Rely(msg.sender);
    }

    // sets the dependency to another contract
    function depend(bytes32 contractName, address addr) public auth {
        if (contractName == "tranche") {
            tranche = TrancheLike(addr);
        } else if (contractName == "token") {
            token = RestrictedTokenLike(addr);
        } else revert();
        emit Depend(contractName, addr);
    }

    // only investors that are on the memberlist can submit supplyOrders
    function supplyOrder(uint256 amount) public {
        require(
            (token.hasMember(msg.sender) == true),
            "user-not-allowed-to-hold-token"
        );
        tranche.supplyOrder(msg.sender, amount);
        emit SupplyOrder(amount);
    }

    // only investors that are on the memberlist can submit redeemOrders
    function redeemOrder(uint256 amount) public {
        require(
            (token.hasMember(msg.sender) == true),
            "user-not-allowed-to-hold-token"
        );
        tranche.redeemOrder(msg.sender, amount);
        emit RedeemOrder(amount);
    }

    // only investors that are on the memberlist can disburse
    function disburse()
        external
        returns (
            uint256 payoutCurrencyAmount,
            uint256 payoutTokenAmount,
            uint256 remainingSupplyCurrency,
            uint256 remainingRedeemToken
        )
    {
        require(
            (token.hasMember(msg.sender) == true),
            "user-not-allowed-to-hold-token"
        );
        return tranche.disburse(msg.sender);
    }

    function disburse(uint256 endEpoch)
        external
        returns (
            uint256 payoutCurrencyAmount,
            uint256 payoutTokenAmount,
            uint256 remainingSupplyCurrency,
            uint256 remainingRedeemToken
        )
    {
        require(
            (token.hasMember(msg.sender) == true),
            "user-not-allowed-to-hold-token"
        );
        return tranche.disburse(msg.sender, endEpoch);
    }

    // --- Permit Support ---
    function supplyOrderWithDaiPermit(
        uint256 amount,
        uint256 nonce,
        uint256 expiry,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public {
        DaiPermitLike(tranche.currency()).permit(
            msg.sender,
            address(tranche),
            nonce,
            expiry,
            true,
            v,
            r,
            s
        );
        supplyOrder(amount);
    }

    function supplyOrderWithPermit(
        uint256 amount,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public {
        EIP2612PermitLike(tranche.currency()).permit(
            msg.sender,
            address(tranche),
            value,
            deadline,
            v,
            r,
            s
        );
        supplyOrder(amount);
    }

    function redeemOrderWithPermit(
        uint256 amount,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public {
        EIP2612PermitLike(address(token)).permit(
            msg.sender,
            address(tranche),
            value,
            deadline,
            v,
            r,
            s
        );
        redeemOrder(amount);
    }
}


// File src/Borrowers/PermissionedBorrower.sol

pragma solidity ^0.8.13;



contract PermissionedBorrower is Ownable {}


// File @openzeppelin/contracts/access/IAccessControl.sol@v4.6.0

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (access/IAccessControl.sol)

pragma solidity ^0.8.0;

/**
 * @dev External interface of AccessControl declared to support ERC165 detection.
 */
interface IAccessControl {
    /**
     * @dev Emitted when `newAdminRole` is set as ``role``'s admin role, replacing `previousAdminRole`
     *
     * `DEFAULT_ADMIN_ROLE` is the starting admin for all roles, despite
     * {RoleAdminChanged} not being emitted signaling this.
     *
     * _Available since v3.1._
     */
    event RoleAdminChanged(bytes32 indexed role, bytes32 indexed previousAdminRole, bytes32 indexed newAdminRole);

    /**
     * @dev Emitted when `account` is granted `role`.
     *
     * `sender` is the account that originated the contract call, an admin role
     * bearer except when using {AccessControl-_setupRole}.
     */
    event RoleGranted(bytes32 indexed role, address indexed account, address indexed sender);

    /**
     * @dev Emitted when `account` is revoked `role`.
     *
     * `sender` is the account that originated the contract call:
     *   - if using `revokeRole`, it is the admin role bearer
     *   - if using `renounceRole`, it is the role bearer (i.e. `account`)
     */
    event RoleRevoked(bytes32 indexed role, address indexed account, address indexed sender);

    /**
     * @dev Returns `true` if `account` has been granted `role`.
     */
    function hasRole(bytes32 role, address account) external view returns (bool);

    /**
     * @dev Returns the admin role that controls `role`. See {grantRole} and
     * {revokeRole}.
     *
     * To change a role's admin, use {AccessControl-_setRoleAdmin}.
     */
    function getRoleAdmin(bytes32 role) external view returns (bytes32);

    /**
     * @dev Grants `role` to `account`.
     *
     * If `account` had not been already granted `role`, emits a {RoleGranted}
     * event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     */
    function grantRole(bytes32 role, address account) external;

    /**
     * @dev Revokes `role` from `account`.
     *
     * If `account` had been granted `role`, emits a {RoleRevoked} event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     */
    function revokeRole(bytes32 role, address account) external;

    /**
     * @dev Revokes `role` from the calling account.
     *
     * Roles are often managed via {grantRole} and {revokeRole}: this function's
     * purpose is to provide a mechanism for accounts to lose their privileges
     * if they are compromised (such as when a trusted device is misplaced).
     *
     * If the calling account had been granted `role`, emits a {RoleRevoked}
     * event.
     *
     * Requirements:
     *
     * - the caller must be `account`.
     */
    function renounceRole(bytes32 role, address account) external;
}


// File @openzeppelin/contracts/access/AccessControl.sol@v4.6.0

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.6.0) (access/AccessControl.sol)

pragma solidity ^0.8.0;




/**
 * @dev Contract module that allows children to implement role-based access
 * control mechanisms. This is a lightweight version that doesn't allow enumerating role
 * members except through off-chain means by accessing the contract event logs. Some
 * applications may benefit from on-chain enumerability, for those cases see
 * {AccessControlEnumerable}.
 *
 * Roles are referred to by their `bytes32` identifier. These should be exposed
 * in the external API and be unique. The best way to achieve this is by
 * using `public constant` hash digests:
 *
 * ```
 * bytes32 public constant MY_ROLE = keccak256("MY_ROLE");
 * ```
 *
 * Roles can be used to represent a set of permissions. To restrict access to a
 * function call, use {hasRole}:
 *
 * ```
 * function foo() public {
 *     require(hasRole(MY_ROLE, msg.sender));
 *     ...
 * }
 * ```
 *
 * Roles can be granted and revoked dynamically via the {grantRole} and
 * {revokeRole} functions. Each role has an associated admin role, and only
 * accounts that have a role's admin role can call {grantRole} and {revokeRole}.
 *
 * By default, the admin role for all roles is `DEFAULT_ADMIN_ROLE`, which means
 * that only accounts with this role will be able to grant or revoke other
 * roles. More complex role relationships can be created by using
 * {_setRoleAdmin}.
 *
 * WARNING: The `DEFAULT_ADMIN_ROLE` is also its own admin: it has permission to
 * grant and revoke this role. Extra precautions should be taken to secure
 * accounts that have been granted it.
 */
abstract contract AccessControl is Context, IAccessControl, ERC165 {
    struct RoleData {
        mapping(address => bool) members;
        bytes32 adminRole;
    }

    mapping(bytes32 => RoleData) private _roles;

    bytes32 public constant DEFAULT_ADMIN_ROLE = 0x00;

    /**
     * @dev Modifier that checks that an account has a specific role. Reverts
     * with a standardized message including the required role.
     *
     * The format of the revert reason is given by the following regular expression:
     *
     *  /^AccessControl: account (0x[0-9a-f]{40}) is missing role (0x[0-9a-f]{64})$/
     *
     * _Available since v4.1._
     */
    modifier onlyRole(bytes32 role) {
        _checkRole(role);
        _;
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IAccessControl).interfaceId || super.supportsInterface(interfaceId);
    }

    /**
     * @dev Returns `true` if `account` has been granted `role`.
     */
    function hasRole(bytes32 role, address account) public view virtual override returns (bool) {
        return _roles[role].members[account];
    }

    /**
     * @dev Revert with a standard message if `_msgSender()` is missing `role`.
     * Overriding this function changes the behavior of the {onlyRole} modifier.
     *
     * Format of the revert message is described in {_checkRole}.
     *
     * _Available since v4.6._
     */
    function _checkRole(bytes32 role) internal view virtual {
        _checkRole(role, _msgSender());
    }

    /**
     * @dev Revert with a standard message if `account` is missing `role`.
     *
     * The format of the revert reason is given by the following regular expression:
     *
     *  /^AccessControl: account (0x[0-9a-f]{40}) is missing role (0x[0-9a-f]{64})$/
     */
    function _checkRole(bytes32 role, address account) internal view virtual {
        if (!hasRole(role, account)) {
            revert(
                string(
                    abi.encodePacked(
                        "AccessControl: account ",
                        Strings.toHexString(uint160(account), 20),
                        " is missing role ",
                        Strings.toHexString(uint256(role), 32)
                    )
                )
            );
        }
    }

    /**
     * @dev Returns the admin role that controls `role`. See {grantRole} and
     * {revokeRole}.
     *
     * To change a role's admin, use {_setRoleAdmin}.
     */
    function getRoleAdmin(bytes32 role) public view virtual override returns (bytes32) {
        return _roles[role].adminRole;
    }

    /**
     * @dev Grants `role` to `account`.
     *
     * If `account` had not been already granted `role`, emits a {RoleGranted}
     * event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     */
    function grantRole(bytes32 role, address account) public virtual override onlyRole(getRoleAdmin(role)) {
        _grantRole(role, account);
    }

    /**
     * @dev Revokes `role` from `account`.
     *
     * If `account` had been granted `role`, emits a {RoleRevoked} event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     */
    function revokeRole(bytes32 role, address account) public virtual override onlyRole(getRoleAdmin(role)) {
        _revokeRole(role, account);
    }

    /**
     * @dev Revokes `role` from the calling account.
     *
     * Roles are often managed via {grantRole} and {revokeRole}: this function's
     * purpose is to provide a mechanism for accounts to lose their privileges
     * if they are compromised (such as when a trusted device is misplaced).
     *
     * If the calling account had been revoked `role`, emits a {RoleRevoked}
     * event.
     *
     * Requirements:
     *
     * - the caller must be `account`.
     */
    function renounceRole(bytes32 role, address account) public virtual override {
        require(account == _msgSender(), "AccessControl: can only renounce roles for self");

        _revokeRole(role, account);
    }

    /**
     * @dev Grants `role` to `account`.
     *
     * If `account` had not been already granted `role`, emits a {RoleGranted}
     * event. Note that unlike {grantRole}, this function doesn't perform any
     * checks on the calling account.
     *
     * [WARNING]
     * ====
     * This function should only be called from the constructor when setting
     * up the initial roles for the system.
     *
     * Using this function in any other way is effectively circumventing the admin
     * system imposed by {AccessControl}.
     * ====
     *
     * NOTE: This function is deprecated in favor of {_grantRole}.
     */
    function _setupRole(bytes32 role, address account) internal virtual {
        _grantRole(role, account);
    }

    /**
     * @dev Sets `adminRole` as ``role``'s admin role.
     *
     * Emits a {RoleAdminChanged} event.
     */
    function _setRoleAdmin(bytes32 role, bytes32 adminRole) internal virtual {
        bytes32 previousAdminRole = getRoleAdmin(role);
        _roles[role].adminRole = adminRole;
        emit RoleAdminChanged(role, previousAdminRole, adminRole);
    }

    /**
     * @dev Grants `role` to `account`.
     *
     * Internal function without access restriction.
     */
    function _grantRole(bytes32 role, address account) internal virtual {
        if (!hasRole(role, account)) {
            _roles[role].members[account] = true;
            emit RoleGranted(role, account, _msgSender());
        }
    }

    /**
     * @dev Revokes `role` from `account`.
     *
     * Internal function without access restriction.
     */
    function _revokeRole(bytes32 role, address account) internal virtual {
        if (hasRole(role, account)) {
            _roles[role].members[account] = false;
            emit RoleRevoked(role, account, _msgSender());
        }
    }
}


// File src/Delegators/Delegator.sol

pragma solidity ^0.8.13;

contract Delegator is AccessControl {
    bytes32 public constant DELEGATOR = keccak256("DELEGATOR_ROLE");
    bytes32 public constant OWNER = keccak256("OWNER");

    struct CreditProposal {
        uint8 totalVotes;
        uint8 votesFor;
    }

    uint8 threshold;
    address fund;

    mapping(address => CreditProposal) proposals; // Maps beneficiary to Proposal struct
    mapping(address => mapping(address => uint8)) votes; // 0 -> havent voted, 1 -> voted no, 2 -> voted yes

    event VoteCast(
        address indexed beneficiary,
        address indexed voter,
        bool approved
    );
    event LoanApproved(address indexed beneficiary);
    event LoanDenied(address indexed beneficiary);

    error AlreadyVoted(address beneficiary, address voter);
    error ProposalNotActive(address beneficiary);

    constructor(
        address _owner,
        address _fund,
        address[] memory _initialDelegators,
        uint8 _threshold
    ) {
        _grantRole(OWNER, _owner);
        threshold = _threshold;
        fund = _fund;

        for (uint8 i = 0; i < _initialDelegators.length; i++) {
            _grantRole(DELEGATOR, _initialDelegators[i]);
        }
    }

    modifier newVote(address loanId) {
        if (votes[loanId][msg.sender] > 0)
            revert AlreadyVoted(loanId, msg.sender);
        _;
    }

    function isApproved(address beneficiary) external view returns (bool) {
        CreditProposal memory prop = proposals[beneficiary];
        return prop.votesFor >= threshold;
    }

    function vote(address beneficiary, bool approved)
        external
        onlyRole(DELEGATOR)
        newVote(beneficiary)
    {
        CreditProposal memory prop = proposals[beneficiary];
        prop.totalVotes++;
        if (approved) prop.votesFor++;

        emit VoteCast(beneficiary, msg.sender, approved);
    }
}


// File @1754-factory/packages/src/math/interest.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
// Copyright (C) 2018 Rain <rainbreak@riseup.net> and Centrifuge, referencing MakerDAO dss => https://github.com/makerdao/dss/blob/master/src/pot.sol
pragma solidity ^0.8.10;

contract Interest is Math {
    // @notice This function provides compounding in seconds
    // @param chi Accumulated interest rate over time
    // @param ratePerSecond Interest rate accumulation per second in RAD(10ˆ27)
    // @param lastUpdated When the interest rate was last updated
    // @param pie Total sum of all amounts accumulating under one interest rate, divided by that rate
    // @return The new accumulated rate, as well as the difference between the debt calculated with the old and new accumulated rates.
    function compounding(uint chi, uint ratePerSecond, uint lastUpdated, uint pie) public view returns (uint, uint) {
        require(block.timestamp >= lastUpdated, "tinlake-math/invalid-timestamp");
        require(chi != 0);
        // instead of a interestBearingAmount we use a accumulated interest rate index (chi)
        uint updatedChi = _chargeInterest(chi ,ratePerSecond, lastUpdated, block.timestamp);
        return (updatedChi, safeSub(rmul(updatedChi, pie), rmul(chi, pie)));
    }

    // @notice This function charge interest on a interestBearingAmount
    // @param interestBearingAmount is the interest bearing amount
    // @param ratePerSecond Interest rate accumulation per second in RAD(10ˆ27)
    // @param lastUpdated last time the interest has been charged
    // @return interestBearingAmount + interest
    function chargeInterest(uint interestBearingAmount, uint ratePerSecond, uint lastUpdated) public view returns (uint) {
        if (block.timestamp >= lastUpdated) {
            interestBearingAmount = _chargeInterest(interestBearingAmount, ratePerSecond, lastUpdated, block.timestamp);
        }
        return interestBearingAmount;
    }

    function _chargeInterest(uint interestBearingAmount, uint ratePerSecond, uint lastUpdated, uint current) internal pure returns (uint) {
        return rmul(rpow(ratePerSecond, current - lastUpdated, ONE), interestBearingAmount);
    }


    // convert pie to debt/savings amount
    function toAmount(uint chi, uint pie) public pure returns (uint) {
        return rmul(pie, chi);
    }

    // convert debt/savings amount to pie
    function toPie(uint chi, uint amount) public pure returns (uint) {
        return rdivup(amount, chi);
    }

    function rpow(uint x, uint n, uint base) public pure returns (uint z) {
        assembly {
            switch x case 0 {switch n case 0 {z := base} default {z := 0}}
            default {
                switch mod(n, 2) case 0 { z := base } default { z := x }
                let half := div(base, 2)  // for rounding.
                for { n := div(n, 2) } n { n := div(n,2) } {
                let xx := mul(x, x)
                if iszero(eq(div(xx, x), x)) { revert(0,0) }
                let xxRound := add(xx, half)
                if lt(xxRound, xx) { revert(0,0) }
                x := div(xxRound, base)
                if mod(n,2) {
                    let zx := mul(z, x)
                    if and(iszero(iszero(x)), iszero(eq(div(zx, x), z))) { revert(0,0) }
                    let zxRound := add(zx, half)
                    if lt(zxRound, zx) { revert(0,0) }
                    z := div(zxRound, base)
                }
            }
            }
        }
    }
}


// File src/Interest/InterestModule.sol

// SPDX-License-Identifier: AGPL-3.0-only
// Copyright (C) 2018  Rain <rainbreak@riseup.net>, Centrifuge
pragma solidity ^0.8.13;


// ## Interest Group based Pile
// The following is one implementation of a debt module. It keeps track of different buckets of interest rates and is optimized for many loans per interest bucket. It keeps track of interest
// rate accumulators (chi values) for all interest rate categories. It calculates debt each
// loan according to its interest rate category and pie value.
contract InterestModule is Auth, Interest {
    // --- Data ---

    // stores all needed information of an interest rate group
    struct Rate {
        uint256 pie; // Total debt of all loans with this rate
        uint256 chi; // Accumulated rates
        uint256 ratePerSecond; // Accumulation per second
        uint48 lastUpdated; // Last time the rate was accumulated
        uint256 fixedRate; // fixed rate applied to each loan of the group
    }

    // Interest Rate Groups are identified by a `uint` and stored in a mapping
    mapping(uint256 => Rate) public rates;

    // mapping of all loan debts
    // the debt is stored as pie
    // pie is defined as pie = debt/chi therefore debt = pie * chi
    // where chi is the accumulated interest rate index over time
    mapping(uint256 => uint256) public pie;
    // loan => rate
    mapping(uint256 => uint256) public loanRates;

    // Events
    event IncreaseDebt(uint256 indexed loan, uint256 currencyAmount);
    event DecreaseDebt(uint256 indexed loan, uint256 currencyAmount);
    event SetRate(uint256 indexed loan, uint256 rate);
    event ChangeRate(uint256 indexed loan, uint256 newRate);
    event File(bytes32 indexed what, uint256 rate, uint256 value);

    constructor() {
        // pre-definition for loans without interest rates
        rates[0].chi = ONE;
        rates[0].ratePerSecond = ONE;

        wards[msg.sender] = 1;
        emit Rely(msg.sender);
    }

    // --- Public Debt Methods  ---
    // increases the debt of a loan by a currencyAmount
    // a change of the loan debt updates the rate debt and total debt
    function incDebt(uint256 loan, uint256 currencyAmount) external auth {
        uint256 rate = loanRates[loan];
        require(
            block.timestamp == rates[rate].lastUpdated,
            "rate-group-not-updated"
        );
        currencyAmount = (currencyAmount +
            rmul(currencyAmount, rates[rate].fixedRate));
        uint256 pieAmount = toPie(rates[rate].chi, currencyAmount);

        pie[loan] = (pie[loan] + pieAmount);
        rates[rate].pie = (rates[rate].pie + pieAmount);

        emit IncreaseDebt(loan, currencyAmount);
    }

    // decrease the loan's debt by a currencyAmount
    // a change of the loan debt updates the rate debt and total debt
    function decDebt(uint256 loan, uint256 currencyAmount) external auth {
        uint256 rate = loanRates[loan];
        require(
            block.timestamp == rates[rate].lastUpdated,
            "rate-group-not-updated"
        );
        uint256 pieAmount = toPie(rates[rate].chi, currencyAmount);

        pie[loan] = (pie[loan] + pieAmount);
        rates[rate].pie = (rates[rate].pie + pieAmount);

        emit DecreaseDebt(loan, currencyAmount);
    }

    // returns the current debt based on actual block.timestamp (now)
    function debt(uint256 loan) external view returns (uint256) {
        uint256 rate_ = loanRates[loan];
        uint256 chi_ = rates[rate_].chi;
        if (block.timestamp >= rates[rate_].lastUpdated) {
            chi_ = chargeInterest(
                rates[rate_].chi,
                rates[rate_].ratePerSecond,
                rates[rate_].lastUpdated
            );
        }
        return toAmount(chi_, pie[loan]);
    }

    // returns the total debt of a interest rate group
    function rateDebt(uint256 rate) external view returns (uint256) {
        uint256 chi_ = rates[rate].chi;
        uint256 pie_ = rates[rate].pie;

        if (block.timestamp >= rates[rate].lastUpdated) {
            chi_ = chargeInterest(
                rates[rate].chi,
                rates[rate].ratePerSecond,
                rates[rate].lastUpdated
            );
        }
        return toAmount(chi_, pie_);
    }

    // --- Interest Rate Group Implementation ---

    // set rate loanRates for a loan
    function setRate(uint256 loan, uint256 rate) external auth {
        require(pie[loan] == 0, "non-zero-debt");
        // rate category has to be initiated
        require(rates[rate].chi != 0, "rate-group-not-set");
        loanRates[loan] = rate;
        emit SetRate(loan, rate);
    }

    // change rate loanRates for a loan
    function changeRate(uint256 loan, uint256 newRate) external auth {
        require(rates[newRate].chi != 0, "rate-group-not-set");
        uint256 currentRate = loanRates[loan];
        drip(currentRate);
        drip(newRate);
        uint256 pie_ = pie[loan];
        uint256 debt_ = toAmount(rates[currentRate].chi, pie_);
        rates[currentRate].pie = (rates[currentRate].pie + pie_);
        pie[loan] = toPie(rates[newRate].chi, debt_);
        rates[newRate].pie = (rates[newRate].pie + pie[loan]);
        loanRates[loan] = newRate;
        emit ChangeRate(loan, newRate);
    }

    function newLoan(
        uint256 loan,
        uint256 ratePerSecond,
        uint256 fixedRate
    ) external auth {
        rates[loan].chi = ONE;
        rates[loan].lastUpdated = uint48(block.timestamp);
        rates[loan].ratePerSecond = ratePerSecond;
        rates[loan].fixedRate = fixedRate;
        loanRates[loan] = loan;
    }

    // set/change the interest rate of a rate category
    function file(
        bytes32 what,
        uint256 rate,
        uint256 value
    ) external auth {
        if (what == "rate") {
            require(value != 0, "rate-per-second-can-not-be-0");
            if (rates[rate].chi == 0) {
                rates[rate].chi = ONE;
                rates[rate].lastUpdated = uint48(block.timestamp);
            } else {
                drip(rate);
            }
            rates[rate].ratePerSecond = value;
        } else if (what == "fixedRate") {
            rates[rate].fixedRate = value;
        } else revert("unknown parameter");

        emit File(what, rate, value);
    }

    // accrue needs to be called before any debt amounts are modified by an external component
    function accrue(uint256 loan) external {
        drip(loanRates[loan]);
    }

    // drip updates the chi of the rate category by compounding the interest and
    // updates the total debt
    function drip(uint256 rate) public {
        if (block.timestamp >= rates[rate].lastUpdated) {
            (uint256 chi, ) = compounding(
                rates[rate].chi,
                rates[rate].ratePerSecond,
                rates[rate].lastUpdated,
                rates[rate].pie
            );
            rates[rate].chi = chi;
            rates[rate].lastUpdated = uint48(block.timestamp);
        }
    }
}


// File @1754-factory/tinlake/src/root.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

interface AuthLike {
    function rely(address) external;

    function deny(address) external;
}

interface DependLike {
    function depend(bytes32, address) external;
}

interface BorrowerDeployerLike {
    function feed() external returns (address);

    function shelf() external returns (address);

    function title() external returns (address);
}

interface LenderDeployerLike {
    function assessor() external returns (address);

    function reserve() external returns (address);

    function poolAdmin() external returns (address);
}

interface AdapterDeployerLike {
    function mgr() external returns (address);

    function wireAdapter() external;
}

interface PoolAdminLike {
    function setAdminLevel(address, uint256) external;
}

contract TinlakeRoot is Auth {
    BorrowerDeployerLike public borrowerDeployer;
    LenderDeployerLike public lenderDeployer;
    AdapterDeployerLike public adapterDeployer;

    bool public deployed;
    address public deployUsr;
    address public immutable governance;

    address public oracle;
    address[] public level1Admins;
    address public level3Admin;

    constructor(address deployUsr_, address governance_) {
        deployUsr = deployUsr_;
        governance = governance_;
        wards[governance_] = 1;
        emit Rely(governance_);
    }

    // --- Prepare ---
    // Sets the two deployer dependencies. This needs to be called by the deployUsr
    function prepare(
        address lender_,
        address borrower_,
        address adapter_,
        address oracle_,
        address[] memory level1Admins_,
        address level3Admin_
    ) public {
        require(deployUsr == msg.sender);

        borrowerDeployer = BorrowerDeployerLike(borrower_);
        lenderDeployer = LenderDeployerLike(lender_);
        if (adapter_ != address(0))
            adapterDeployer = AdapterDeployerLike(adapter_);
        oracle = oracle_;
        level1Admins = level1Admins_;
        level3Admin = level3Admin_;

        deployUsr = address(0); // disallow the deploy user to call this more than once.
    }

    function prepare(
        address lender_,
        address borrower_,
        address adapter_
    ) public {
        prepare(
            lender_,
            borrower_,
            adapter_,
            address(0),
            new address[](0),
            address(0)
        );
    }

    function prepare(address lender_, address borrower_) public {
        prepare(
            lender_,
            borrower_,
            address(0),
            address(0),
            new address[](0),
            address(0)
        );
    }

    // --- Deploy ---
    // After going through the deploy process on the lender and borrower method, this method is called to connect
    // lender and borrower contracts.
    function deploy() public {
        require(
            address(borrowerDeployer) != address(0) &&
                address(lenderDeployer) != address(0) &&
                deployed == false
        );
        deployed = true;
        address reserve_ = lenderDeployer.reserve();
        address shelf_ = borrowerDeployer.shelf();
        address assessor_ = lenderDeployer.assessor();

        // Borrower depends
        DependLike(borrowerDeployer.shelf()).depend("reserve", reserve_);
        DependLike(borrowerDeployer.shelf()).depend("assessor", assessor_);

        // Lender depends
        address navFeed = borrowerDeployer.feed();

        // shelf can deposit and payout from reserve
        AuthLike(reserve_).rely(shelf_);
        DependLike(assessor_).depend("navFeed", navFeed);

        // Lender wards
        if (oracle != address(0)) AuthLike(navFeed).rely(oracle);

        DependLike(lenderDeployer.poolAdmin()).depend("navFeed", navFeed);
        AuthLike(navFeed).rely(lenderDeployer.poolAdmin());

        PoolAdminLike poolAdmin = PoolAdminLike(lenderDeployer.poolAdmin());
        poolAdmin.setAdminLevel(governance, 3);
        poolAdmin.setAdminLevel(level3Admin, 3);

        for (uint256 i = 0; i < level1Admins.length; i++) {
            poolAdmin.setAdminLevel(level1Admins[i], 1);
        }
    }

    // --- Governance Functions ---
    // `relyContract` & `denyContract` can be called by any ward on the TinlakeRoot
    // contract to make an arbitrary address a ward on any contract the TinlakeRoot
    // is a ward on.
    function relyContract(address target, address usr) public auth {
        AuthLike(target).rely(usr);
    }

    function denyContract(address target, address usr) public auth {
        AuthLike(target).deny(usr);
    }
}


// File @1754-factory/tinlake/src/lender/fabs/interfaces.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

interface ReserveFabLike {
    function newReserve(address) external returns (address);
}

interface AssessorFabLike {
    function newAssessor() external returns (address);
}

interface TrancheFabLike {
    function newTranche(address, address) external returns (address);
}

interface CoordinatorFabLike {
    function newCoordinator(uint256) external returns (address);
}

interface OperatorFabLike {
    function newOperator(address) external returns (address);
}

interface MemberlistFabLike {
    function newMemberlist() external returns (address);
}

interface RestrictedTokenFabLike {
    function newRestrictedToken(string calldata, string calldata)
        external
        returns (address);
}

interface PoolAdminFabLike {
    function newPoolAdmin() external returns (address);
}

interface ClerkFabLike {
    function newClerk(address, address) external returns (address);
}

interface TinlakeManagerFabLike {
    function newTinlakeManager(
        address,
        address,
        address,
        address,
        address,
        address,
        address,
        address
    ) external returns (address);
}


// File @1754-factory/tinlake/src/fixed_point.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

abstract contract FixedPoint {
    struct Fixed27 {
        uint256 value;
    }
}


// File @1754-factory/tinlake/src/lender/deployer.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

interface DependLike {
    function depend(bytes32, address) external;
}

interface AuthLike {
    function rely(address) external;

    function deny(address) external;
}

interface MemberlistLike {
    function updateMember(address, uint256) external;
}

interface FileLike {
    function file(bytes32 name, uint256 value) external;
}

interface PoolAdminLike {
    function rely(address) external;
}

contract LenderDeployer is FixedPoint {
    address public immutable root;
    address public immutable currency;
    address public immutable memberAdmin;

    // factory contracts
    TrancheFabLike public immutable trancheFab;
    ReserveFabLike public immutable reserveFab;
    AssessorFabLike public immutable assessorFab;
    CoordinatorFabLike public immutable coordinatorFab;
    OperatorFabLike public immutable operatorFab;
    MemberlistFabLike public immutable memberlistFab;
    RestrictedTokenFabLike public immutable restrictedTokenFab;
    PoolAdminFabLike public immutable poolAdminFab;

    // lender state variables
    Fixed27 public minSeniorRatio;
    Fixed27 public maxSeniorRatio;
    uint256 public maxReserve;
    uint256 public challengeTime;
    Fixed27 public seniorInterestRate;

    // contract addresses
    address public adapterDeployer;
    address public assessor;
    address public poolAdmin;
    address public seniorTranche;
    address public juniorTranche;
    address public seniorOperator;
    address public juniorOperator;
    address public reserve;
    address public coordinator;

    address public seniorToken;
    address public juniorToken;

    // token names
    string public seniorName;
    string public seniorSymbol;
    string public juniorName;
    string public juniorSymbol;
    // restricted token member list
    address public seniorMemberlist;
    address public juniorMemberlist;

    address public deployer;
    bool public wired;

    constructor(
        address root_,
        address currency_,
        address trancheFab_,
        address memberlistFab_,
        address restrictedtokenFab_,
        address reserveFab_,
        address assessorFab_,
        address coordinatorFab_,
        address operatorFab_,
        address poolAdminFab_,
        address memberAdmin_,
        address adapterDeployer_
    ) {
        deployer = msg.sender;
        root = root_;
        currency = currency_;
        memberAdmin = memberAdmin_;
        adapterDeployer = adapterDeployer_;

        trancheFab = TrancheFabLike(trancheFab_);
        memberlistFab = MemberlistFabLike(memberlistFab_);
        restrictedTokenFab = RestrictedTokenFabLike(restrictedtokenFab_);
        reserveFab = ReserveFabLike(reserveFab_);
        assessorFab = AssessorFabLike(assessorFab_);
        poolAdminFab = PoolAdminFabLike(poolAdminFab_);
        coordinatorFab = CoordinatorFabLike(coordinatorFab_);
        operatorFab = OperatorFabLike(operatorFab_);
    }

    function init(
        uint256 minSeniorRatio_,
        uint256 maxSeniorRatio_,
        uint256 maxReserve_,
        uint256 challengeTime_,
        uint256 seniorInterestRate_,
        string memory seniorName_,
        string memory seniorSymbol_,
        string memory juniorName_,
        string memory juniorSymbol_
    ) public {
        require(msg.sender == deployer);
        challengeTime = challengeTime_;
        minSeniorRatio = Fixed27(minSeniorRatio_);
        maxSeniorRatio = Fixed27(maxSeniorRatio_);
        maxReserve = maxReserve_;
        seniorInterestRate = Fixed27(seniorInterestRate_);

        // token names
        seniorName = seniorName_;
        seniorSymbol = seniorSymbol_;
        juniorName = juniorName_;
        juniorSymbol = juniorSymbol_;

        deployer = address(1);
    }

    function deployJunior() public {
        require(juniorTranche == address(0) && deployer == address(1));
        juniorToken = restrictedTokenFab.newRestrictedToken(
            juniorSymbol,
            juniorName
        );
        juniorTranche = trancheFab.newTranche(currency, juniorToken);
        juniorMemberlist = memberlistFab.newMemberlist();
        juniorOperator = operatorFab.newOperator(juniorTranche);
        AuthLike(juniorMemberlist).rely(root);
        AuthLike(juniorToken).rely(root);
        AuthLike(juniorToken).rely(juniorTranche);
        AuthLike(juniorOperator).rely(root);
        AuthLike(juniorTranche).rely(root);
    }

    function deploySenior() public {
        require(seniorTranche == address(0) && deployer == address(1));
        seniorToken = restrictedTokenFab.newRestrictedToken(
            seniorSymbol,
            seniorName
        );
        seniorTranche = trancheFab.newTranche(currency, seniorToken);
        seniorMemberlist = memberlistFab.newMemberlist();
        seniorOperator = operatorFab.newOperator(seniorTranche);
        AuthLike(seniorMemberlist).rely(root);
        AuthLike(seniorToken).rely(root);
        AuthLike(seniorToken).rely(seniorTranche);
        AuthLike(seniorOperator).rely(root);
        AuthLike(seniorTranche).rely(root);

        if (adapterDeployer != address(0)) {
            AuthLike(seniorTranche).rely(adapterDeployer);
            AuthLike(seniorMemberlist).rely(adapterDeployer);
        }
    }

    function deployReserve() public {
        require(reserve == address(0) && deployer == address(1));
        reserve = reserveFab.newReserve(currency);
        AuthLike(reserve).rely(root);
        if (adapterDeployer != address(0))
            AuthLike(reserve).rely(adapterDeployer);
    }

    function deployAssessor() public {
        require(assessor == address(0) && deployer == address(1));
        assessor = assessorFab.newAssessor();
        AuthLike(assessor).rely(root);
        if (adapterDeployer != address(0))
            AuthLike(assessor).rely(adapterDeployer);
    }

    function deployPoolAdmin() public {
        require(poolAdmin == address(0) && deployer == address(1));
        poolAdmin = poolAdminFab.newPoolAdmin();
        PoolAdminLike(poolAdmin).rely(root);
        if (adapterDeployer != address(0))
            PoolAdminLike(poolAdmin).rely(adapterDeployer);
    }

    function deployCoordinator() public {
        require(coordinator == address(0) && deployer == address(1));
        coordinator = coordinatorFab.newCoordinator(challengeTime);
        AuthLike(coordinator).rely(root);
    }

    function deploy() public virtual {
        require(
            coordinator != address(0) &&
                assessor != address(0) &&
                reserve != address(0) &&
                seniorTranche != address(0)
        );

        require(!wired, "lender contracts already wired"); // make sure lender contracts only wired once
        wired = true;

        // required depends
        // reserve
        AuthLike(reserve).rely(seniorTranche);
        AuthLike(reserve).rely(juniorTranche);
        AuthLike(reserve).rely(coordinator);
        AuthLike(reserve).rely(assessor);

        // tranches
        DependLike(seniorTranche).depend("reserve", reserve);
        DependLike(juniorTranche).depend("reserve", reserve);
        AuthLike(seniorTranche).rely(coordinator);
        AuthLike(juniorTranche).rely(coordinator);
        AuthLike(seniorTranche).rely(seniorOperator);
        AuthLike(juniorTranche).rely(juniorOperator);

        // coordinator implements epoch ticker interface
        DependLike(seniorTranche).depend("coordinator", coordinator);
        DependLike(juniorTranche).depend("coordinator", coordinator);

        //restricted token
        DependLike(seniorToken).depend("memberlist", seniorMemberlist);
        DependLike(juniorToken).depend("memberlist", juniorMemberlist);

        //allow tinlake contracts to hold drop/tin tokens
        MemberlistLike(juniorMemberlist).updateMember(
            juniorTranche,
            type(uint256).max
        );
        MemberlistLike(seniorMemberlist).updateMember(
            seniorTranche,
            type(uint256).max
        );

        // operator
        DependLike(seniorOperator).depend("tranche", seniorTranche);
        DependLike(juniorOperator).depend("tranche", juniorTranche);
        DependLike(seniorOperator).depend("token", seniorToken);
        DependLike(juniorOperator).depend("token", juniorToken);

        // coordinator
        DependLike(coordinator).depend("seniorTranche", seniorTranche);
        DependLike(coordinator).depend("juniorTranche", juniorTranche);
        DependLike(coordinator).depend("assessor", assessor);

        AuthLike(coordinator).rely(poolAdmin);

        // assessor
        DependLike(assessor).depend("seniorTranche", seniorTranche);
        DependLike(assessor).depend("juniorTranche", juniorTranche);
        DependLike(assessor).depend("reserve", reserve);

        AuthLike(assessor).rely(coordinator);
        AuthLike(assessor).rely(reserve);
        AuthLike(assessor).rely(poolAdmin);

        // poolAdmin
        DependLike(poolAdmin).depend("assessor", assessor);
        DependLike(poolAdmin).depend("juniorMemberlist", juniorMemberlist);
        DependLike(poolAdmin).depend("seniorMemberlist", seniorMemberlist);
        DependLike(poolAdmin).depend("coordinator", coordinator);

        AuthLike(juniorMemberlist).rely(poolAdmin);
        AuthLike(seniorMemberlist).rely(poolAdmin);

        if (memberAdmin != address(0))
            AuthLike(juniorMemberlist).rely(memberAdmin);
        if (memberAdmin != address(0))
            AuthLike(seniorMemberlist).rely(memberAdmin);

        FileLike(assessor).file("seniorInterestRate", seniorInterestRate.value);
        FileLike(assessor).file("maxReserve", maxReserve);
        FileLike(assessor).file("maxSeniorRatio", maxSeniorRatio.value);
        FileLike(assessor).file("minSeniorRatio", minSeniorRatio.value);
    }
}


// File @1754-factory/tinlake/src/borrower/fabs/interfaces.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

interface NAVFeedFabLike {
    function newFeed() external returns (address);
}

interface TitleFabLike {
    function newTitle(string calldata, string calldata)
        external
        returns (address);
}

interface PileFabLike {
    function newPile() external returns (address);
}

interface ShelfFabLike {
    function newShelf(
        address,
        address,
        address,
        address
    ) external returns (address);
}


// File @1754-factory/tinlake/src/borrower/deployer.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;


interface DependLike {
    function depend(bytes32, address) external;
}

interface AuthLike {
    function rely(address) external;

    function deny(address) external;
}

interface NAVFeedLike {
    function init() external;
}

interface FeedFabLike {
    function newFeed() external returns (address);
}

interface FileLike {
    function file(bytes32 name, uint256 value) external;
}

contract BorrowerDeployer is FixedPoint {
    address public immutable root;

    TitleFabLike public immutable titlefab;
    ShelfFabLike public immutable shelffab;
    PileFabLike public immutable pilefab;
    FeedFabLike public immutable feedFab;

    address public title;
    address public shelf;
    address public pile;
    address public immutable currency;
    address public feed;

    string public titleName;
    string public titleSymbol;
    Fixed27 public discountRate;

    address constant ZERO = address(0);
    bool public wired;

    constructor(
        address root_,
        address titlefab_,
        address shelffab_,
        address pilefab_,
        address feedFab_,
        address currency_,
        string memory titleName_,
        string memory titleSymbol_,
        uint256 discountRate_
    ) {
        root = root_;

        titlefab = TitleFabLike(titlefab_);
        shelffab = ShelfFabLike(shelffab_);

        pilefab = PileFabLike(pilefab_);
        feedFab = FeedFabLike(feedFab_);

        currency = currency_;

        titleName = titleName_;
        titleSymbol = titleSymbol_;
        discountRate = Fixed27(discountRate_);
    }

    function deployPile() public {
        require(pile == ZERO);
        pile = pilefab.newPile();
        AuthLike(pile).rely(root);
    }

    function deployTitle() public {
        require(title == ZERO);
        title = titlefab.newTitle(titleName, titleSymbol);
        AuthLike(title).rely(root);
    }

    function deployShelf() public {
        require(shelf == ZERO && title != ZERO && pile != ZERO && feed != ZERO);
        shelf = shelffab.newShelf(
            currency,
            address(title),
            address(pile),
            address(feed)
        );
        AuthLike(shelf).rely(root);
    }

    function deployFeed() public {
        require(feed == ZERO);
        feed = feedFab.newFeed();
        AuthLike(feed).rely(root);
    }

    function deploy(bool initNAVFeed) public {
        // ensures all required deploy methods were called
        require(shelf != ZERO);
        require(!wired, "borrower contracts already wired"); // make sure borrower contracts only wired once
        wired = true;

        // shelf allowed to call
        AuthLike(pile).rely(shelf);

        DependLike(feed).depend("shelf", address(shelf));
        DependLike(feed).depend("pile", address(pile));

        // allow nftFeed to update rate groups
        AuthLike(pile).rely(feed);

        DependLike(shelf).depend("subscriber", address(feed));

        AuthLike(feed).rely(shelf);
        AuthLike(title).rely(shelf);

        FileLike(feed).file("discountRate", discountRate.value);

        if (initNAVFeed) {
            NAVFeedLike(feed).init();
        }
    }

    function deploy() public {
        deploy(false);
    }
}


// File @1754-factory/tinlake/src/lender/tranche.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;



interface ERC20Like {
    function balanceOf(address) external view returns (uint256);

    function transferFrom(
        address,
        address,
        uint256
    ) external returns (bool);

    function transfer(address to, uint256 amount) external returns (bool);

    function mint(address, uint256) external;

    function burn(address, uint256) external;

    function totalSupply() external view returns (uint256);

    function approve(address usr, uint256 amount) external;
}

interface ReserveLike {
    function deposit(uint256 amount) external;

    function payout(uint256 amount) external;

    function totalBalanceAvailable() external returns (uint256);
}

interface CoordinatorLike {
    function currentEpoch() external view returns (uint256);

    function lastEpochExecuted() external view returns (uint256);
}

contract Tranche is Math, Auth, FixedPoint {
    mapping(uint256 => Epoch) public epochs;

    struct Epoch {
        // denominated in 10^27
        // percentage ONE == 100%
        uint256 redeemFulfillment;
        // denominated in 10^27
        // percentage ONE == 100%
        uint256 supplyFulfillment;
        // tokenPrice after end of epoch
        uint256 tokenPrice;
    }

    struct UserOrder {
        uint256 orderedInEpoch;
        uint256 supplyCurrencyAmount;
        uint256 redeemTokenAmount;
    }

    mapping(address => UserOrder) public users;

    uint256 public totalSupply;
    uint256 public totalRedeem;

    ERC20Like public currency;
    ERC20Like public token;
    ReserveLike public reserve;
    CoordinatorLike public coordinator;

    // additional requested currency if the reserve could not fulfill a tranche request
    uint256 public requestedCurrency;

    bool public waitingForUpdate = false;

    event Depend(bytes32 indexed contractName, address addr);
    event Mint(address indexed usr, uint256 amount);
    event Burn(address indexed usr, uint256 amount);
    event AuthTransfer(address indexed erc20, address usr, uint256 amount);

    modifier orderAllowed(address usr) {
        require(
            (users[usr].supplyCurrencyAmount == 0 &&
                users[usr].redeemTokenAmount == 0) ||
                users[usr].orderedInEpoch == coordinator.currentEpoch(),
            "disburse required"
        );
        _;
    }

    constructor(address currency_, address token_) {
        token = ERC20Like(token_);
        currency = ERC20Like(currency_);
        wards[msg.sender] = 1;
        emit Rely(msg.sender);
    }

    function balance() external view returns (uint256) {
        return currency.balanceOf(address(this));
    }

    function tokenSupply() external view returns (uint256) {
        return token.totalSupply();
    }

    function depend(bytes32 contractName, address addr) public auth {
        if (contractName == "token") {
            token = ERC20Like(addr);
        } else if (contractName == "currency") {
            currency = ERC20Like(addr);
        } else if (contractName == "reserve") {
            reserve = ReserveLike(addr);
        } else if (contractName == "coordinator") {
            coordinator = CoordinatorLike(addr);
        } else revert();
        emit Depend(contractName, addr);
    }

    // supplyOrder function can be used to place or revoke an supply
    function supplyOrder(address usr, uint256 newSupplyAmount)
        public
        auth
        orderAllowed(usr)
    {
        users[usr].orderedInEpoch = coordinator.currentEpoch();

        uint256 currentSupplyAmount = users[usr].supplyCurrencyAmount;

        users[usr].supplyCurrencyAmount = newSupplyAmount;

        totalSupply = safeAdd(
            safeTotalSub(totalSupply, currentSupplyAmount),
            newSupplyAmount
        );

        uint256 delta;
        if (newSupplyAmount > currentSupplyAmount) {
            delta = safeSub(newSupplyAmount, currentSupplyAmount);
            require(
                currency.transferFrom(usr, address(this), delta),
                "currency-transfer-failed"
            );
            return;
        }
        delta = safeSub(currentSupplyAmount, newSupplyAmount);
        if (delta > 0) {
            _safeTransfer(currency, usr, delta);
        }
    }

    // redeemOrder function can be used to place or revoke a redeem
    function redeemOrder(address usr, uint256 newRedeemAmount)
        public
        auth
        orderAllowed(usr)
    {
        users[usr].orderedInEpoch = coordinator.currentEpoch();

        uint256 currentRedeemAmount = users[usr].redeemTokenAmount;
        users[usr].redeemTokenAmount = newRedeemAmount;
        totalRedeem = safeAdd(
            safeTotalSub(totalRedeem, currentRedeemAmount),
            newRedeemAmount
        );

        uint256 delta;
        if (newRedeemAmount > currentRedeemAmount) {
            delta = safeSub(newRedeemAmount, currentRedeemAmount);
            require(
                token.transferFrom(usr, address(this), delta),
                "token-transfer-failed"
            );
            return;
        }

        delta = safeSub(currentRedeemAmount, newRedeemAmount);
        if (delta > 0) {
            _safeTransfer(token, usr, delta);
        }
    }

    function calcDisburse(address usr)
        public
        view
        returns (
            uint256 payoutCurrencyAmount,
            uint256 payoutTokenAmount,
            uint256 remainingSupplyCurrency,
            uint256 remainingRedeemToken
        )
    {
        return calcDisburse(usr, coordinator.lastEpochExecuted());
    }

    //  calculates the current disburse of a user starting from the ordered epoch until endEpoch
    function calcDisburse(address usr, uint256 endEpoch)
        public
        view
        returns (
            uint256 payoutCurrencyAmount,
            uint256 payoutTokenAmount,
            uint256 remainingSupplyCurrency,
            uint256 remainingRedeemToken
        )
    {
        uint256 epochIdx = users[usr].orderedInEpoch;
        uint256 lastEpochExecuted = coordinator.lastEpochExecuted();

        // no disburse possible in this epoch
        if (users[usr].orderedInEpoch == coordinator.currentEpoch()) {
            return (
                payoutCurrencyAmount,
                payoutTokenAmount,
                users[usr].supplyCurrencyAmount,
                users[usr].redeemTokenAmount
            );
        }

        if (endEpoch > lastEpochExecuted) {
            // it is only possible to disburse epochs which are already over
            endEpoch = lastEpochExecuted;
        }

        remainingSupplyCurrency = users[usr].supplyCurrencyAmount;
        remainingRedeemToken = users[usr].redeemTokenAmount;
        uint256 amount = 0;

        // calculates disburse amounts as long as remaining tokens or currency is left or the end epoch is reached
        while (
            epochIdx <= endEpoch &&
            (remainingSupplyCurrency != 0 || remainingRedeemToken != 0)
        ) {
            if (remainingSupplyCurrency != 0) {
                amount = rmul(
                    remainingSupplyCurrency,
                    epochs[epochIdx].supplyFulfillment
                );
                // supply currency payout in token
                if (amount != 0) {
                    payoutTokenAmount = safeAdd(
                        payoutTokenAmount,
                        safeDiv(
                            safeMul(amount, ONE),
                            epochs[epochIdx].tokenPrice
                        )
                    );
                    remainingSupplyCurrency = safeSub(
                        remainingSupplyCurrency,
                        amount
                    );
                }
            }

            if (remainingRedeemToken != 0) {
                amount = rmul(
                    remainingRedeemToken,
                    epochs[epochIdx].redeemFulfillment
                );
                // redeem token payout in currency
                if (amount != 0) {
                    payoutCurrencyAmount = safeAdd(
                        payoutCurrencyAmount,
                        rmul(amount, epochs[epochIdx].tokenPrice)
                    );
                    remainingRedeemToken = safeSub(
                        remainingRedeemToken,
                        amount
                    );
                }
            }
            epochIdx = safeAdd(epochIdx, 1);
        }

        return (
            payoutCurrencyAmount,
            payoutTokenAmount,
            remainingSupplyCurrency,
            remainingRedeemToken
        );
    }

    // the disburse function can be used after an epoch is over to receive currency and tokens
    function disburse(address usr)
        public
        auth
        returns (
            uint256 payoutCurrencyAmount,
            uint256 payoutTokenAmount,
            uint256 remainingSupplyCurrency,
            uint256 remainingRedeemToken
        )
    {
        return disburse(usr, coordinator.lastEpochExecuted());
    }

    function _safeTransfer(
        ERC20Like erc20,
        address usr,
        uint256 amount
    ) internal returns (uint256) {
        uint256 max = erc20.balanceOf(address(this));
        if (amount > max) {
            amount = max;
        }
        require(erc20.transfer(usr, amount), "token-transfer-failed");
        return amount;
    }

    // the disburse function can be used after an epoch is over to receive currency and tokens
    function disburse(address usr, uint256 endEpoch)
        public
        auth
        returns (
            uint256 payoutCurrencyAmount,
            uint256 payoutTokenAmount,
            uint256 remainingSupplyCurrency,
            uint256 remainingRedeemToken
        )
    {
        require(
            users[usr].orderedInEpoch <= coordinator.lastEpochExecuted(),
            "epoch-not-executed-yet"
        );

        uint256 lastEpochExecuted = coordinator.lastEpochExecuted();

        if (endEpoch > lastEpochExecuted) {
            // it is only possible to disburse epochs which are already over
            endEpoch = lastEpochExecuted;
        }

        (
            payoutCurrencyAmount,
            payoutTokenAmount,
            remainingSupplyCurrency,
            remainingRedeemToken
        ) = calcDisburse(usr, endEpoch);
        users[usr].supplyCurrencyAmount = remainingSupplyCurrency;
        users[usr].redeemTokenAmount = remainingRedeemToken;
        // if lastEpochExecuted is disbursed, orderInEpoch is at the current epoch again
        // which allows to change the order. This is only possible if all previous epochs are disbursed
        users[usr].orderedInEpoch = safeAdd(endEpoch, 1);

        if (payoutCurrencyAmount > 0) {
            payoutCurrencyAmount = _safeTransfer(
                currency,
                usr,
                payoutCurrencyAmount
            );
        }

        if (payoutTokenAmount > 0) {
            payoutTokenAmount = _safeTransfer(token, usr, payoutTokenAmount);
        }
        return (
            payoutCurrencyAmount,
            payoutTokenAmount,
            remainingSupplyCurrency,
            remainingRedeemToken
        );
    }

    // called by epoch coordinator in epoch execute method
    function epochUpdate(
        uint256 epochID,
        uint256 supplyFulfillment_,
        uint256 redeemFulfillment_,
        uint256 tokenPrice_,
        uint256 epochSupplyOrderCurrency,
        uint256 epochRedeemOrderCurrency
    ) public auth {
        require(waitingForUpdate == true);
        waitingForUpdate = false;

        epochs[epochID].supplyFulfillment = supplyFulfillment_;
        epochs[epochID].redeemFulfillment = redeemFulfillment_;
        epochs[epochID].tokenPrice = tokenPrice_;

        // currency needs to be converted to tokenAmount with current token price
        uint256 redeemInToken = 0;
        uint256 supplyInToken = 0;
        if (tokenPrice_ > 0) {
            supplyInToken = rdiv(epochSupplyOrderCurrency, tokenPrice_);
            redeemInToken = safeDiv(
                safeMul(epochRedeemOrderCurrency, ONE),
                tokenPrice_
            );
        }

        // calculates the delta between supply and redeem for currency and deposit or get them from the reserve
        adjustCurrencyBalance(
            epochID,
            epochSupplyOrderCurrency,
            epochRedeemOrderCurrency
        );
        // calculates the delta between supply and redeem for tokens and burn or mint them
        adjustTokenBalance(epochID, supplyInToken, redeemInToken);

        // the unfulfilled orders (1-fulfillment) is automatically ordered
        totalSupply = safeAdd(
            safeTotalSub(totalSupply, epochSupplyOrderCurrency),
            rmul(
                epochSupplyOrderCurrency,
                safeSub(ONE, epochs[epochID].supplyFulfillment)
            )
        );
        totalRedeem = safeAdd(
            safeTotalSub(totalRedeem, redeemInToken),
            rmul(redeemInToken, safeSub(ONE, epochs[epochID].redeemFulfillment))
        );
    }

    function closeEpoch()
        public
        auth
        returns (uint256 totalSupplyCurrency_, uint256 totalRedeemToken_)
    {
        require(waitingForUpdate == false);
        waitingForUpdate = true;
        return (totalSupply, totalRedeem);
    }

    function safeBurn(uint256 tokenAmount) internal {
        uint256 max = token.balanceOf(address(this));
        if (tokenAmount > max) {
            tokenAmount = max;
        }
        token.burn(address(this), tokenAmount);
        emit Burn(address(this), tokenAmount);
    }

    function safePayout(uint256 currencyAmount)
        internal
        returns (uint256 payoutAmount)
    {
        uint256 max = reserve.totalBalanceAvailable();

        if (currencyAmount > max) {
            // currently reserve can't fulfill the entire request
            currencyAmount = max;
        }
        reserve.payout(currencyAmount);
        return currencyAmount;
    }

    function payoutRequestedCurrency() public {
        if (requestedCurrency > 0) {
            uint256 payoutAmount = safePayout(requestedCurrency);
            requestedCurrency = safeSub(requestedCurrency, payoutAmount);
        }
    }

    // adjust token balance after epoch execution -> min/burn tokens
    function adjustTokenBalance(
        uint256 epochID,
        uint256 epochSupplyToken,
        uint256 epochRedeemToken
    ) internal {
        // mint token amount for supply

        uint256 mintAmount = 0;
        if (epochs[epochID].tokenPrice > 0) {
            mintAmount = rmul(
                epochSupplyToken,
                epochs[epochID].supplyFulfillment
            );
        }

        // burn token amount for redeem
        uint256 burnAmount = rmul(
            epochRedeemToken,
            epochs[epochID].redeemFulfillment
        );
        // burn tokens that are not needed for disbursement
        uint256 diff;
        if (burnAmount > mintAmount) {
            diff = safeSub(burnAmount, mintAmount);
            safeBurn(diff);
            return;
        }
        // mint tokens that are required for disbursement
        diff = safeSub(mintAmount, burnAmount);
        if (diff > 0) {
            token.mint(address(this), diff);
        }
    }

    // additional minting of tokens produces a dilution of all token holders
    // interface is required for adapters
    function mint(address usr, uint256 amount) public auth {
        token.mint(usr, amount);
        emit Mint(usr, amount);
    }

    // adjust currency balance after epoch execution -> receive/send currency from/to reserve
    function adjustCurrencyBalance(
        uint256 epochID,
        uint256 epochSupply,
        uint256 epochRedeem
    ) internal {
        // currency that was supplied in this epoch
        uint256 currencySupplied = rmul(
            epochSupply,
            epochs[epochID].supplyFulfillment
        );
        // currency required for redemption
        uint256 currencyRequired = rmul(
            epochRedeem,
            epochs[epochID].redeemFulfillment
        );

        uint256 diff;
        if (currencySupplied > currencyRequired) {
            // send surplus currency to reserve
            diff = safeSub(currencySupplied, currencyRequired);
            currency.approve(address(reserve), diff);
            reserve.deposit(diff);
            return;
        }
        diff = safeSub(currencyRequired, currencySupplied);
        if (diff > 0) {
            // get missing currency from reserve
            uint256 payoutAmount = safePayout(diff);
            if (payoutAmount < diff) {
                // reserve couldn't fulfill the entire request
                requestedCurrency = safeAdd(
                    requestedCurrency,
                    safeSub(diff, payoutAmount)
                );
            }
        }
    }

    // recovery transfer can be used by governance to recover funds if tokens are stuck
    function authTransfer(
        address erc20,
        address usr,
        uint256 amount
    ) public auth {
        ERC20Like(erc20).transfer(usr, amount);
        emit AuthTransfer(erc20, usr, amount);
    }

    // due to rounding in token & currency conversions currency & token balances might be off by 1 wei with the totalSupply/totalRedeem amounts.
    // in order to prevent an underflow error, 0 is returned when amount to be subtracted is bigger then the total value.
    function safeTotalSub(uint256 total, uint256 amount)
        internal
        pure
        returns (uint256)
    {
        if (total < amount) {
            return 0;
        }
        return safeSub(total, amount);
    }
}


// File @1754-factory/tinlake/src/lender/fabs/tranche.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

interface TrancheFabLike {
    function newTranche(address, address) external returns (address);
}

contract TrancheFab {
    function newTranche(address currency, address restrictedToken)
        public
        returns (address token)
    {
        Tranche tranche = new Tranche(currency, restrictedToken);

        tranche.rely(msg.sender);
        tranche.deny(address(this));

        return (address(tranche));
    }
}


// File @1754-factory/tinlake/src/lender/token/memberlist.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;


contract Memberlist is Math, Auth {
    uint256 constant minimumDelay = 7 days;

    // -- Members--
    mapping(address => uint256) public members;

    function updateMember(address usr, uint256 validUntil) public auth {
        require((safeAdd(block.timestamp, minimumDelay)) < validUntil);
        members[usr] = validUntil;
    }

    function updateMembers(address[] memory users, uint256 validUntil)
        public
        auth
    {
        for (uint256 i = 0; i < users.length; i++) {
            updateMember(users[i], validUntil);
        }
    }

    constructor() {
        wards[msg.sender] = 1;
    }

    function member(address usr) public view {
        require((members[usr] >= block.timestamp), "not-allowed-to-hold-token");
    }

    function hasMember(address usr) public view returns (bool) {
        if (members[usr] >= block.timestamp) {
            return true;
        }
        return false;
    }
}


// File @1754-factory/tinlake/src/lender/fabs/memberlist.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

interface MemberlistFabLike {
    function newMemberlist() external returns (address);
}

contract MemberlistFab {
    function newMemberlist() public returns (address memberList) {
        Memberlist memberlist = new Memberlist();

        memberlist.rely(msg.sender);
        memberlist.deny(address(this));

        return (address(memberlist));
    }
}


// File @1754-factory/tinlake/src/lender/reserve.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;


interface ERC20Like {
    function balanceOf(address) external view returns (uint256);

    function transferFrom(
        address,
        address,
        uint256
    ) external returns (bool);

    function mint(address, uint256) external;

    function burn(address, uint256) external;

    function totalSupply() external view returns (uint256);

    function approve(address, uint256) external;
}

interface LendingAdapter {
    function remainingCredit() external view returns (uint256);

    function draw(uint256 amount) external;

    function wipe(uint256 amount) external;

    function debt() external returns (uint256);

    function activated() external view returns (bool);
}

// The reserve keeps track of the currency and the bookkeeping
// of the total balance
contract Reserve is Math, Auth {
    ERC20Like public currency;

    // additional currency from lending adapters
    // for deactivating set to address(0)
    LendingAdapter public lending;

    // currency available for borrowing new loans
    uint256 public currencyAvailable;

    // address or contract which holds the currency
    // by default it is address(this)
    address pot;

    // total currency in the reserve
    uint256 public balance_;

    event File(bytes32 indexed what, uint256 amount);
    event Depend(bytes32 contractName, address addr);

    constructor(address currency_) {
        currency = ERC20Like(currency_);
        pot = address(this);
        currency.approve(pot, type(uint256).max);
        wards[msg.sender] = 1;
        emit Rely(msg.sender);
    }

    function file(bytes32 what, uint256 amount) public auth {
        if (what == "currencyAvailable") {
            currencyAvailable = amount;
        } else revert();
        emit File(what, amount);
    }

    function depend(bytes32 contractName, address addr) public auth {
        if (contractName == "currency") {
            currency = ERC20Like(addr);
            if (pot == address(this)) {
                currency.approve(pot, type(uint256).max);
            }
        } else if (contractName == "pot") {
            pot = addr;
        } else if (contractName == "lending") {
            lending = LendingAdapter(addr);
        } else revert();
        emit Depend(contractName, addr);
    }

    // returns the amount of currency currently in the reserve
    function totalBalance() public view returns (uint256) {
        return balance_;
    }

    // return the amount of currency and the available currency from the lending adapter
    function totalBalanceAvailable() public view returns (uint256) {
        if (address(lending) == address(0)) {
            return balance_;
        }

        return safeAdd(balance_, lending.remainingCredit());
    }

    // deposits currency in the the reserve
    function deposit(uint256 currencyAmount) public auth {
        if (currencyAmount == 0) return;
        _deposit(msg.sender, currencyAmount);
    }

    // hard deposit guarantees that the currency stays in the reserve
    function hardDeposit(uint256 currencyAmount) public auth {
        _depositAction(msg.sender, currencyAmount);
    }

    function _depositAction(address usr, uint256 currencyAmount) internal {
        require(
            currency.transferFrom(usr, pot, currencyAmount),
            "reserve-deposit-failed"
        );
        balance_ = safeAdd(balance_, currencyAmount);
    }

    function _deposit(address usr, uint256 currencyAmount) internal {
        _depositAction(usr, currencyAmount);
        if (
            address(lending) != address(0) &&
            lending.debt() > 0 &&
            lending.activated()
        ) {
            uint256 wipeAmount = lending.debt();
            uint256 available = balance_;
            if (available < wipeAmount) {
                wipeAmount = available;
            }
            lending.wipe(wipeAmount);
        }
    }

    // remove currency from the reserve
    function payout(uint256 currencyAmount) public auth {
        if (currencyAmount == 0) return;
        _payout(msg.sender, currencyAmount);
    }

    function _payoutAction(address usr, uint256 currencyAmount) internal {
        require(
            currency.transferFrom(pot, usr, currencyAmount),
            "reserve-payout-failed"
        );
        balance_ = safeSub(balance_, currencyAmount);
    }

    // hard payout guarantees that the currency stays in the reserve
    function hardPayout(uint256 currencyAmount) public auth {
        _payoutAction(msg.sender, currencyAmount);
    }

    function _payout(address usr, uint256 currencyAmount) internal {
        uint256 reserveBalance = balance_;
        if (
            currencyAmount > reserveBalance &&
            address(lending) != address(0) &&
            lending.activated()
        ) {
            uint256 drawAmount = safeSub(currencyAmount, reserveBalance);
            uint256 left = lending.remainingCredit();
            if (drawAmount > left) {
                drawAmount = left;
            }

            lending.draw(drawAmount);
        }

        _payoutAction(usr, currencyAmount);
    }

    // payout currency for loans not all funds
    // in the reserve are compulsory available for loans in the current epoch
    function payoutForLoans(uint256 currencyAmount) public auth {
        require(
            currencyAvailable >= currencyAmount,
            "not-enough-currency-reserve"
        );

        currencyAvailable = safeSub(currencyAvailable, currencyAmount);
        _payout(msg.sender, currencyAmount);
    }
}


// File @1754-factory/tinlake/src/lender/fabs/reserve.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

interface ReserveFabLike {
    function newReserve(address) external returns (address);
}

contract ReserveFab {
    function newReserve(address currency) public returns (address) {
        Reserve reserve = new Reserve(currency);
        reserve.rely(msg.sender);
        reserve.deny(address(this));
        return address(reserve);
    }
}


// File @1754-factory/tinlake/src/lender/definitions.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;


// contract without a state which defines the relevant formulars for the assessor
contract Definitions is FixedPoint, Math {
    function calcExpectedSeniorAsset(
        uint256 _seniorDebt,
        uint256 _seniorBalance
    ) public pure returns (uint256) {
        return safeAdd(_seniorDebt, _seniorBalance);
    }

    // calculates the senior ratio
    function calcSeniorRatio(
        uint256 seniorAsset,
        uint256 nav,
        uint256 reserve_
    ) public pure returns (uint256) {
        // note: NAV + reserve == seniorAsset + juniorAsset (loop invariant: always true)
        // if expectedSeniorAsset is passed ratio can be greater than ONE
        uint256 assets = calcAssets(nav, reserve_);
        if (assets == 0) {
            return 0;
        }

        return rdiv(seniorAsset, assets);
    }

    function calcSeniorRatio(
        uint256 seniorRedeem,
        uint256 seniorSupply,
        uint256 currSeniorAsset,
        uint256 newReserve,
        uint256 nav
    ) public pure returns (uint256 seniorRatio) {
        return
            calcSeniorRatio(
                calcSeniorAssetValue(
                    seniorRedeem,
                    seniorSupply,
                    currSeniorAsset,
                    newReserve,
                    nav
                ),
                nav,
                newReserve
            );
    }

    // calculates the net wealth in the system
    // NAV for ongoing loans and currency in reserve
    function calcAssets(uint256 NAV, uint256 reserve_)
        public
        pure
        returns (uint256)
    {
        return safeAdd(NAV, reserve_);
    }

    // calculates a new senior asset value based on senior redeem and senior supply
    function calcSeniorAssetValue(
        uint256 seniorRedeem,
        uint256 seniorSupply,
        uint256 currSeniorAsset,
        uint256 reserve_,
        uint256 nav_
    ) public pure returns (uint256 seniorAsset) {
        seniorAsset = safeSub(
            safeAdd(currSeniorAsset, seniorSupply),
            seniorRedeem
        );
        uint256 assets = calcAssets(nav_, reserve_);
        if (seniorAsset > assets) {
            seniorAsset = assets;
        }

        return seniorAsset;
    }

    // expected senior return if no losses occur
    function calcExpectedSeniorAsset(
        uint256 seniorRedeem,
        uint256 seniorSupply,
        uint256 seniorBalance_,
        uint256 seniorDebt_
    ) public pure returns (uint256) {
        return
            safeSub(
                safeAdd(safeAdd(seniorDebt_, seniorBalance_), seniorSupply),
                seniorRedeem
            );
    }
}


// File @1754-factory/tinlake/src/lender/assessor.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;



interface NAVFeedLike {
    function calcUpdateNAV() external returns (uint256);

    function latestNAV() external view returns (uint256);

    function currentNAV() external view returns (uint256);

    function lastNAVUpdate() external view returns (uint256);
}

interface TrancheLike {
    function tokenSupply() external view returns (uint256);
}

interface ReserveLike {
    function totalBalance() external view returns (uint256);

    function file(bytes32 what, uint256 currencyAmount) external;

    function currencyAvailable() external view returns (uint256);
}

interface LendingAdapter {
    function remainingCredit() external view returns (uint256);

    function juniorStake() external view returns (uint256);

    function calcOvercollAmount(uint256 amount) external view returns (uint256);

    function stabilityFee() external view returns (uint256);

    function debt() external view returns (uint256);
}

contract Assessor is Definitions, Auth, Interest {
    // senior ratio from the last epoch executed
    Fixed27 public seniorRatio;

    // the seniorAsset value is stored in two variables
    // seniorDebt is the interest bearing amount for senior
    uint256 public seniorDebt_;
    // senior balance is the rest which is not used as interest
    // bearing amount
    uint256 public seniorBalance_;

    // interest rate per second for senior tranche
    Fixed27 public seniorInterestRate;

    // last time the senior interest has been updated
    uint256 public lastUpdateSeniorInterest;

    Fixed27 public maxSeniorRatio;
    Fixed27 public minSeniorRatio;

    uint256 public maxReserve;

    uint256 public creditBufferTime = 1 days;
    uint256 public maxStaleNAV = 1 days;

    TrancheLike public seniorTranche;
    TrancheLike public juniorTranche;
    NAVFeedLike public navFeed;
    ReserveLike public reserve;
    LendingAdapter public lending;

    uint256 public constant supplyTolerance = 5;

    event Depend(bytes32 indexed contractName, address addr);
    event File(bytes32 indexed name, uint256 value);

    constructor() {
        seniorInterestRate.value = ONE;
        lastUpdateSeniorInterest = block.timestamp;
        seniorRatio.value = 0;
        wards[msg.sender] = 1;
        emit Rely(msg.sender);
    }

    function depend(bytes32 contractName, address addr) public auth {
        if (contractName == "navFeed") {
            navFeed = NAVFeedLike(addr);
        } else if (contractName == "seniorTranche") {
            seniorTranche = TrancheLike(addr);
        } else if (contractName == "juniorTranche") {
            juniorTranche = TrancheLike(addr);
        } else if (contractName == "reserve") {
            reserve = ReserveLike(addr);
        } else if (contractName == "lending") {
            lending = LendingAdapter(addr);
        } else revert();
        emit Depend(contractName, addr);
    }

    function file(bytes32 name, uint256 value) public auth {
        if (name == "seniorInterestRate") {
            dripSeniorDebt();
            seniorInterestRate = Fixed27(value);
        } else if (name == "maxReserve") {
            maxReserve = value;
        } else if (name == "maxSeniorRatio") {
            require(value > minSeniorRatio.value, "value-too-small");
            maxSeniorRatio = Fixed27(value);
        } else if (name == "minSeniorRatio") {
            require(value < maxSeniorRatio.value, "value-too-big");
            minSeniorRatio = Fixed27(value);
        } else if (name == "creditBufferTime") {
            creditBufferTime = value;
        } else if (name == "maxStaleNAV") {
            maxStaleNAV = value;
        } else {
            revert("unknown-variable");
        }
        emit File(name, value);
    }

    function reBalance() public {
        reBalance(calcExpectedSeniorAsset(seniorBalance_, dripSeniorDebt()));
    }

    function reBalance(uint256 seniorAsset_) internal {
        // re-balancing according to new ratio
        // we use the approximated NAV here because because during the submission period
        // new loans might have been repaid in the meanwhile which are not considered in the epochNAV
        uint256 nav_ = getNAV();
        uint256 reserve_ = reserve.totalBalance();

        uint256 seniorRatio_ = calcSeniorRatio(seniorAsset_, nav_, reserve_);

        // in that case the entire juniorAsset is lost
        // the senior would own everything that' left
        if (seniorRatio_ > ONE) {
            seniorRatio_ = ONE;
        }

        seniorDebt_ = rmul(nav_, seniorRatio_);
        if (seniorDebt_ > seniorAsset_) {
            seniorDebt_ = seniorAsset_;
            seniorBalance_ = 0;
        } else {
            seniorBalance_ = safeSub(seniorAsset_, seniorDebt_);
        }
        seniorRatio = Fixed27(seniorRatio_);
    }

    function changeSeniorAsset(uint256 seniorSupply, uint256 seniorRedeem)
        external
        auth
    {
        reBalance(
            calcExpectedSeniorAsset(
                seniorRedeem,
                seniorSupply,
                seniorBalance_,
                dripSeniorDebt()
            )
        );
    }

    function seniorRatioBounds()
        public
        view
        returns (uint256 minSeniorRatio_, uint256 maxSeniorRatio_)
    {
        return (minSeniorRatio.value, maxSeniorRatio.value);
    }

    function calcUpdateNAV() external returns (uint256) {
        return navFeed.calcUpdateNAV();
    }

    function calcSeniorTokenPrice() external view returns (uint256) {
        return calcSeniorTokenPrice(getNAV(), reserve.totalBalance());
    }

    function calcSeniorTokenPrice(uint256 nav_, uint256)
        public
        view
        returns (uint256)
    {
        return _calcSeniorTokenPrice(nav_, reserve.totalBalance());
    }

    function calcJuniorTokenPrice() external view returns (uint256) {
        return _calcJuniorTokenPrice(getNAV(), reserve.totalBalance());
    }

    function calcJuniorTokenPrice(uint256 nav_, uint256)
        public
        view
        returns (uint256)
    {
        return _calcJuniorTokenPrice(nav_, reserve.totalBalance());
    }

    function calcTokenPrices() external view returns (uint256, uint256) {
        uint256 epochNAV = getNAV();
        uint256 epochReserve = reserve.totalBalance();
        return calcTokenPrices(epochNAV, epochReserve);
    }

    function calcTokenPrices(uint256 epochNAV, uint256 epochReserve)
        public
        view
        returns (uint256, uint256)
    {
        return (
            _calcJuniorTokenPrice(epochNAV, epochReserve),
            _calcSeniorTokenPrice(epochNAV, epochReserve)
        );
    }

    function _calcSeniorTokenPrice(uint256 nav_, uint256 reserve_)
        internal
        view
        returns (uint256)
    {
        // the coordinator interface will pass the reserveAvailable

        if (
            (nav_ == 0 && reserve_ == 0) ||
            seniorTranche.tokenSupply() <= supplyTolerance
        ) {
            // we are using a tolerance of 2 here, as there can be minimal supply leftovers after all redemptions due to rounding
            // initial token price at start 1.00
            return ONE;
        }

        uint256 totalAssets = safeAdd(nav_, reserve_);
        uint256 seniorAssetValue = calcExpectedSeniorAsset(
            seniorDebt(),
            seniorBalance_
        );

        if (totalAssets < seniorAssetValue) {
            seniorAssetValue = totalAssets;
        }
        return rdiv(seniorAssetValue, seniorTranche.tokenSupply());
    }

    function _calcJuniorTokenPrice(uint256 nav_, uint256 reserve_)
        internal
        view
        returns (uint256)
    {
        if (
            (nav_ == 0 && reserve_ == 0) ||
            juniorTranche.tokenSupply() <= supplyTolerance
        ) {
            // we are using a tolerance of 2 here, as there can be minimal supply leftovers after all redemptions due to rounding
            // initial token price at start 1.00
            return ONE;
        }
        // reserve includes creditline from maker
        uint256 totalAssets = safeAdd(nav_, reserve_);

        // includes creditline from mkr
        uint256 seniorAssetValue = calcExpectedSeniorAsset(
            seniorDebt(),
            seniorBalance_
        );

        if (totalAssets < seniorAssetValue) {
            return 0;
        }

        // the junior tranche only needs to pay for the mkr over-collateralization if
        // the mkr vault is liquidated, if that is true juniorStake=0
        uint256 juniorStake = 0;
        if (address(lending) != address(0)) {
            juniorStake = lending.juniorStake();
        }

        return
            rdiv(
                safeAdd(safeSub(totalAssets, seniorAssetValue), juniorStake),
                juniorTranche.tokenSupply()
            );
    }

    function dripSeniorDebt() public returns (uint256) {
        seniorDebt_ = seniorDebt();
        lastUpdateSeniorInterest = block.timestamp;
        return seniorDebt_;
    }

    function seniorDebt() public view returns (uint256) {
        if (block.timestamp >= lastUpdateSeniorInterest) {
            return
                chargeInterest(
                    seniorDebt_,
                    seniorInterestRate.value,
                    lastUpdateSeniorInterest
                );
        }
        return seniorDebt_;
    }

    function seniorBalance() public view returns (uint256) {
        return safeAdd(seniorBalance_, remainingOvercollCredit());
    }

    function effectiveSeniorBalance() public view returns (uint256) {
        return seniorBalance_;
    }

    function effectiveTotalBalance() public view returns (uint256) {
        return reserve.totalBalance();
    }

    function totalBalance() public view returns (uint256) {
        return safeAdd(reserve.totalBalance(), remainingCredit());
    }

    // returns the current NAV
    function getNAV() public view returns (uint256) {
        if (block.timestamp >= navFeed.lastNAVUpdate() + maxStaleNAV) {
            return navFeed.currentNAV();
        }

        return navFeed.latestNAV();
    }

    // changes the total amount available for borrowing loans
    function changeBorrowAmountEpoch(uint256 currencyAmount) public auth {
        reserve.file("currencyAvailable", currencyAmount);
    }

    function borrowAmountEpoch() public view returns (uint256) {
        return reserve.currencyAvailable();
    }

    // returns the current junior ratio protection in the Tinlake
    // juniorRatio is denominated in RAY (10^27)
    function calcJuniorRatio() public view returns (uint256) {
        uint256 seniorAsset = safeAdd(seniorDebt(), seniorBalance_);
        uint256 assets = safeAdd(getNAV(), reserve.totalBalance());

        if (seniorAsset == 0 && assets == 0) {
            return 0;
        }

        if (seniorAsset == 0 && assets > 0) {
            return ONE;
        }

        if (seniorAsset > assets) {
            return 0;
        }

        return safeSub(ONE, rdiv(seniorAsset, assets));
    }

    // returns the remainingCredit plus a buffer for the interest increase
    function remainingCredit() public view returns (uint256) {
        if (address(lending) == address(0)) {
            return 0;
        }

        // over the time the remainingCredit will decrease because of the accumulated debt interest
        // therefore a buffer is reduced from the  remainingCredit to prevent the usage of currency which is not available
        uint256 debt = lending.debt();
        uint256 stabilityBuffer = safeSub(
            rmul(rpow(lending.stabilityFee(), creditBufferTime, ONE), debt),
            debt
        );
        uint256 remainingCredit_ = lending.remainingCredit();
        if (remainingCredit_ > stabilityBuffer) {
            return safeSub(remainingCredit_, stabilityBuffer);
        }

        return 0;
    }

    function remainingOvercollCredit() public view returns (uint256) {
        if (address(lending) == address(0)) {
            return 0;
        }

        return lending.calcOvercollAmount(remainingCredit());
    }
}


// File @1754-factory/tinlake/src/lender/fabs/assessor.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

interface AssessorFabLike {
    function newAssessor() external returns (address);
}

contract AssessorFab {
    function newAssessor() public returns (address) {
        Assessor assessor = new Assessor();
        assessor.rely(msg.sender);
        assessor.deny(address(this));
        return address(assessor);
    }
}


// File @1754-factory/tinlake/src/lender/admin/pool.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

interface AssessorLike {
    function file(bytes32 name, uint256 value) external;
}

interface LendingAdapterLike {
    function raise(uint256 amount) external;

    function sink(uint256 amount) external;

    function heal() external;

    function file(bytes32 what, uint256 value) external;
}

interface FeedLike {
    function overrideWriteOff(uint256 loan, uint256 writeOffGroupIndex_)
        external;

    function file(
        bytes32 name,
        uint256 risk_,
        uint256 thresholdRatio_,
        uint256 ceilingRatio_,
        uint256 rate_,
        uint256 recoveryRatePD_
    ) external;

    function file(
        bytes32 name,
        uint256 rate_,
        uint256 writeOffPercentage_,
        uint256 overdueDays_
    ) external;

    function file(bytes32 name, uint256 value) external;

    function file(
        bytes32 name,
        bytes32 nftID_,
        uint256 maturityDate_
    ) external;

    function update(bytes32 nftID_, uint256 value) external;

    function update(
        bytes32 nftID_,
        uint256 value,
        uint256 risk_
    ) external;
}

interface MemberlistLike {
    function updateMember(address usr, uint256 validUntil) external;

    function updateMembers(address[] calldata users, uint256 validUntil)
        external;
}

interface CoordinatorLike {
    function file(bytes32 name, uint256 value) external;

    function file(bytes32 name, bool value) external;

    function poolClosing() external view returns (bool);
}

// Wrapper contract for various pool management tasks.
contract PoolAdmin {
    AssessorLike public assessor;
    LendingAdapterLike public lending;
    FeedLike public navFeed;
    MemberlistLike public seniorMemberlist;
    MemberlistLike public juniorMemberlist;
    CoordinatorLike public coordinator;

    bool public live = true;

    mapping(address => uint256) public admin_level;

    uint256 public constant LEVEL_1 = 1;
    uint256 public constant LEVEL_2 = 2;
    uint256 public constant LEVEL_3 = 3;

    modifier level1() {
        require(admin_level[msg.sender] >= LEVEL_1 && live);
        _;
    }
    modifier level2() {
        require(admin_level[msg.sender] >= LEVEL_2 && live);
        _;
    }
    modifier level3() {
        require(admin_level[msg.sender] == LEVEL_3 && live);
        _;
    }

    constructor() {
        admin_level[msg.sender] = LEVEL_3;
        emit SetAdminLevel(msg.sender, LEVEL_3);
    }

    // --- Liquidity Management, authorized by level 1 admins ---
    event SetMaxReserve(uint256 value);
    event RaiseCreditline(uint256 amount);
    event SinkCreditline(uint256 amount);
    event HealCreditline();
    event UpdateSeniorMember(address indexed usr, uint256 validUntil);
    event UpdateSeniorMembers(address[] indexed users, uint256 validUntil);
    event UpdateJuniorMember(address indexed usr, uint256 validUntil);
    event UpdateJuniorMembers(address[] indexed users, uint256 validUntil);

    // Manage max reserve
    function setMaxReserve(uint256 value) public level1 {
        assessor.file("maxReserve", value);
        emit SetMaxReserve(value);
    }

    // Manage creditline
    function raiseCreditline(uint256 amount) public level1 {
        lending.raise(amount);
        emit RaiseCreditline(amount);
    }

    function sinkCreditline(uint256 amount) public level1 {
        lending.sink(amount);
        emit SinkCreditline(amount);
    }

    function healCreditline() public level1 {
        lending.heal();
        emit HealCreditline();
    }

    function setMaxReserveAndRaiseCreditline(
        uint256 newMaxReserve,
        uint256 creditlineRaise
    ) public level1 {
        setMaxReserve(newMaxReserve);
        raiseCreditline(creditlineRaise);
    }

    function setMaxReserveAndSinkCreditline(
        uint256 newMaxReserve,
        uint256 creditlineSink
    ) public level1 {
        setMaxReserve(newMaxReserve);
        sinkCreditline(creditlineSink);
    }

    // Manage memberlists
    function updateSeniorMember(address usr, uint256 validUntil) public level1 {
        seniorMemberlist.updateMember(usr, validUntil);
        emit UpdateSeniorMember(usr, validUntil);
    }

    function updateSeniorMembers(address[] memory users, uint256 validUntil)
        public
        level1
    {
        seniorMemberlist.updateMembers(users, validUntil);
        emit UpdateSeniorMembers(users, validUntil);
    }

    function updateJuniorMember(address usr, uint256 validUntil) public level1 {
        juniorMemberlist.updateMember(usr, validUntil);
        emit UpdateJuniorMember(usr, validUntil);
    }

    function updateJuniorMembers(address[] memory users, uint256 validUntil)
        public
        level1
    {
        juniorMemberlist.updateMembers(users, validUntil);
        emit UpdateJuniorMembers(users, validUntil);
    }

    // --- Risk Management, authorized by level 2 admins ---
    event OverrideWriteOff(uint256 loan, uint256 writeOffGroupIndex);
    event AddRiskGroup(
        uint256 risk_,
        uint256 thresholdRatio_,
        uint256 ceilingRatio_,
        uint256 rate_,
        uint256 recoveryRatePD_
    );
    event AddRiskGroups(
        uint256[] risks_,
        uint256[] thresholdRatios_,
        uint256[] ceilingRatios_,
        uint256[] rates_
    );
    event AddWriteOffGroup(
        uint256 rate_,
        uint256 writeOffPercentage_,
        uint256 overdueDays_
    );
    event SetMatBuffer(uint256 value);
    event UpdateNFTValue(bytes32 nftID_, uint256 value);
    event UpdateNFTValueRisk(bytes32 nftID_, uint256 value, uint256 risk_);
    event UpdateNFTMaturityDate(bytes32 nftID_, uint256 maturityDate_);

    function overrideWriteOff(uint256 loan, uint256 writeOffGroupIndex_)
        public
        level2
    {
        navFeed.overrideWriteOff(loan, writeOffGroupIndex_);
        emit OverrideWriteOff(loan, writeOffGroupIndex_);
    }

    function addRiskGroup(
        uint256 risk_,
        uint256 thresholdRatio_,
        uint256 ceilingRatio_,
        uint256 rate_,
        uint256 recoveryRatePD_
    ) public level2 {
        navFeed.file(
            "riskGroup",
            risk_,
            thresholdRatio_,
            ceilingRatio_,
            rate_,
            recoveryRatePD_
        );
        emit AddRiskGroup(
            risk_,
            thresholdRatio_,
            ceilingRatio_,
            rate_,
            recoveryRatePD_
        );
    }

    function addRiskGroups(
        uint256[] memory risks_,
        uint256[] memory thresholdRatios_,
        uint256[] memory ceilingRatios_,
        uint256[] memory rates_,
        uint256[] memory recoveryRatePDs_
    ) public level2 {
        require(
            risks_.length == thresholdRatios_.length &&
                thresholdRatios_.length == ceilingRatios_.length &&
                ceilingRatios_.length == rates_.length &&
                rates_.length == recoveryRatePDs_.length,
            "non-matching-arguments"
        );
        for (uint256 i = 0; i < risks_.length; i++) {
            addRiskGroup(
                risks_[i],
                thresholdRatios_[i],
                ceilingRatios_[i],
                rates_[i],
                recoveryRatePDs_[i]
            );
        }
    }

    function addWriteOffGroup(
        uint256 rate_,
        uint256 writeOffPercentage_,
        uint256 overdueDays_
    ) public level2 {
        navFeed.file("writeOffGroup", rate_, writeOffPercentage_, overdueDays_);
        emit AddWriteOffGroup(rate_, writeOffPercentage_, overdueDays_);
    }

    function addWriteOffGroups(
        uint256[] memory rates_,
        uint256[] memory writeOffPercentages_,
        uint256[] memory overdueDays_
    ) public level2 {
        require(
            rates_.length == writeOffPercentages_.length &&
                writeOffPercentages_.length == overdueDays_.length,
            "non-matching-arguments"
        );
        for (uint256 i = 0; i < rates_.length; i++) {
            addWriteOffGroup(
                rates_[i],
                writeOffPercentages_[i],
                overdueDays_[i]
            );
        }
    }

    function setMatBuffer(uint256 value) public level3 {
        lending.file("buffer", value);
        emit SetMatBuffer(value);
    }

    function setMaxAutoHeal(uint256 value) public level3 {
        lending.file("autoHealMax", value);
    }

    function updateNFTValue(bytes32 nftID_, uint256 value) public level2 {
        navFeed.update(nftID_, value);
        emit UpdateNFTValue(nftID_, value);
    }

    function updateNFTValueRisk(
        bytes32 nftID_,
        uint256 value,
        uint256 risk_
    ) public level2 {
        navFeed.update(nftID_, value, risk_);
        emit UpdateNFTValueRisk(nftID_, value, risk_);
    }

    function updateNFTMaturityDate(bytes32 nftID_, uint256 maturityDate_)
        public
        level2
    {
        navFeed.file("maturityDate", nftID_, maturityDate_);
        emit UpdateNFTMaturityDate(nftID_, maturityDate_);
    }

    // --- Pool Governance, authorized by level 3 admins ---
    event File(bytes32 indexed what, bool indexed data);
    event SetSeniorInterestRate(uint256 value);
    event SetDiscountRate(uint256 value);
    event SetMinimumEpochTime(uint256 value);
    event SetChallengeTime(uint256 value);
    event SetMinSeniorRatio(uint256 value);
    event SetMaxSeniorRatio(uint256 value);
    event SetEpochScoringWeights(
        uint256 weightSeniorRedeem,
        uint256 weightJuniorRedeem,
        uint256 weightJuniorSupply,
        uint256 weightSeniorSupply
    );
    event ClosePool();
    event UnclosePool();
    event SetAdminLevel(address indexed usr, uint256 indexed level);
    event Depend(bytes32 indexed contractname, address addr);

    function setSeniorInterestRate(uint256 value) public level3 {
        assessor.file("seniorInterestRate", value);
        emit SetSeniorInterestRate(value);
    }

    function setDiscountRate(uint256 value) public level3 {
        navFeed.file("discountRate", value);
        emit SetDiscountRate(value);
    }

    function setMinimumEpochTime(uint256 value) public level3 {
        coordinator.file("minimumEpochTime", value);
        emit SetMinimumEpochTime(value);
    }

    function setChallengeTime(uint256 value) public level3 {
        coordinator.file("challengeTime", value);
        emit SetChallengeTime(value);
    }

    function setMinSeniorRatio(uint256 value) public level3 {
        assessor.file("minSeniorRatio", value);
        emit SetMinSeniorRatio(value);
    }

    function setMaxSeniorRatio(uint256 value) public level3 {
        assessor.file("maxSeniorRatio", value);
        emit SetMaxSeniorRatio(value);
    }

    function setEpochScoringWeights(
        uint256 weightSeniorRedeem,
        uint256 weightJuniorRedeem,
        uint256 weightJuniorSupply,
        uint256 weightSeniorSupply
    ) public level3 {
        coordinator.file("weightSeniorRedeem", weightSeniorRedeem);
        coordinator.file("weightJuniorRedeem", weightJuniorRedeem);
        coordinator.file("weightJuniorSupply", weightJuniorSupply);
        coordinator.file("weightSeniorSupply", weightSeniorSupply);
        emit SetEpochScoringWeights(
            weightSeniorRedeem,
            weightJuniorRedeem,
            weightJuniorSupply,
            weightSeniorSupply
        );
    }

    function closePool() public level3 {
        require(coordinator.poolClosing() == false, "already-closed");
        coordinator.file("poolClosing", true);
        emit ClosePool();
    }

    function unclosePool() public level3 {
        require(coordinator.poolClosing() == true, "not-yet-closed");
        coordinator.file("poolClosing", false);
        emit UnclosePool();
    }

    modifier canSetAdminlevel(uint256 level) {
        require(level >= 0 && level <= LEVEL_3);
        if (level == 0) require(admin_level[msg.sender] == LEVEL_3);
        if (level == LEVEL_1) require(admin_level[msg.sender] >= LEVEL_2);
        if (level == LEVEL_2 || level == LEVEL_3)
            require(admin_level[msg.sender] == LEVEL_3);
        _;
    }

    function setAdminLevel(address usr, uint256 level)
        public
        canSetAdminlevel(level)
    {
        admin_level[usr] = level;
        emit SetAdminLevel(usr, level);
    }

    // Aliases so the root contract can use its relyContract/denyContract methods
    function rely(address usr) public level3 {
        setAdminLevel(usr, 3);
    }

    function deny(address usr) public level3 {
        setAdminLevel(usr, 0);
    }

    function depend(bytes32 contractName, address addr) public level3 {
        if (contractName == "assessor") {
            assessor = AssessorLike(addr);
        } else if (contractName == "lending") {
            lending = LendingAdapterLike(addr);
        } else if (contractName == "seniorMemberlist") {
            seniorMemberlist = MemberlistLike(addr);
        } else if (contractName == "juniorMemberlist") {
            juniorMemberlist = MemberlistLike(addr);
        } else if (contractName == "navFeed") {
            navFeed = FeedLike(addr);
        } else if (contractName == "coordinator") {
            coordinator = CoordinatorLike(addr);
        } else revert();
        emit Depend(contractName, addr);
    }

    function file(bytes32 what, bool data) public level3 {
        live = data;
        emit File(what, data);
    }
}


// File @1754-factory/tinlake/src/lender/fabs/pooladmin.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

contract PoolAdminFab {
    function newPoolAdmin() public returns (address) {
        PoolAdmin poolAdmin = new PoolAdmin();

        poolAdmin.rely(msg.sender);
        poolAdmin.deny(address(this));

        return address(poolAdmin);
    }
}


// File @1754-factory/tinlake/src/lender/coordinator.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;



interface TrancheLike {
    function epochUpdate(
        uint256 epochID,
        uint256 supplyFulfillment_,
        uint256 redeemFulfillment_,
        uint256 tokenPrice_,
        uint256 epochSupplyCurrency,
        uint256 epochRedeemCurrency
    ) external;

    function closeEpoch()
        external
        returns (uint256 totalSupply, uint256 totalRedeem);

    function payoutRequestedCurrency() external;
}

abstract contract AssessorLike is FixedPoint {
    // definitions
    function calcSeniorRatio(
        uint256 seniorAsset,
        uint256 NAV,
        uint256 reserve_
    ) public pure virtual returns (uint256);

    function calcSeniorAssetValue(
        uint256 seniorRedeem,
        uint256 seniorSupply,
        uint256 currSeniorAsset,
        uint256 reserve_,
        uint256 nav_
    ) public pure virtual returns (uint256 seniorAsset);

    function calcSeniorRatio(
        uint256 seniorRedeem,
        uint256 seniorSupply,
        uint256 currSeniorAsset,
        uint256 newReserve,
        uint256 nav
    ) public pure virtual returns (uint256 seniorRatio);

    // definitions based on assessor state
    function calcSeniorTokenPrice(uint256 NAV, uint256 reserve)
        public
        virtual
        returns (uint256 tokenPrice);

    function calcJuniorTokenPrice(uint256 NAV, uint256 reserve)
        public
        virtual
        returns (uint256 tokenPrice);

    // get state
    function maxReserve() public view virtual returns (uint256);

    function calcUpdateNAV() public virtual returns (uint256);

    function seniorDebt() public virtual returns (uint256);

    function seniorBalance() public virtual returns (uint256);

    function seniorRatioBounds()
        public
        view
        virtual
        returns (uint256 minSeniorRatio, uint256 maxSeniorRatio);

    function totalBalance() public virtual returns (uint256);

    // change state
    function changeBorrowAmountEpoch(uint256 currencyAmount) public virtual;

    function changeSeniorAsset(uint256 seniorSupply, uint256 seniorRedeem)
        public
        virtual;

    function changeSeniorAsset(
        uint256 seniorRatio,
        uint256 seniorSupply,
        uint256 seniorRedeem
    ) public virtual;
}

// The EpochCoordinator keeps track of the epochs and execute epochs them.
// An epoch execution happens with the maximum amount of redeem and supply which still satisfies
// all constraints or at least improve certain pool constraints.
// In most cases all orders can be fulfilled with order maximum without violating any constraints.
// If it is not possible to satisfy all orders at maximum the coordinators opens a submission period.
// The problem of finding the maximum amount of supply and redeem orders which still satisfies all constraints
// can be seen as a linear programming (linear optimization problem).
// The optimal solution can be calculated off-chain
contract EpochCoordinator is Auth, Math, FixedPoint {
    struct OrderSummary {
        // all variables are stored in currency
        uint256 seniorRedeem;
        uint256 juniorRedeem;
        uint256 juniorSupply;
        uint256 seniorSupply;
    }

    modifier minimumEpochTimePassed() {
        require(safeSub(block.timestamp, lastEpochClosed) >= minimumEpochTime);
        _;
    }
    // timestamp last epoch closed
    uint256 public lastEpochClosed;
    // default minimum length of an epoch
    // (1 day, with 10 min buffer, so we can close the epochs automatically on a daily basis at the same time)
    uint256 public minimumEpochTime = 1 days - 10 minutes;

    TrancheLike public juniorTranche;
    TrancheLike public seniorTranche;

    AssessorLike public assessor;

    uint256 public lastEpochExecuted;
    uint256 public currentEpoch;
    // current best solution submission for an epoch which satisfies all constraints
    OrderSummary public bestSubmission;
    // current best score of the best solution
    uint256 public bestSubScore;
    // flag which tracks if an submission period received a valid solution
    bool public gotFullValidSolution;
    // snapshot from the the orders in the tranches at epoch close
    OrderSummary public order;
    // snapshot from the senior token price at epoch close
    Fixed27 public epochSeniorTokenPrice;
    // snapshot from the junior token price at epoch close
    Fixed27 public epochJuniorTokenPrice;

    // snapshot from NAV (net asset value of the loans) at epoch close
    uint256 public epochNAV;
    // snapshot from the senior asset value at epoch close
    uint256 public epochSeniorAsset;
    // snapshot from reserve balance at epoch close
    uint256 public epochReserve;
    // flag which indicates if the coordinator is currently in a submission period
    bool public submissionPeriod;

    // weights of the scoring function
    // highest priority senior redeem and junior redeem before junior and senior supply
    uint256 public weightSeniorRedeem = 1000000;
    uint256 public weightJuniorRedeem = 100000;
    uint256 public weightJuniorSupply = 10000;
    uint256 public weightSeniorSupply = 1000;

    // challenge period end timestamp
    uint256 public minChallengePeriodEnd;
    // after a first valid solution is received others can submit better solutions
    // until challenge time is over
    uint256 public challengeTime;
    // if the current state is not healthy improvement submissions are allowed
    // ratio and reserve improvements receive score points
    // keeping track of the best improvements scores
    uint256 public bestRatioImprovement;
    uint256 public bestReserveImprovement;

    // flag for closing the pool (no new supplies allowed only redeem)
    bool public poolClosing = false;

    // constants
    int256 public constant SUCCESS = 0;
    int256 public constant NEW_BEST = 0;
    int256 public constant ERR_CURRENCY_AVAILABLE = -1;
    int256 public constant ERR_MAX_ORDER = -2;
    int256 public constant ERR_MAX_RESERVE = -3;
    int256 public constant ERR_MIN_SENIOR_RATIO = -4;
    int256 public constant ERR_MAX_SENIOR_RATIO = -5;
    int256 public constant ERR_NOT_NEW_BEST = -6;
    int256 public constant ERR_POOL_CLOSING = -7;
    uint256 public constant BIG_NUMBER = ONE * ONE;

    event File(bytes32 indexed name, uint256 value);
    event File(bytes32 indexed name, bool value);
    event Depend(bytes32 indexed contractName, address addr);

    constructor(uint256 challengeTime_) {
        challengeTime = challengeTime_;
        lastEpochClosed = block.timestamp;
        currentEpoch = 1;

        wards[msg.sender] = 1;
        emit Rely(msg.sender);
    }

    function file(bytes32 name, uint256 value) public auth {
        if (name == "challengeTime") {
            challengeTime = value;
        } else if (name == "minimumEpochTime") {
            minimumEpochTime = value;
        } else if (name == "weightSeniorRedeem") {
            weightSeniorRedeem = value;
        } else if (name == "weightJuniorRedeem") {
            weightJuniorRedeem = value;
        } else if (name == "weightJuniorSupply") {
            weightJuniorSupply = value;
        } else if (name == "weightSeniorSupply") {
            weightSeniorSupply = value;
        } else {
            revert("unknown-name");
        }
        emit File(name, value);
    }

    function file(bytes32 name, bool value) public auth {
        if (name == "poolClosing") {
            poolClosing = value;
        } else {
            revert("unknown-name");
        }
        emit File(name, value);
    }

    // sets the dependency to another contract
    function depend(bytes32 contractName, address addr) public auth {
        if (contractName == "juniorTranche") {
            juniorTranche = TrancheLike(addr);
        } else if (contractName == "seniorTranche") {
            seniorTranche = TrancheLike(addr);
        } else if (contractName == "assessor") {
            assessor = AssessorLike(addr);
        } else revert();
        emit Depend(contractName, addr);
    }

    // an epoch can be closed after a minimum epoch time has passed
    // closeEpoch creates a snapshot of the current lender state
    // if all orders can be fulfilled epoch is executed otherwise
    // submission period starts
    function closeEpoch()
        external
        minimumEpochTimePassed
        returns (bool epochExecuted)
    {
        require(submissionPeriod == false);
        lastEpochClosed = block.timestamp;
        currentEpoch = currentEpoch + 1;
        assessor.changeBorrowAmountEpoch(0);

        (uint256 orderJuniorSupply, uint256 orderJuniorRedeem) = juniorTranche
            .closeEpoch();
        (uint256 orderSeniorSupply, uint256 orderSeniorRedeem) = seniorTranche
            .closeEpoch();
        epochSeniorAsset = safeAdd(
            assessor.seniorDebt(),
            assessor.seniorBalance()
        );

        // create a snapshot of the current lender state

        epochNAV = assessor.calcUpdateNAV();
        epochReserve = assessor.totalBalance();
        //  if no orders exist epoch can be executed without validation
        if (
            orderSeniorRedeem == 0 &&
            orderJuniorRedeem == 0 &&
            orderSeniorSupply == 0 &&
            orderJuniorSupply == 0
        ) {
            juniorTranche.epochUpdate(currentEpoch, 0, 0, 0, 0, 0);
            seniorTranche.epochUpdate(currentEpoch, 0, 0, 0, 0, 0);
            // assessor performs re-balancing
            assessor.changeSeniorAsset(0, 0);
            assessor.changeBorrowAmountEpoch(epochReserve);
            lastEpochExecuted = safeAdd(lastEpochExecuted, 1);
            return true;
        }

        // calculate current token prices which are used for the execute

        epochSeniorTokenPrice = Fixed27(
            assessor.calcSeniorTokenPrice(epochNAV, epochReserve)
        );
        epochJuniorTokenPrice = Fixed27(
            assessor.calcJuniorTokenPrice(epochNAV, epochReserve)
        );
        // start closing the pool if juniorTranche lost everything
        // the flag will change the behaviour of the validate function for not allowing new supplies
        if (epochJuniorTokenPrice.value == 0) {
            poolClosing = true;
        }

        // convert redeem orders in token into currency
        order.seniorRedeem = rmul(
            orderSeniorRedeem,
            epochSeniorTokenPrice.value
        );
        order.juniorRedeem = rmul(
            orderJuniorRedeem,
            epochJuniorTokenPrice.value
        );
        order.juniorSupply = orderJuniorSupply;
        order.seniorSupply = orderSeniorSupply;

        // epoch is executed if orders can be fulfilled to 100% without constraint violation
        if (
            validate(
                order.seniorRedeem,
                order.juniorRedeem,
                order.seniorSupply,
                order.juniorSupply
            ) == SUCCESS
        ) {
            _executeEpoch(
                order.seniorRedeem,
                order.juniorRedeem,
                orderSeniorSupply,
                orderJuniorSupply
            );
            return true;
        }
        // if 100% order fulfillment is not possible submission period starts
        // challenge period time starts after first valid submission is received
        submissionPeriod = true;
        return false;
    }

    /// internal method to save new optimum
    /// orders are expressed as currency
    /// all parameter are 10^18
    function _saveNewOptimum(
        uint256 seniorRedeem,
        uint256 juniorRedeem,
        uint256 juniorSupply,
        uint256 seniorSupply,
        uint256 score
    ) internal {
        bestSubmission.seniorRedeem = seniorRedeem;
        bestSubmission.juniorRedeem = juniorRedeem;
        bestSubmission.juniorSupply = juniorSupply;
        bestSubmission.seniorSupply = seniorSupply;

        bestSubScore = score;
    }

    // method to submit a solution for submission period
    // anybody can submit a solution for the current execution epoch
    // if solution satisfies all constraints (or at least improves an unhealthy state)
    // and has the highest score
    function submitSolution(
        uint256 seniorRedeem,
        uint256 juniorRedeem,
        uint256 juniorSupply,
        uint256 seniorSupply
    ) public returns (int256) {
        require(submissionPeriod == true, "submission-period-not-active");

        int256 valid = _submitSolution(
            seniorRedeem,
            juniorRedeem,
            juniorSupply,
            seniorSupply
        );

        // if solution is the first valid for this epoch the challenge period starts
        if (valid == SUCCESS && minChallengePeriodEnd == 0) {
            minChallengePeriodEnd = safeAdd(block.timestamp, challengeTime);
        }
        return valid;
    }

    // internal method for submit solution
    function _submitSolution(
        uint256 seniorRedeem,
        uint256 juniorRedeem,
        uint256 juniorSupply,
        uint256 seniorSupply
    ) internal returns (int256) {
        int256 valid = validate(
            seniorRedeem,
            juniorRedeem,
            seniorSupply,
            juniorSupply
        );

        // every solution needs to satisfy all core constraints
        // there is no exception
        if (
            valid == ERR_CURRENCY_AVAILABLE ||
            valid == ERR_MAX_ORDER ||
            valid == ERR_POOL_CLOSING
        ) {
            // core constraint violated
            return valid;
        }

        // all core constraints and all pool constraints are satisfied
        if (valid == SUCCESS) {
            uint256 score = scoreSolution(
                seniorRedeem,
                juniorRedeem,
                seniorSupply,
                juniorSupply
            );

            if (gotFullValidSolution == false) {
                gotFullValidSolution = true;
                _saveNewOptimum(
                    seniorRedeem,
                    juniorRedeem,
                    juniorSupply,
                    seniorSupply,
                    score
                );
                // solution is new best => 0
                return SUCCESS;
            }

            if (score < bestSubScore) {
                // solution is not the best => -6
                return ERR_NOT_NEW_BEST;
            }

            _saveNewOptimum(
                seniorRedeem,
                juniorRedeem,
                juniorSupply,
                seniorSupply,
                score
            );

            // solution is new best => 0
            return SUCCESS;
        }

        // proposed solution does not satisfy all pool constraints
        // if we never received a solution which satisfies all constraints for this epoch
        // we might accept it as an improvement
        if (gotFullValidSolution == false) {
            return
                _improveScore(
                    seniorRedeem,
                    juniorRedeem,
                    juniorSupply,
                    seniorSupply
                );
        }

        // proposed solution doesn't satisfy the pool constraints but a previous submission did
        return ERR_NOT_NEW_BEST;
    }

    function absDistance(uint256 x, uint256 y)
        public
        pure
        returns (uint256 delta)
    {
        if (x == y) {
            // gas optimization: for avoiding an additional edge case of 0 distance
            // distance is set to the smallest value possible
            return 1;
        }
        if (x > y) {
            return safeSub(x, y);
        }
        return safeSub(y, x);
    }

    function checkRatioInRange(
        uint256 ratio,
        uint256 minRatio,
        uint256 maxRatio
    ) public pure returns (bool) {
        if (ratio >= minRatio && ratio <= maxRatio) {
            return true;
        }
        return false;
    }

    // calculates the improvement score of a solution
    function _improveScore(
        uint256 seniorRedeem,
        uint256 juniorRedeem,
        uint256 juniorSupply,
        uint256 seniorSupply
    ) internal returns (int256) {
        Fixed27 memory currSeniorRatio = Fixed27(
            assessor.calcSeniorRatio(epochSeniorAsset, epochNAV, epochReserve)
        );

        int256 err = 0;
        uint256 impScoreRatio = 0;
        uint256 impScoreReserve = 0;

        if (bestRatioImprovement == 0) {
            // define no orders (current status) score as benchmark if no previous submission exists
            // if the current state satisfies all pool constraints it has the highest score
            (err, impScoreRatio, impScoreReserve) = scoreImprovement(
                currSeniorRatio.value,
                epochReserve
            );
            saveNewImprovement(impScoreRatio, impScoreReserve);
        }

        uint256 newReserve = calcNewReserve(
            seniorRedeem,
            juniorRedeem,
            seniorSupply,
            juniorSupply
        );

        Fixed27 memory newSeniorRatio = Fixed27(
            assessor.calcSeniorRatio(
                seniorRedeem,
                seniorSupply,
                epochSeniorAsset,
                newReserve,
                epochNAV
            )
        );

        (err, impScoreRatio, impScoreReserve) = scoreImprovement(
            newSeniorRatio.value,
            newReserve
        );

        if (err == ERR_NOT_NEW_BEST) {
            // solution is not the best => -1
            return err;
        }

        saveNewImprovement(impScoreRatio, impScoreReserve);

        // solution doesn't satisfy all pool constraints but improves the current violation
        // improvement only gets 0 points only solutions in the feasible region receive more
        _saveNewOptimum(
            seniorRedeem,
            juniorRedeem,
            juniorSupply,
            seniorSupply,
            0
        );
        return NEW_BEST;
    }

    // the score improvement reserve uses the normalized distance to maxReserve/2 as score
    // as smaller the distance as higher is the score
    // highest possible score if solution is not violating the reserve
    function scoreReserveImprovement(uint256 newReserve_)
        public
        view
        returns (uint256 score)
    {
        if (newReserve_ <= assessor.maxReserve()) {
            // highest possible score
            return BIG_NUMBER;
        }

        return rdiv(ONE, safeSub(newReserve_, assessor.maxReserve()));
    }

    // the score improvement ratio uses the normalized distance to (minRatio+maxRatio)/2 as score
    // as smaller the distance as higher is the score
    // highest possible score if solution is not violating the ratio
    function scoreRatioImprovement(uint256 newSeniorRatio)
        public
        view
        returns (uint256)
    {
        (uint256 minSeniorRatio, uint256 maxSeniorRatio) = assessor
            .seniorRatioBounds();
        if (
            checkRatioInRange(newSeniorRatio, minSeniorRatio, maxSeniorRatio) ==
            true
        ) {
            // highest possible score
            return BIG_NUMBER;
        }
        // absDistance of ratio can never be zero
        return
            rdiv(
                ONE,
                absDistance(
                    newSeniorRatio,
                    safeDiv(safeAdd(minSeniorRatio, maxSeniorRatio), 2)
                )
            );
    }

    // internal method to save new improvement score
    function saveNewImprovement(uint256 impScoreRatio, uint256 impScoreReserve)
        internal
    {
        bestRatioImprovement = impScoreRatio;
        bestReserveImprovement = impScoreReserve;
    }

    // calculates improvement score for reserve and ratio pool constraints
    function scoreImprovement(uint256 newSeniorRatio_, uint256 newReserve_)
        public
        view
        returns (
            int256,
            uint256,
            uint256
        )
    {
        uint256 impScoreRatio = scoreRatioImprovement(newSeniorRatio_);
        uint256 impScoreReserve = scoreReserveImprovement(newReserve_);

        // the highest priority has fixing the currentSeniorRatio
        // if the ratio is improved, we can ignore reserve
        if (impScoreRatio > bestRatioImprovement) {
            // we found a new best
            return (NEW_BEST, impScoreRatio, impScoreReserve);
        }

        // only if the submitted solution ratio score equals the current best ratio
        // we determine if the submitted solution improves the reserve
        if (impScoreRatio == bestRatioImprovement) {
            if (impScoreReserve >= bestReserveImprovement) {
                return (NEW_BEST, impScoreRatio, impScoreReserve);
            }
        }
        return (ERR_NOT_NEW_BEST, impScoreRatio, impScoreReserve);
    }

    // scores a solution in the submission period
    // the scoring function is a linear function with high weights as coefficient to determine
    // the priorities. (non-preemptive goal programming)
    function scoreSolution(
        uint256 seniorRedeem,
        uint256 juniorRedeem,
        uint256 juniorSupply,
        uint256 seniorSupply
    ) public view returns (uint256) {
        // the default priority order
        // 1. senior redeem
        // 2. junior redeem
        // 3. junior supply
        // 4. senior supply
        return
            safeAdd(
                safeAdd(
                    safeMul(seniorRedeem, weightSeniorRedeem),
                    safeMul(juniorRedeem, weightJuniorRedeem)
                ),
                safeAdd(
                    safeMul(juniorSupply, weightJuniorSupply),
                    safeMul(seniorSupply, weightSeniorSupply)
                )
            );
    }

    // validates if a solution satisfy the core constraints
    // returns: first constraint which is not satisfied or success
    function validateCoreConstraints(
        uint256 currencyAvailable,
        uint256 currencyOut,
        uint256 seniorRedeem,
        uint256 juniorRedeem,
        uint256 seniorSupply,
        uint256 juniorSupply
    ) public view returns (int256 err) {
        // constraint 1: currency available
        if (currencyOut > currencyAvailable) {
            // currencyAvailableConstraint => -1
            return ERR_CURRENCY_AVAILABLE;
        }

        // constraint 2: max order
        if (
            seniorSupply > order.seniorSupply ||
            juniorSupply > order.juniorSupply ||
            seniorRedeem > order.seniorRedeem ||
            juniorRedeem > order.juniorRedeem
        ) {
            // maxOrderConstraint => -2
            return ERR_MAX_ORDER;
        }

        // successful => 0
        return SUCCESS;
    }

    // validates if a solution satisfies the ratio constraints
    // returns: first constraint which is not satisfied or success
    function validateRatioConstraints(uint256 assets, uint256 seniorAsset)
        public
        view
        returns (int256)
    {
        (uint256 minSeniorRatio, uint256 maxSeniorRatio) = assessor
            .seniorRatioBounds();

        // constraint 4: min senior ratio constraint
        if (seniorAsset < rmul(assets, minSeniorRatio)) {
            // minSeniorRatioConstraint => -4
            return ERR_MIN_SENIOR_RATIO;
        }
        // constraint 5: max senior ratio constraint
        if (seniorAsset > rmul(assets, maxSeniorRatio)) {
            // maxSeniorRatioConstraint => -5
            return ERR_MAX_SENIOR_RATIO;
        }
        // successful => 0
        return SUCCESS;
    }

    // validates if a solution satisfies the pool constraints
    // returns: first constraint which is not satisfied or success
    function validatePoolConstraints(
        uint256 reserve_,
        uint256 seniorAsset,
        uint256 nav_
    ) public view returns (int256 err) {
        // constraint 3: max reserve
        if (reserve_ > assessor.maxReserve()) {
            // maxReserveConstraint => -3
            return ERR_MAX_RESERVE;
        }

        uint256 assets = safeAdd(nav_, reserve_);
        return validateRatioConstraints(assets, seniorAsset);
    }

    // validates if a solution satisfies core and pool constraints
    // returns: first constraint which is not satisfied or success
    function validate(
        uint256 seniorRedeem,
        uint256 juniorRedeem,
        uint256 seniorSupply,
        uint256 juniorSupply
    ) public view returns (int256) {
        return
            validate(
                epochReserve,
                epochNAV,
                epochSeniorAsset,
                OrderSummary({
                    seniorRedeem: seniorRedeem,
                    juniorRedeem: juniorRedeem,
                    seniorSupply: seniorSupply,
                    juniorSupply: juniorSupply
                })
            );
    }

    function validate(
        uint256 reserve_,
        uint256 nav_,
        uint256 seniorAsset_,
        uint256 seniorRedeem,
        uint256 juniorRedeem,
        uint256 seniorSupply,
        uint256 juniorSupply
    ) public view returns (int256) {
        return
            validate(
                reserve_,
                nav_,
                seniorAsset_,
                OrderSummary({
                    seniorRedeem: seniorRedeem,
                    juniorRedeem: juniorRedeem,
                    seniorSupply: seniorSupply,
                    juniorSupply: juniorSupply
                })
            );
    }

    function validate(
        uint256 reserve_,
        uint256 nav_,
        uint256 seniorAsset_,
        OrderSummary memory trans
    ) internal view returns (int256) {
        uint256 currencyAvailable = safeAdd(
            safeAdd(reserve_, trans.seniorSupply),
            trans.juniorSupply
        );
        uint256 currencyOut = safeAdd(trans.seniorRedeem, trans.juniorRedeem);

        int256 err = validateCoreConstraints(
            currencyAvailable,
            currencyOut,
            trans.seniorRedeem,
            trans.juniorRedeem,
            trans.seniorSupply,
            trans.juniorSupply
        );

        if (err != SUCCESS) {
            return err;
        }

        uint256 newReserve = safeSub(currencyAvailable, currencyOut);
        if (poolClosing == true) {
            if (trans.seniorSupply == 0 && trans.juniorSupply == 0) {
                return SUCCESS;
            }
            return ERR_POOL_CLOSING;
        }
        return
            validatePoolConstraints(
                newReserve,
                assessor.calcSeniorAssetValue(
                    trans.seniorRedeem,
                    trans.seniorSupply,
                    seniorAsset_,
                    newReserve,
                    nav_
                ),
                nav_
            );
    }

    // public method to execute an epoch which required a submission period and the challenge period is over
    function executeEpoch() public {
        require(
            block.timestamp >= minChallengePeriodEnd &&
                minChallengePeriodEnd != 0
        );

        _executeEpoch(
            bestSubmission.seniorRedeem,
            bestSubmission.juniorRedeem,
            bestSubmission.seniorSupply,
            bestSubmission.juniorSupply
        );
    }

    // calculates the percentage of an order type which can be fulfilled for an epoch
    function calcFulfillment(uint256 amount, uint256 totalOrder)
        public
        pure
        returns (uint256 percent)
    {
        if (amount == 0 || totalOrder == 0) {
            return 0;
        }
        return rdiv(amount, totalOrder);
    }

    // calculates the new reserve after a solution would be executed
    function calcNewReserve(
        uint256 seniorRedeem,
        uint256 juniorRedeem,
        uint256 seniorSupply,
        uint256 juniorSupply
    ) public view returns (uint256) {
        return
            safeSub(
                safeAdd(safeAdd(epochReserve, seniorSupply), juniorSupply),
                safeAdd(seniorRedeem, juniorRedeem)
            );
    }

    // internal execute epoch communicates the order fulfillment of the best solution to the tranches
    function _executeEpoch(
        uint256 seniorRedeem,
        uint256 juniorRedeem,
        uint256 seniorSupply,
        uint256 juniorSupply
    ) internal {
        uint256 epochID = safeAdd(lastEpochExecuted, 1);
        submissionPeriod = false;

        // tranche epochUpdates triggers currency transfers from/to reserve
        // an mint/burn tokens
        seniorTranche.epochUpdate(
            epochID,
            calcFulfillment(seniorSupply, order.seniorSupply),
            calcFulfillment(seniorRedeem, order.seniorRedeem),
            epochSeniorTokenPrice.value,
            order.seniorSupply,
            order.seniorRedeem
        );

        // assessor performs senior debt reBalancing according to new ratio
        assessor.changeSeniorAsset(seniorSupply, seniorRedeem);

        juniorTranche.epochUpdate(
            epochID,
            calcFulfillment(juniorSupply, order.juniorSupply),
            calcFulfillment(juniorRedeem, order.juniorRedeem),
            epochJuniorTokenPrice.value,
            order.juniorSupply,
            order.juniorRedeem
        );

        // sends requested currency to senior tranche, if currency was not available before
        seniorTranche.payoutRequestedCurrency();

        uint256 newReserve = calcNewReserve(
            seniorRedeem,
            juniorRedeem,
            seniorSupply,
            juniorSupply
        );

        // reBalancing again because the reserve has updated after the junior epochUpdate
        assessor.changeSeniorAsset(0, 0);
        // the new reserve after this epoch can be used for new loans
        assessor.changeBorrowAmountEpoch(newReserve);

        // reset state for next epochs
        lastEpochExecuted = epochID;
        minChallengePeriodEnd = 0;
        bestSubScore = 0;
        gotFullValidSolution = false;
        bestRatioImprovement = 0;
        bestReserveImprovement = 0;
    }
}


// File @1754-factory/packages/src/tokens/erc20.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
// Copyright (C) 2017, 2018, 2019 dbrock, rain, mrchico, lucasvo
pragma solidity >=0.8.10;

contract ERC20 {
    // --- Auth ---
    mapping (address => uint) public wards;
    function rely(address usr) public auth { wards[usr] = 1; }
    function deny(address usr) public auth { wards[usr] = 0; }
    modifier auth { require(wards[msg.sender] == 1); _; }

    // --- ERC20 Data ---
    uint8   public constant decimals = 18;
    string  public name;
    string  public symbol;
    string  public constant version = "1";
    uint256 public totalSupply;

    bytes32 public DOMAIN_SEPARATOR;
    // keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");
    bytes32 public constant PERMIT_TYPEHASH = 0x6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c9;
    mapping(address => uint) public nonces;

    mapping (address => uint)                      public balanceOf;
    mapping (address => mapping (address => uint)) public allowance;

    event Approval(address indexed src, address indexed usr, uint wad);
    event Transfer(address indexed src, address indexed dst, uint wad);

    // --- Math ---
    function safeAdd_(uint x, uint y) internal pure returns (uint z) {
        require((z = x + y) >= x, "math-add-overflow");
    }
    function safeSub_(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x, "math-sub-underflow");
    }

    constructor(string memory symbol_, string memory name_) {
        wards[msg.sender] = 1;
        symbol = symbol_;
        name = name_;

        uint chainId;
        assembly {
            chainId := chainid()
        }
        DOMAIN_SEPARATOR = keccak256(
            abi.encode(
                keccak256('EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)'),
                keccak256(bytes(name)),
                keccak256(bytes(version)),
                chainId,
                address(this)
            )
        );
    }

    // --- ERC20 ---
    function transfer(address dst, uint wad) external returns (bool) {
        return transferFrom(msg.sender, dst, wad);
    }
    function transferFrom(address src, address dst, uint wad)
        public virtual returns (bool)
    {
        require(balanceOf[src] >= wad, "cent/insufficient-balance");
        if (src != msg.sender && allowance[src][msg.sender] != type(uint256).max) {
            require(allowance[src][msg.sender] >= wad, "cent/insufficient-allowance");
            allowance[src][msg.sender] = safeSub_(allowance[src][msg.sender], wad);
        }
        balanceOf[src] = safeSub_(balanceOf[src], wad);
        balanceOf[dst] = safeAdd_(balanceOf[dst], wad);
        emit Transfer(src, dst, wad);
        return true;
    }
    function mint(address usr, uint wad) external virtual auth {
        balanceOf[usr] = safeAdd_(balanceOf[usr], wad);
        totalSupply    = safeAdd_(totalSupply, wad);
        emit Transfer(address(0), usr, wad);
    }
    function burn(address usr, uint wad) public {
        require(balanceOf[usr] >= wad, "cent/insufficient-balance");
        if (usr != msg.sender && allowance[usr][msg.sender] != type(uint256).max) {
            require(allowance[usr][msg.sender] >= wad, "cent/insufficient-allowance");
            allowance[usr][msg.sender] = safeSub_(allowance[usr][msg.sender], wad);
        }
        balanceOf[usr] = safeSub_(balanceOf[usr], wad);
        totalSupply    = safeSub_(totalSupply, wad);
        emit Transfer(usr, address(0), wad);
    }
    function approve(address usr, uint wad) external returns (bool) {
        allowance[msg.sender][usr] = wad;
        emit Approval(msg.sender, usr, wad);
        return true;
    }

    // --- Alias ---
    function push(address usr, uint wad) external {
        transferFrom(msg.sender, usr, wad);
    }
    function pull(address usr, uint wad) external {
        transferFrom(usr, msg.sender, wad);
    }
    function move(address src, address dst, uint wad) external {
        transferFrom(src, dst, wad);
    }
    function burnFrom(address usr, uint wad) external {
        burn(usr, wad);
    }

    // --- Approve by signature ---
    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external {
        require(deadline >= block.timestamp, 'cent/past-deadline');
        bytes32 digest = keccak256(
            abi.encodePacked(
                '\x19\x01',
                DOMAIN_SEPARATOR,
                keccak256(abi.encode(PERMIT_TYPEHASH, owner, spender, value, nonces[owner]++, deadline))
            )
        );
        address recoveredAddress = ecrecover(digest, v, r, s);
        require(recoveredAddress != address(0) && recoveredAddress == owner, 'cent-erc20/invalid-sig');
        allowance[owner][spender] = value;
        emit Approval(owner, spender, value);
    }
}


// File @1754-factory/tinlake/src/lender/fabs/coordinator.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;



interface CoordinatorFabLike {
    function newCoordinator(uint256) external returns (address);
}

contract CoordinatorFab {
    function newCoordinator(uint256 challengeTime) public returns (address) {
        EpochCoordinator coordinator = new EpochCoordinator(challengeTime);
        coordinator.rely(msg.sender);
        coordinator.deny(address(this));
        return address(coordinator);
    }
}


// File @1754-factory/tinlake/src/lender/fabs/operator.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

interface OperatorFabLike {
    function newOperator(address) external returns (address);
}

contract OperatorFab {
    function newOperator(address tranche) public returns (address) {
        Operator operator = new Operator(tranche);
        operator.rely(msg.sender);
        operator.deny(address(this));
        return address(operator);
    }
}


// File @1754-factory/tinlake/src/borrower/fabs/shelf.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

contract ShelfFab {
    function newShelf(
        address tkn_,
        address title_,
        address debt_,
        address ceiling_
    ) public returns (address) {
        Shelf shelf = new Shelf(tkn_, title_, debt_, ceiling_);
        shelf.rely(msg.sender);
        shelf.deny(address(this));
        return address(shelf);
    }
}


// File @1754-factory/tinlake/src/borrower/pile.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
// Copyright (C) 2018  Rain <rainbreak@riseup.net>, Centrifuge
pragma solidity ^0.8.10;


// ## Interest Group based Pile
// The following is one implementation of a debt module. It keeps track of different buckets of interest rates and is optimized for many loans per interest bucket. It keeps track of interest
// rate accumulators (chi values) for all interest rate categories. It calculates debt each
// loan according to its interest rate category and pie value.
contract Pile is Auth, Interest {
    // --- Data ---

    // stores all needed information of an interest rate group
    struct Rate {
        uint256 pie; // Total debt of all loans with this rate
        uint256 chi; // Accumulated rates
        uint256 ratePerSecond; // Accumulation per second
        uint48 lastUpdated; // Last time the rate was accumulated
        uint256 fixedRate; // fixed rate applied to each loan of the group
    }

    // Interest Rate Groups are identified by a `uint` and stored in a mapping
    mapping(uint256 => Rate) public rates;

    // mapping of all loan debts
    // the debt is stored as pie
    // pie is defined as pie = debt/chi therefore debt = pie * chi
    // where chi is the accumulated interest rate index over time
    mapping(uint256 => uint256) public pie;
    // loan => rate
    mapping(uint256 => uint256) public loanRates;

    // Events
    event IncreaseDebt(uint256 indexed loan, uint256 currencyAmount);
    event DecreaseDebt(uint256 indexed loan, uint256 currencyAmount);
    event SetRate(uint256 indexed loan, uint256 rate);
    event ChangeRate(uint256 indexed loan, uint256 newRate);
    event File(bytes32 indexed what, uint256 rate, uint256 value);

    constructor() {
        // pre-definition for loans without interest rates
        rates[0].chi = ONE;
        rates[0].ratePerSecond = ONE;

        wards[msg.sender] = 1;
        emit Rely(msg.sender);
    }

    // --- Public Debt Methods  ---
    // increases the debt of a loan by a currencyAmount
    // a change of the loan debt updates the rate debt and total debt
    function incDebt(uint256 loan, uint256 currencyAmount) external auth {
        uint256 rate = loanRates[loan];
        require(
            block.timestamp == rates[rate].lastUpdated,
            "rate-group-not-updated"
        );
        currencyAmount = safeAdd(
            currencyAmount,
            rmul(currencyAmount, rates[rate].fixedRate)
        );
        uint256 pieAmount = toPie(rates[rate].chi, currencyAmount);

        pie[loan] = safeAdd(pie[loan], pieAmount);
        rates[rate].pie = safeAdd(rates[rate].pie, pieAmount);

        emit IncreaseDebt(loan, currencyAmount);
    }

    // decrease the loan's debt by a currencyAmount
    // a change of the loan debt updates the rate debt and total debt
    function decDebt(uint256 loan, uint256 currencyAmount) external auth {
        uint256 rate = loanRates[loan];
        require(
            block.timestamp == rates[rate].lastUpdated,
            "rate-group-not-updated"
        );
        uint256 pieAmount = toPie(rates[rate].chi, currencyAmount);

        pie[loan] = safeSub(pie[loan], pieAmount);
        rates[rate].pie = safeSub(rates[rate].pie, pieAmount);

        emit DecreaseDebt(loan, currencyAmount);
    }

    // returns the current debt based on actual block.timestamp (now)
    function debt(uint256 loan) external view returns (uint256) {
        uint256 rate_ = loanRates[loan];
        uint256 chi_ = rates[rate_].chi;
        if (block.timestamp >= rates[rate_].lastUpdated) {
            chi_ = chargeInterest(
                rates[rate_].chi,
                rates[rate_].ratePerSecond,
                rates[rate_].lastUpdated
            );
        }
        return toAmount(chi_, pie[loan]);
    }

    // returns the total debt of a interest rate group
    function rateDebt(uint256 rate) external view returns (uint256) {
        uint256 chi_ = rates[rate].chi;
        uint256 pie_ = rates[rate].pie;

        if (block.timestamp >= rates[rate].lastUpdated) {
            chi_ = chargeInterest(
                rates[rate].chi,
                rates[rate].ratePerSecond,
                rates[rate].lastUpdated
            );
        }
        return toAmount(chi_, pie_);
    }

    // --- Interest Rate Group Implementation ---

    // set rate loanRates for a loan
    function setRate(uint256 loan, uint256 rate) external auth {
        require(pie[loan] == 0, "non-zero-debt");
        // rate category has to be initiated
        require(rates[rate].chi != 0, "rate-group-not-set");
        loanRates[loan] = rate;
        emit SetRate(loan, rate);
    }

    // change rate loanRates for a loan
    function changeRate(uint256 loan, uint256 newRate) external auth {
        require(rates[newRate].chi != 0, "rate-group-not-set");
        uint256 currentRate = loanRates[loan];
        drip(currentRate);
        drip(newRate);
        uint256 pie_ = pie[loan];
        uint256 debt_ = toAmount(rates[currentRate].chi, pie_);
        rates[currentRate].pie = safeSub(rates[currentRate].pie, pie_);
        pie[loan] = toPie(rates[newRate].chi, debt_);
        rates[newRate].pie = safeAdd(rates[newRate].pie, pie[loan]);
        loanRates[loan] = newRate;
        emit ChangeRate(loan, newRate);
    }

    // set/change the interest rate of a rate category
    function file(
        bytes32 what,
        uint256 rate,
        uint256 value
    ) external auth {
        if (what == "rate") {
            require(value != 0, "rate-per-second-can-not-be-0");
            if (rates[rate].chi == 0) {
                rates[rate].chi = ONE;
                rates[rate].lastUpdated = uint48(block.timestamp);
            } else {
                drip(rate);
            }
            rates[rate].ratePerSecond = value;
        } else if (what == "fixedRate") {
            rates[rate].fixedRate = value;
        } else revert("unknown parameter");

        emit File(what, rate, value);
    }

    // accrue needs to be called before any debt amounts are modified by an external component
    function accrue(uint256 loan) external {
        drip(loanRates[loan]);
    }

    // drip updates the chi of the rate category by compounding the interest and
    // updates the total debt
    function drip(uint256 rate) public {
        if (block.timestamp >= rates[rate].lastUpdated) {
            (uint256 chi, ) = compounding(
                rates[rate].chi,
                rates[rate].ratePerSecond,
                rates[rate].lastUpdated,
                rates[rate].pie
            );
            rates[rate].chi = chi;
            rates[rate].lastUpdated = uint48(block.timestamp);
        }
    }
}


// File @1754-factory/tinlake/src/borrower/fabs/pile.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

contract PileFab {
    function newPile() public returns (address) {
        Pile pile = new Pile();
        pile.rely(msg.sender);
        pile.deny(address(this));
        return address(pile);
    }
}


// File @1754-factory/tinlake/src/borrower/fabs/title.sol@v0.0.1

// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.10;

contract TitleFab {
    function newTitle(string memory name, string memory symbol)
        public
        returns (address)
    {
        Title title = new Title(name, symbol);
        title.rely(msg.sender);
        title.deny(address(this));
        return address(title);
    }
}


// File src/TinlakeDeployer/TinlakeDeployer.sol

pragma solidity ^0.8.13;











contract TinlakeDeployer is Ownable {}


// File src/Contract.sol

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Contract {}
