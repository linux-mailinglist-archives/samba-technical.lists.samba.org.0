Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F7C7D003D
	for <lists+samba-technical@lfdr.de>; Thu, 19 Oct 2023 19:09:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=qJfMo3LihXU+YUEQZOCHeeVs7gTzd9+1brz03yfpbso=; b=wUEMJ2xRwKudNqvwDBv7LWizOJ
	uRscKOJKoFkCp2mtHY4fneii+6LtesNhCeO6gWt70onefUk7OsnWjEsxVZlkjAWcj3dsDM6K/x6vz
	fTWjdhPcC7L3jN1u8Ejnpu+MwY4s0yTjHI8PuiL8J1pNGpiXTDw5V2xuuL2AL0s7Drk+nOJfOKOXv
	Wq1ovu5KiE6X0xj04+xxcnR0gL3+vt4R3fhdLRZWEr/MMToLjIdQC6WcpQVDXLaFz4aII2B7cqthG
	ipM1mgEBhjcuNUGquX5+sj7mq908Ug+yMrT9Lw/EDwE3ykyJIidyq572WU7CrUaA7OkfbdPmlBNFL
	nlTYdd0g==;
Received: from ip6-localhost ([::1]:60672 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qtWWR-001M0X-5r; Thu, 19 Oct 2023 17:09:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27468) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qtWWM-001M0O-8b
 for samba-technical@lists.samba.org; Thu, 19 Oct 2023 17:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=qJfMo3LihXU+YUEQZOCHeeVs7gTzd9+1brz03yfpbso=; b=lkBmy6UBpejwJ0XNzAdtvxEEKB
 KtbHR2Tc9g9CbKHxIybk+8DoCJSJU534ltSNNFikduMGsgm/sKi3l+sOuZbUiCI9AUqq8ntvjPksC
 wtilsLWRGH1oaSAPNVkqFzrOh+H9kH1E2q7bnCd58a+x50DdfS5kqAcYVYeauArnI7+M2/OkCimPw
 R/hS6tN8X5xT5UW+4M7ZW70QKYWeuQTuEPWbMAHkf1lCDaA6zdmh7tpYpcEJpPjbqXmPOOwIop3+F
 YUHyqSZ/qEg1ZP6bqhl+ZtJCGtog1moyt/HaHRpPWMfxhkIqTEOolNOW58nGDNq3jZx5BnRKmukAq
 cjcF6bNbTIdaKQniV9FQegn8wqTcOYNyX2Hv8p1EbrzeYaybJFBcST04132gejrblp5T3BQX0ozZq
 jyaWcpEG7XM7D6I0Y1E2YkDA/fQhgGc4vF+co3dr86d/62RqzEVlKtskXZqyn8kvMUh8wpsJ643Ob
 55+N9Gqe9+HHpNMs/PJ8+Q59;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qtWWL-001XBD-0G; Thu, 19 Oct 2023 17:09:17 +0000
Message-ID: <bb0a36f1-609d-4cb4-984f-be377375b3c0@samba.org>
Date: Thu, 19 Oct 2023 19:09:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: David Mulder <dmulder@samba.org>
Subject: SMB3-POSIX: Move section 3 inside section 2 as 2.3
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ljam2FcIDToVZqtayuLbx6Sd"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Tom Talpey <tom@talpey.com>,
 samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ljam2FcIDToVZqtayuLbx6Sd
Content-Type: multipart/mixed; boundary="------------Zy0993iZCzZ5WI6sTa4gAzQh";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: David Mulder <dmulder@samba.org>
Cc: Jeremy Allison <jra@samba.org>, Tom Talpey <tom@talpey.com>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <bb0a36f1-609d-4cb4-984f-be377375b3c0@samba.org>
Subject: SMB3-POSIX: Move section 3 inside section 2 as 2.3

--------------Zy0993iZCzZ5WI6sTa4gAzQh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgRGF2aWQsDQoNCndoYXQgd291bGQgYmUgeW91ciB0aG91Z2h0cyBvbiB0aGlzIG9uZT8N
Cg0KaHR0cHM6Ly9jb2RlYmVyZy5vcmcvU01CM1VOSVgvc21iM19wb3NpeF9zcGVjL3B1bGxz
LzMNCg0KQEplcmVteTogZG8geW91IHRoaW5rIHlvdSdkIGhhdmUgc29tZSBzcGFyZSB0aW1l
IHRvIHdvcmsgd2l0aCBtZSBvbiB0aGUgDQpzZWN0aW9uIDMgc2VydmVyIGJlaGF2aW9yIHN0
dWZmPw0KDQpDaGVlcnMhDQotc2xvdw0K

--------------Zy0993iZCzZ5WI6sTa4gAzQh--

--------------Ljam2FcIDToVZqtayuLbx6Sd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmUxYrwFAwAAAAAACgkQqh6bcSY5nkZa
Yw/9G3ApiPiBrrS59r0rVbgfK9P9N/qdUSl0xR8cqxWDDTyLqfK5PCq77ItYDcS9pxqXNh3/2MIi
8vRC/qt4fCoWUFzDf9Py8zOUAV9aFrqFqENNaRTGpMg+Oygo91U/1qWNIBH462bV4iut5mEzV+M2
Seku0Q7/Cw+yoj9NRwHs7I3fBySaWmhQZbwwnvn/llNZCZ+/G0n77rArYJ8iUaqQS7KSdQgRZpmm
iPWANU5SxOfYI8ke7W7WOo10xRHCsxKylL/6Wm1r2AIxZWMxaqmkXlyYq6Hr0QhTb5XfKG9Ps8ej
Mu7kp2ftu/FQMw1Ogt+iI4ZqoxoKL9coXcEnW/iKHO5kKnR063rB1jftYqco57Tl3MfAIrlPk4H/
hnmMd12qFemCYD7ErYQVSdyGYaHgmSD/oxjeEfWH08TfZBu8CA4cFDBnXIkzHV1HJizqS1DCud/Z
FgVO6d6vEzDfd7e0Sjeiqx3W9VBQxz34gKyzRNfNYgYizrmdQzjcD6eih1QKZbYFJ9yWBSJM6sG+
ssbKuDzsakEGxifsvoMLkV1+PXpPIQibgqBDRbPRp27dM30znvG7H6iOTJMFiPQG9xUEDP3Ssbe5
1xmdYChEHpuP3TLFC++mENAY/1eTf/RQLAytLr3tZwWsgVrzgF/qS3Pu8Fk0x7t8s9I/VtsZml7/
5e4=
=FzkN
-----END PGP SIGNATURE-----

--------------Ljam2FcIDToVZqtayuLbx6Sd--

