Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 141029B31B7
	for <lists+samba-technical@lfdr.de>; Mon, 28 Oct 2024 14:30:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=VmXEL7pX24Qm5aXZ0wNVg8RAoVTRxIn957sRRHbp64E=; b=YUmslDuIX2Kj8AeOJz25WJxDQq
	gW9FvXmJY3bLtst/xMHKfBiNGoLZpnzhl+1tYQX/qPxUvw7pIwtHQDKoNy2qJqkUR5GznTGHEUUgR
	mYaOWkLFuCX5/rnsFgrjODDdEgMsSwhuKiExYQ5EvuFqJzn8heTXEuOIfmk8s8OGbi/KKt7/Yk6PZ
	As3H6lZH78iBvzPFbbBmPMNCYbXlVqETPOHQsRdHMUZqfAgXSckJL5eS3k0SeOE3EkKTttDl7+SeL
	3csTQsBD7RXz9fNctnOggKbmiH9Lj2GTXFiTDNu/ULGyTor/JQWsrhqu/T/YhGyhH46jCyh317N35
	TZon/eUQ==;
Received: from ip6-localhost ([::1]:58500 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t5Pot-005Kk1-MP; Mon, 28 Oct 2024 13:30:07 +0000
Received: from plasma6.jpberlin.de ([80.241.56.68]:54483) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t5Pon-005Kjq-HJ
 for samba-technical@lists.samba.org; Mon, 28 Oct 2024 13:30:04 +0000
Received: from spamfilter04.heinlein-hosting.de
 (spamfilter04.heinlein-hosting.de [80.241.56.122])
 by plasma.jpberlin.de (Postfix) with ESMTP id 1B03AA79B9;
 Mon, 28 Oct 2024 14:29:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1730122196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VmXEL7pX24Qm5aXZ0wNVg8RAoVTRxIn957sRRHbp64E=;
 b=L6sYxD+uza48Ni2Mvl7DCuct+B9Mxx46GFmR31+o89okxgoyWEByCfZMRcItmPpeEDZiAH
 TxMOx8rWO3hHU3cIaUQIPQiBbn+y8cZPlcMoHaddSQbZycH65U12DE0ybtNikES5n1byH8
 GVaOfhRmP51gHgjPbdaty7gNfG43P3/AujRma8BVLVSUaPPQJAtwL0P4P2EsIaEGtY+W5M
 pgylbh/DYKPExPLDMYhQ5R5CK2uVSPh6Tg/5WzuilozL22Vujd9SqJNL9cjeON+Qx5B0CP
 bnsDlHjOR5hZHrZQikLbGq3Fuukt2qM9P9LC65FF0g4knLwoBF4+w+6UPP9y5g==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id 7GL28_rv3oPF; Mon, 28 Oct 2024 14:29:47 +0100 (CET)
Received: from [192.168.123.203] (p5b240946.dip0.t-ipconnect.de [91.36.9.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 03054AB883;
 Mon, 28 Oct 2024 14:29:44 +0100 (CET)
Message-ID: <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
Date: Mon, 28 Oct 2024 14:29:43 +0100
MIME-Version: 1.0
Subject: Re: authentication policies in Samba 4.21
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
Content-Language: en-US, de-DE
Organization: Stefan Kania
In-Reply-To: <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0wMgBprrxQfqMA3zJHE6drFx"
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
From: Stefan Kania via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Kania <stefan@kania-online.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0wMgBprrxQfqMA3zJHE6drFx
Content-Type: multipart/mixed; boundary="------------FCpxtu6Qtv3eSipAtbRHkelr";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
Subject: Re: authentication policies in Samba 4.21
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
In-Reply-To: <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>

--------------FCpxtu6Qtv3eSipAtbRHkelr
Content-Type: multipart/mixed; boundary="------------C129w5RKuJHyJ0Pq6GDDvnug"

--------------C129w5RKuJHyJ0Pq6GDDvnug
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

U3RhcnRpbmcgZnJvbSB0aGUgYmVnaW5uaW5nLiBTZXQgdXAgdGhlIERvbWFpbiB3aXRoOg0K
c2FtYmEtdG9vbCBkb21haW4gcHJvdmlzaW9uIC0tZG9tYWluPWV4YW1wbGUgLS1yZWFsPWV4
YW1wbGUubmV0IA0KLS1ob3N0LWlwPTE5Mi4xNjguNTYuMjEgLS1iYWNrZW5kLXN0b3JlPW1k
YiAtLWRucy1iYWNrZW5kPUJJTkQ5X0RMWiANCi0tYWRtaW5wYXNzPVBhc3N3MHJkIC0tZnVu
Y3Rpb24tbGV2ZWw9MjAxNiAtLW9wdGlvbj0iYWQgZGMgZnVuY3Rpb25hbCANCmxldmVsID0g
MjAxNiINCg0KQ3JlYXRlIHNvbWUgdXNlcnMgYW5kIGdyb3Vwcy4NCg0KVGhlbiBzdGFydCB0
aGUgc2hvdzoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkNyZWF0aW5nIHRoZSB0d28g
R1BPDQoxLiBkZWZhdWx0IGRvbWFpbiBjb250cm9sbGVyIHBvbGljeQ0KU2V0dGluZyAgS0RD
IGZvciBjbGFpbXMNCg0KMi4gZGVmYXVsdCBkb21haW4gcG9saWN5DQpTZXR0aW5nIEtlcmJl
cm9zIGZvciBjbGFpbXMNCg0KMy4gQWxsIHN0ZXBzIHRvIGNyZWF0ZSB0aGUgYXV0aC1wb2xp
Y3kgYW5kIGF1dGgtc2lsbyBhbmQgYXNzaWduaW5nIHRoZSANCnBvbGljeQ0Kc2FtYmEtdG9v
bCBkb21haW4gIGF1dGggcG9saWN5IGNyZWF0ZSAtLW5hbWUgd2luMTEtcG9saWN5IC0tZW5m
b3JjZQ0Kc2FtYmEtdG9vbCBkb21haW4gIGF1dGggcG9saWN5IG1vZGlmeSAtLXVzZXItdGd0
LWxpZmV0aW1lLW1pbnM9OTAgLS1uYW1lIA0Kd2luMTEtcG9saWN5DQpzYW1iYS10b29sIGRv
bWFpbiBhdXRoIHNpbG8gY3JlYXRlIC0tbmFtZSB3aW4xMS1zaWxvIC0tZW5mb3JjZQ0Kc2Ft
YmEtdG9vbCBkb21haW4gYXV0aCBzaWxvIG1lbWJlciBncmFudCAtLW5hbWUgd2luMTEtc2ls
byAtLW1lbWJlcj1zdGthDQpzYW1iYS10b29sIGRvbWFpbiBhdXRoIHNpbG8gbWVtYmVyIGdy
YW50IC0tbmFtZSB3aW4xMS1zaWxvIA0KLS1tZW1iZXI9V0lOQ0xJRU5UMTFcJA0Kc2FtYmEt
dG9vbCBkb21haW4gIGF1dGggcG9saWN5IHVzZXItYWxsb3dlZC10by1hdXRoZW50aWNhdGUt
dG8gc2V0IA0KLS1ieS1zaWxvPXdpbjExLXNpbG8gLS1uYW1lPXdpbjExLXBvbGljeQ0Kc2Ft
YmEtdG9vbCB1c2VyIGF1dGggcG9saWN5IGFzc2lnbiAtLXBvbGljeSB3aW4xMS1wb2xpY3kg
c3RrYQ0Kc2FtYmEtdG9vbCB1c2VyIGF1dGggcG9saWN5IGFzc2lnbiAtLXBvbGljeSB3aW4x
MS1wb2xpY3kgd2luY2xpZW50MTFcJA0KDQo0LiBUcnkgdG8gbG9naW4gaW4gdG8gd2luY2xp
ZW50MTEgYXMgdXNlciBzdGthDQpnZXR0aW5nIHRoZSBtZXNzYWdlOg0KVGhlcmUgaXMgYSB0
aW1lIGFuZC9vciBkYXRlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgc2VydmVyIGFuZCB0aGUg
Y2xpZW50DQoNClNob3VsZCBiZToNCllvdXIgYWNjb3VudCBpcyBjb25maWd1cmVkIHRvIHBy
ZXZlbnQgeW91IGZyb20gdXNpbmcgdGhpcyB2UEMuIFBsZWFzZSANCnRyeSBhbm90aGVyIFBD
DQoNCjUuIFRyeSB0byBsb2dpbiB0byBhIGRpZmZlcmVudCBjb21wdXRlciBhcyB1c2VyIHN0
a2ENCkdldHRpbmcgdGhlIHNhbWUgbWVzc2FnZSBmb3IgdXNlciBzdGthLiBBbGwgb3RoZXIg
dXNlcnMgc3RpbGwgd29yaw0KDQo2LiBSZXZva2UgdXNlciBmcm9tIHBvbGljeSBhbmQgcmVt
b3ZlIGFzc2lnbm1lbnQgZnJvbSB1c2VyDQpzYW1iYS10b29sIGRvbWFpbiBhdXRoIHNpbG8g
bWVtYmVyIHJldm9rZSAtLW5hbWUgd2luMTEtc2lsbyAtLW1lbWJlcj1zdGthDQpzYW1iYS10
b29sIHVzZXIgYXV0aCBwb2xpY3kgcmVtb3ZlIHN0a2ENCg0KVXNlciBhZ2FpbiBjYW4gbG9n
aW4gdG8gYWxsIHN5c3RlbXMNCjcuIFJlYXNzaWduaW5nIHRoZSBwb2xpY3kgYW5kIGFkZCB1
c2VyIHRvIHNpbG8gYWdhaW4uIEhlIGNhbiBsb2cgaW4gdG8gDQphbGwgc3lzdGVtcy4NCnNh
bWJhLXRvb2wgZG9tYWluIGF1dGggc2lsbyBtZW1iZXIgZ3JhbnQgLS1uYW1lIHdpbjExLXNp
bG8gLS1tZW1iZXI9c3RrYQ0KDQpzYW1iYS10b29sIHVzZXIgYXV0aCBwb2xpY3kgYXNzaWdu
IC0tcG9saWN5IHdpbjExLXBvbGljeSBzdGthDQoNCnJvb3RAZGMwMTp+IyBsZGJzZWFyY2gg
LS11cmw9L3Zhci9saWIvc2FtYmEvcHJpdmF0ZS9zYW0ubGRiIENOPXN0a2EgDQotLWNyb3Nz
LW5jcyAtVSBhZG1pbmlzdHJhdG9yDQojIHJlY29yZCAxDQpkbjogQ049c3RrYSxPVT1maXJt
YSxEQz1leGFtcGxlLERDPW5ldA0Kb2JqZWN0Q2xhc3M6IHRvcA0Kb2JqZWN0Q2xhc3M6IHBl
cnNvbg0Kb2JqZWN0Q2xhc3M6IG9yZ2FuaXphdGlvbmFsUGVyc29uDQpvYmplY3RDbGFzczog
dXNlcg0KY246IHN0a2ENCmluc3RhbmNlVHlwZTogNA0Kd2hlbkNyZWF0ZWQ6IDIwMjQxMDI1
MTcxMzU5LjBaDQp1U05DcmVhdGVkOiA0MTk1DQpuYW1lOiBzdGthDQpvYmplY3RHVUlEOiBk
YWE5Mjk3NS0xODVmLTRjOWItOTBhMy1kMTNkYTgxMDhhYmYNCmJhZFB3ZENvdW50OiAwDQpj
b2RlUGFnZTogMA0KY291bnRyeUNvZGU6IDANCmJhZFBhc3N3b3JkVGltZTogMA0KbGFzdExv
Z29mZjogMA0KcHJpbWFyeUdyb3VwSUQ6IDUxMw0Kb2JqZWN0U2lkOiBTLTEtNS0yMS03NzI5
MTgzMTgtMjg1NzE5Mjc2MC0yMjkxMzM3OTkxLTExMDQNCmFjY291bnRFeHBpcmVzOiA5MjIz
MzcyMDM2ODU0Nzc1ODA3DQpzQU1BY2NvdW50TmFtZTogc3RrYQ0Kc0FNQWNjb3VudFR5cGU6
IDgwNTMwNjM2OA0KdXNlclByaW5jaXBhbE5hbWU6IHN0a2FAZXhhbXBsZS5uZXQNCm9iamVj
dENhdGVnb3J5OiBDTj1QZXJzb24sQ049U2NoZW1hLENOPUNvbmZpZ3VyYXRpb24sREM9ZXhh
bXBsZSxEQz1uZXQNCnB3ZExhc3RTZXQ6IDEzMzc0MzUwMDM5OTMxOTQwNA0KdXNlckFjY291
bnRDb250cm9sOiA1MTINCm1lbWJlck9mOiBDTj1hbGxlLE9VPWZpcm1hLERDPWV4YW1wbGUs
REM9bmV0DQptZW1iZXJPZjogQ049c2dyb3VwLE9VPWZpcm1hLERDPWV4YW1wbGUsREM9bmV0
DQpsYXN0TG9nb25UaW1lc3RhbXA6IDEzMzc0MzUyNDA1OTc2NjM3MA0KbXNEUy1BdXRoTlBv
bGljeVNpbG9NZW1iZXJzQkw6IENOPXdpbjExLXNpbG8sQ049QXV0aE4gU2lsb3MsQ049QXV0
aE4gDQpQb2xpY3kgQ28NCiAgbmZpZ3VyYXRpb24sQ049U2VydmljZXMsQ049Q29uZmlndXJh
dGlvbixEQz1leGFtcGxlLERDPW5ldA0KbXNEUy1Bc3NpZ25lZEF1dGhOUG9saWN5OiBDTj13
aW4xMS1wb2xpY3ksQ049QXV0aE4gUG9saWNpZXMsQ049QXV0aE4gDQpQb2xpY3kgQ28NCiAg
bmZpZ3VyYXRpb24sQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1leGFtcGxlLERD
PW5ldA0Kd2hlbkNoYW5nZWQ6IDIwMjQxMDI4MTMxMjU1LjBaDQp1U05DaGFuZ2VkOiA0MjY5
DQpsYXN0TG9nb246IDEzMzc0NTk0NzgzNzU4NDYxMA0KbG9nb25Db3VudDogMjMNCmRpc3Rp
bmd1aXNoZWROYW1lOiBDTj1zdGthLE9VPWZpcm1hLERDPWV4YW1wbGUsREM9bmV0DQoNCjgu
IENoYW5nZSB0aGUgY29uZGl0aW9uIHRvOg0Kc2FtYmEtdG9vbCBkb21haW4gYXV0aCBwb2xp
Y3kgbW9kaWZ5IC0tbmFtZSB3aW4xMS1wb2xpY3kgDQotLXVzZXItYWxsb3dlZC10by1hdXRo
ZW50aWNhdGUtdG89Ik86U1lHOlNZRDooWEE7T0lDSTtDUjs7O1dEOyhAVVNFUi5hZDovL2V4
dC9BdXRoZW50aWNhdGlvblNpbG8gDQohPSBcIndpbjExLXNpbG9cIikpIg0KDQpEaWQgbm90
IGNoYW5nZSBhbnl0aGluZy4NCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpFaXRo
ZXIgSSdtIHN0aWxsIGRvaW5nIHNvbWV0aGluZyB3cm9uZywgb3IgdGhlIGF1dGgtcG9saWN5
IGlzIHN0aWxsIE5PVCANCndvcmtpbmcgd2l0aCBTYW1iYSA0LjIxLg0KDQoNCg==
--------------C129w5RKuJHyJ0Pq6GDDvnug
Content-Type: application/pgp-keys; name="OpenPGP_0x52F6D4DD1BB68AB5.asc"
Content-Disposition: attachment; filename="OpenPGP_0x52F6D4DD1BB68AB5.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZD5zHxYJKwYBBAHaRw8BAQdAMVmXn59f0nkYv5WMsQq+KrcYCsNfaUj/WZtg
zdF72yDNJVN0ZWZhbiBLYW5pYSA8c3RlZmFuQGthbmlhLW9ubGluZS5kZT7CiQQT
FggAMRYhBGxP1rNZHkCiVplAgVL21N0btoq1BQJkPnNQAhsDBAsJCAcFFQgJCgsF
FgIDAQAACgkQUvbU3Ru2irXx0QEAtwVwH3XaKI4V5K8xNBFjLCvNHZsOBiF1zXRe
V3+ocvcA/i+HTEj2s+Xw0AdOCzTKpUetOkifYMHmRdzoRdjItaUIzjgEZD5zHxIK
KwYBBAGXVQEFAQEHQLCpLYCfOAWfcF2Za/K3FymUQPfyIZ/eupKMlQrGRJUhAwEI
B8J4BBgWCAAgFiEEbE/Ws1keQKJWmUCBUvbU3Ru2irUFAmQ+c1ACGwwACgkQUvbU
3Ru2irV69QEAxwzfX/shQahBfmica2GbWv7hytmlnu/QFNP2WNDb/9MA/133+PWv
q8PePaEGS4s2tRUd8ktDKmVYz7EnJwaCyqcH
=3Dxppn
-----END PGP PUBLIC KEY BLOCK-----

--------------C129w5RKuJHyJ0Pq6GDDvnug--

--------------FCpxtu6Qtv3eSipAtbRHkelr--

--------------0wMgBprrxQfqMA3zJHE6drFx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZx+RxwUDAAAAAAAKCRBS9tTdG7aKtaoU
AQC1JoHWp86K9xJp6Txb+7wR5Ol3x7SykAfK3Y1aroOanQD5AdD79gWE+r/3xK8T2DU9PUUU8mW+
hPP/DXmZtx0GNgM=
=AF/h
-----END PGP SIGNATURE-----

--------------0wMgBprrxQfqMA3zJHE6drFx--

