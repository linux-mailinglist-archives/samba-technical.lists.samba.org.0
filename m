Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A212518AD
	for <lists+samba-technical@lfdr.de>; Tue, 25 Aug 2020 14:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=W5bHffG8Heq1sxIcp0xQ6WIPoyeJLLJg2L46eOXO5nU=; b=Kbaj6Dwt4dB8dcwfl0MiuwCWNy
	n5AZcou+6sg6ObYPgBR4DgQlRSjZVAv6FMPYOBBBFTFh6FAojS3T1KnlAy1K2ejCyEqTkhKyWunez
	bHqC+bBCNVX4MzmFDTv0WZuLMN3+mcsrWKBX2BiPYisLb6wF+FhOWA4HxvG6DEqen/OVv4yztbqrm
	v7+lInxK0QmluLJpCld/iI1JrXknzt0go985mYI8/909Uqc+qUpeycdRWmxGSUQxx9CCt4cc6ejJb
	ZKP1clyp55lBKOm7jcDDzHCZKCrlITfZw601nZhCIN5BejnXRYdzRYHAmU0ccuNoH+ZxThGN1eD2h
	EaQ7XVkw==;
Received: from localhost ([::1]:34256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kAYCW-000TUT-8S; Tue, 25 Aug 2020 12:37:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20220) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kAYCR-000TUM-De
 for samba-technical@lists.samba.org; Tue, 25 Aug 2020 12:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=W5bHffG8Heq1sxIcp0xQ6WIPoyeJLLJg2L46eOXO5nU=; b=WlXBboZORHkPF4b5qi4g1LeQh+
 gdgts5zLwMz3ZsGlrVnD/SSLInm87W/66vCWwaDNYYztkuZXuQSfrAAb21D0JhyLlbhEFYB6SOFc1
 wFno5e8mrVR3S/KIrR72r5w42zogd9q74WY5XbZ694mDoT/gFKig62DXOuZk5wJTLXm3DmPciQ/3+
 1+0GZXRvEYFj8F1ZYPbvi3T+XWxDyu149D36hsxUheUR2qccDV1lNWiBuUEhIQW3SWu+8l7o4wdRo
 hJDA3Wx7cMnScbANd1uuR3yNJBY//Gk3Ov7gdsjvl9w3je/AP0QiKFK4X2RFNIKR9a385itWbbf5W
 FoPnXOOhAb088QmPTbfthQWFkqQVtAb9k6j2AH5hIp4n1+cv8LAhBVPuWKM4M9BtjPVtyUnragx8P
 3YKs+IiQgbn2CIk+3xWOwub+DbUG/knu/T1DNyPQxv3+Mzz8FpgT9JCPbkohSzSHYq1f9H2LeaZya
 1NmfDaERGEB/QaUrIwV+912G;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kAYCP-0004WG-Jg
 for samba-technical@lists.samba.org; Tue, 25 Aug 2020 12:37:13 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [PATCH}pam_winbind grammar and typos
Message-ID: <66993582-b8b0-1d0b-65cf-3158487ea138@samba.org>
Date: Tue, 25 Aug 2020 13:37:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------AF7630E3591F59E33BC8726E"
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------AF7630E3591F59E33BC8726E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Attempt to fix the grammar and typos in the pam_winbind manpage, see 
attached patch.

Rowland



--------------AF7630E3591F59E33BC8726E
Content-Type: text/x-patch; charset=UTF-8;
 name="pam_winbind-manpage-grammar-and-typos.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="pam_winbind-manpage-grammar-and-typos.patch"

From 2ca75b1b3ec2eefb169b222177f6bce4a6e61e47 Mon Sep 17 00:00:00 2001
From: Rowland Penny <rpenny@samba.org>
Date: Tue, 25 Aug 2020 13:19:28 +0100
Subject: [PATCH] pam_winbind manpage: grammar and typos

Signed-off-by: Rowland Penny <rpenny@samba.org>
---
 docs-xml/manpages/pam_winbind.8.xml | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/docs-xml/manpages/pam_winbind.8.xml b/docs-xml/manpages/pam_winbind.8.xml
index 32030ef0ecc..171bb408757 100644
--- a/docs-xml/manpages/pam_winbind.8.xml
+++ b/docs-xml/manpages/pam_winbind.8.xml
@@ -165,23 +165,23 @@
 		(when the DIR type is supported by the system's Kerberos
 		library). In case of FILE a credential cache in the form of
 		/tmp/krb5cc_UID will be created -  in case of DIR you NEED
-		to specify a directory. UID is replaced with the numeric
-		user id. The UID directory is being created. The path up to
-		the directory should already exist. Check the details of the
-		Kerberos implmentation.</para>
+		to specify a directory which must exist, the UID directory
+		will be created in the specified directory.
+		In all cases UID is replaced with the numeric user id.
+		Check the details of the Kerberos implementation.</para>
 
 		<para>When using the KEYRING type, the supported mechanism is
 		<quote>KEYRING:persistent:UID</quote>, which uses the Linux
 		kernel keyring to store credentials on a per-UID basis.
-		The KEYRING has its limitations. As it is secure kernel memory,
-		for example bulk sorage of credentils is for not possible.</para>
+		KEYRING has limitations. For example, it is secure kernel memory,
+		so bulk storage of credentials is not possible.</para>
 
-		<para>When using th KCM type, the supported mechanism is
+		<para>When using the KCM type, the supported mechanism is
 		<quote>KCM:UID</quote>, which uses a Kerberos credential
-		manaager to store credentials on a per-UID basis similar to
+		manager to store credentials on a per-UID basis similar to
 		KEYRING. This is the recommended choice on latest Linux
-		distributions, offering a Kerberos Credential Manager. If not
-		we suggest to use KEYRING as those are the most secure and
+		distributions that offer a Kerberos Credential Manager. If not,
+		we suggest to use KEYRING, as those are the most secure and
 		predictable method.</para>
 
 		<para>It is also possible to define custom filepaths and use the "%u"
-- 
2.20.1


--------------AF7630E3591F59E33BC8726E--

