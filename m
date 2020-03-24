Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A351908DF
	for <lists+samba-technical@lfdr.de>; Tue, 24 Mar 2020 10:16:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=GLbs6Qg1eT6JD3PUvI7k2aHX0F2/F3ytGX64IHy9EPI=; b=ascCqBiXHsTqYak5rmLmaa5Gw5
	CJd9SrzAc3XdqxS/kOS7/HCsPAmBY+o3YVhnX35Qa9gGkXn7xYHVSymUiYPoDoKItx8Rnl+JIsntW
	36NhWOIMraa5EUO6UCaK4nMbnpSWUltt96+5w57E7FcZjNKsMfT/NqLwFcp4GRjU45KGdTy2EDabd
	poOGEj41JOUFCmpTdRG0C5IwebnhWqYGr0N5icQCXFKMXVjaXYr1LbLN5k15wMFnYOD4t7P72x+lO
	sBFgZttNBsAwNgldtMGQQQNx4yN0zorn+XZufr4YUP1IM7fEmnkZX4PGk49Sm0DgnEgq7GzTj3wny
	XxJFiZ2w==;
Received: from localhost ([::1]:25682 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jGfes-000X8W-LS; Tue, 24 Mar 2020 09:15:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51738) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jGfeo-000X8P-8t
 for samba-technical@lists.samba.org; Tue, 24 Mar 2020 09:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=GLbs6Qg1eT6JD3PUvI7k2aHX0F2/F3ytGX64IHy9EPI=; b=Eb9mFkavLIVCfbJOoUVIAx6je1
 1sg8hxyf5x15mfr5OoAwZXf+BpuplCK1C+yiY3yEGMh+qUBj/HIS8MupX4cjMIw/vcPrurhtRaPQL
 EiQUe0vtAfU462H6qyjbdY/yb4Hxo8x44eGdBXDLfpcLLgvLNTT/kRaB5zJGg0o49h9z6HNwkZOyx
 5cPilL6RnknKKbvMn7qMdCBKMK34Yh06Am2j7Vy6Ax4kw+uPcawaYWI2c3Chx68vS7bpn4STRFNnd
 sLjJweWG8Tj4wL0imHxr8dioiVsO+gW9ewu7YzVN1z9d7NVQUoqr0hv0bXYO33H4H/d9EwTtZp00y
 /nmIzqPFO8s54AscORccK5WZQA+TeYdvSWbGU+oHrIISUYftjcp9MiP4SC4yw0SXQHpnhz0iP+5Ei
 Da4O4j5ygJJbSSYWBAXISVsBV7V8M4mwaLMoIV7lN29cz+HkgQ/bdp7PuTGV+pCg9S/RZukoD6xSP
 ou1R+F3vx5fmaCnX3aFiLkY3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jGfen-00042J-MF
 for samba-technical@lists.samba.org; Tue, 24 Mar 2020 09:15:33 +0000
To: samba-technical@lists.samba.org
Subject: Flapping drs replica_sync test
Date: Tue, 24 Mar 2020 10:15:31 +0100
Message-ID: <1654325.iZmO6VesHS@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

the samba-ad-dc4 job fails for me very often in CI and always with the same 
error:

UNEXPECTED(error): 
samba4.drs.replica_sync.python(vampire_dc).replica_sync.DrsReplicaSyncTestCase.test_ReplConflictsRemoteWin_with_child(vampire_dc:local)
REASON: Exception: Exception: Traceback (most recent call last):
  File "/tmp/samba-testbase/b21/samba-ad-dc-2/source4/torture/drs/python/
replica_sync.py", line 278, in test_ReplConflictsRemoteWin_with_child
    self.ou2 = self._create_ou(self.ldb_dc2, "OU=Test Parent Remote Conflict")
  File "/tmp/samba-testbase/b21/samba-ad-dc-2/source4/torture/drs/python/
replica_sync.py", line 126, in _create_ou
    samdb.add_ldif(ldif)
  File "bin/python/samba/__init__.py", line 230, in add_ldif
    self.add(msg, controls)
_ldb.LdbError: (68, 'LDAP error 68 LDAP_ENTRY_ALREADY_EXISTS -  <Entry OU=Test 
Parent Remote Conflict,OU=replica_sync1279459,DC=samba,DC=example,DC=com 
already exists> <>')
FAILED (0 failures, 1 errors and 0 unexpected successes in 0 testsuites)


Why does that entry already exist? Missing cleanup or timing issue?



	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



