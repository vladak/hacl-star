open SharedDefs

open Test_utils

type 'a hmac_test =
  { alg: HashDefs.alg; name: string ; key: 'a ; data: 'a ; expected: 'a }

let tests = [
  {
    alg = SHA2_256; name = "SHA2_256 Test 1";
    key = Bytes.of_string "\x4a\x65\x66\x65";
    data = Bytes.of_string "\x77\x68\x61\x74\x20\x64\x6f\x20\x79\x61\x20\x77\x61\x6e\x74\x20\x66\x6f\x72\x20\x6e\x6f\x74\x68\x69\x6e\x67\x3f";
    expected = Bytes.of_string "\x5b\xdc\xc1\x46\xbf\x60\x75\x4e\x6a\x04\x24\x26\x08\x95\x75\xc7\x5a\x00\x3f\x08\x9d\x27\x39\x83\x9d\xec\x58\xb9\x64\xec\x38\x43"
  };
  {
    alg = SHA2_384; name = "SHA2_384 Test 1";
    key = Bytes.of_string "\x4a\x65\x66\x65";
    data = Bytes.of_string "\x77\x68\x61\x74\x20\x64\x6f\x20\x79\x61\x20\x77\x61\x6e\x74\x20\x66\x6f\x72\x20\x6e\x6f\x74\x68\x69\x6e\x67\x3f";
    expected = Bytes.of_string "\xaf\x45\xd2\xe3\x76\x48\x40\x31\x61\x7f\x78\xd2\xb5\x8a\x6b\x1b\x9c\x7e\xf4\x64\xf5\xa0\x1b\x47\xe4\x2e\xc3\x73\x63\x22\x44\x5e\x8e\x22\x40\xca\x5e\x69\xe2\xc7\x8b\x32\x39\xec\xfa\xb2\x16\x49"
  };
  {
    alg = SHA2_512; name = "SHA2_512 Test 1";
    key = Bytes.of_string "\x4a\x65\x66\x65";
    data = Bytes.of_string "\x77\x68\x61\x74\x20\x64\x6f\x20\x79\x61\x20\x77\x61\x6e\x74\x20\x66\x6f\x72\x20\x6e\x6f\x74\x68\x69\x6e\x67\x3f";
    expected = Bytes.of_string "\x16\x4b\x7a\x7b\xfc\xf8\x19\xe2\xe3\x95\xfb\xe7\x3b\x56\xe0\xa3\x87\xbd\x64\x22\x2e\x83\x1f\xd6\x10\x27\x0c\xd7\xea\x25\x05\x54\x97\x58\xbf\x75\xc0\x5a\x99\x4a\x6d\x03\x4f\x65\xf8\xf0\xe6\xfd\xca\xea\xb1\xa3\x4d\x4a\x6b\x4b\x63\x6e\x07\x0a\x38\xbc\xe7\x37"
  };
  {
    alg = SHA2_256; name = "SHA2_256 Test 2";
    key = Bytes.of_string "\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19";
    data = Bytes.of_string "\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd";
    expected = Bytes.of_string "\x82\x55\x8a\x38\x9a\x44\x3c\x0e\xa4\xcc\x81\x98\x99\xf2\x08\x3a\x85\xf0\xfa\xa3\xe5\x78\xf8\x07\x7a\x2e\x3f\xf4\x67\x29\x66\x5b"
  };
  {
    alg = SHA2_384; name = "SHA2_384 Test 2";
    key = Bytes.of_string "\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19";
    data = Bytes.of_string "\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd";
    expected = Bytes.of_string "\x3e\x8a\x69\xb7\x78\x3c\x25\x85\x19\x33\xab\x62\x90\xaf\x6c\xa7\x7a\x99\x81\x48\x08\x50\x00\x9c\xc5\x57\x7c\x6e\x1f\x57\x3b\x4e\x68\x01\xdd\x23\xc4\xa7\xd6\x79\xcc\xf8\xa3\x86\xc6\x74\xcf\xfb"
  };
  {
    alg = SHA2_512; name = "SHA2_512 Test 2";
    key = Bytes.of_string "\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19";
    data = Bytes.of_string "\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd";
    expected = Bytes.of_string "\xb0\xba\x46\x56\x37\x45\x8c\x69\x90\xe5\xa8\xc5\xf6\x1d\x4a\xf7\xe5\x76\xd9\x7f\xf9\x4b\x87\x2d\xe7\x6f\x80\x50\x36\x1e\xe3\xdb\xa9\x1c\xa5\xc1\x1a\xa2\x5e\xb4\xd6\x79\x27\x5c\xc5\x78\x80\x63\xa5\xf1\x97\x41\x12\x0c\x4f\x2d\xe2\xad\xeb\xeb\x10\xa2\x98\xdd"
  }
]

let test_agile (v: Bytes.t hmac_test) =
  let test_result = test_result ("Agile EverCrypt.HMAC with " ^ v.name) in

  let tag = Test_utils.init_bytes (Bytes.length v.expected) in

  if EverCrypt.HMAC.is_supported_alg v.alg then begin
    EverCrypt.HMAC.mac v.alg tag v.key v.data;
    if Bytes.compare tag v.expected = 0 then
      test_result Success ""
    else
      test_result Failure "MAC mismatch"
  end
  else
    test_result Failure "hash algorithm reported as not supported"

let test_nonagile (v: Bytes.t hmac_test) t alg mac =
  if v.alg = alg then
    let test_result = test_result (t ^ "_" ^ v.name) in

    let tag = Test_utils.init_bytes (Bytes.length v.expected) in

    mac ~key:v.key ~msg:v.data ~tag;
    if Bytes.compare tag v.expected = 0 then
      test_result Success ""
    else
      test_result Failure "MAC mismatch"


let _ =
  List.iter test_agile tests;
  List.iter (fun v -> test_nonagile v "EverCrypt.HMAC" SHA2_256 EverCrypt.HMAC_SHA2_256.mac) tests;
  List.iter (fun v -> test_nonagile v "EverCrypt.HMAC" SHA2_384 EverCrypt.HMAC_SHA2_384.mac) tests;
  List.iter (fun v -> test_nonagile v "EverCrypt.HMAC" SHA2_512 EverCrypt.HMAC_SHA2_512.mac) tests;
  List.iter (fun v -> test_nonagile v "Hacl.HMAC" SHA2_256 Hacl.HMAC_SHA2_256.mac) tests;
  List.iter (fun v -> test_nonagile v "Hacl.HMAC" SHA2_384 Hacl.HMAC_SHA2_384.mac) tests;
  List.iter (fun v -> test_nonagile v "Hacl.HMAC" SHA2_512 Hacl.HMAC_SHA2_512.mac) tests

