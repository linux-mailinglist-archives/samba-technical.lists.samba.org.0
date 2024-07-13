Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B9640930395
	for <lists+samba-technical@lfdr.de>; Sat, 13 Jul 2024 05:30:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=uEEOz3EQbPQSkDhT0OVq2yxZ68kf71kUUsuUW2FoZNg=; b=4jM7eQMgHtPgjeJtexnv4p7Ek3
	p+b2ePemAP8E1eg1qa2fWkkngR0RMxlam9RZ39FtL3Hn6nijeWSclL/f9dfQLxjidSJ8XVZZddUbE
	DiRcbpI39r9ZvFxBebyY2jnpKNxdJFnBxBwafktHJ1xV0/Purlbd35kUuZNEcVNe/KoEIZjDZaJQh
	k7gYV1vmo2zuSRYenQW/EFsq4rgSigs9kfdUEp1hz9Vq6ObRCkHADncOsb5KCa6MF9evz5UkfYjTX
	cQ191dVLoXXPH1smHpuu2QSM14+0PQenMSUDUu55FjbTh6BC9ulHO9qizZQFxWNWqMVpFH/XZc8na
	QMYToNtg==;
Received: from ip6-localhost ([::1]:54228 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sSTSm-000Z2M-Fn; Sat, 13 Jul 2024 03:30:20 +0000
Received: from relay3.ptmail.sapo.pt ([212.55.154.23]:57304) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sSTSh-000Z2F-QX
 for samba-technical@lists.samba.org; Sat, 13 Jul 2024 03:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapo.pt;
 s=sapo20240325; t=1720840259;
 bh=uEEOz3EQbPQSkDhT0OVq2yxZ68kf71kUUsuUW2FoZNg=;
 h=From:To:Subject:Date:From;
 b=dGDucO4YZumBqaW3qkPr5ERhXl/BYrK1ZMxOAvNKxzNkz4Bau7wHry5x/1Th0ih4a
 oAviXOPKN48kwzGWneQU4DZw7CnHVuxDpPCkSJHOy1VG7un4PrkCCP5G0oNWQgK5SB
 BW6Cf5J5eMAoh/1lobeYYi7VIGb7nY86GIAGSqndhByeAtWGOtZ7Pzp9jYaV82JjDu
 okpxdSFc9VHMu42VIExNWjbEqksY+N0G9x0yQDiHkgyKuPWw8PD1d38G6ip6DxuxyU
 yDt9VctOthcJfE3nrOQxpOWhV0HTITpYppa25a7b2mifDcIEJukpi/wxwwLb5IA44x
 cSvFVItfzJluQ==
Received: from sapo.pt (unknown [10.134.36.76])
 by relay3.ptmail.sapo.pt (Postfix) with ESMTPS id 680EDB66593
 for <samba-technical@lists.samba.org>; Sat, 13 Jul 2024 04:10:59 +0100 (WEST)
Received: (qmail 31761 invoked from network); 13 Jul 2024 03:10:59 -0000
Received: from Sepher3 (unknown medalist@sapo.pt@[85.246.65.64])
 (envelope-sender <medalist@sapo.pt>)
 by ptmail-mta-auth02 (qmail-ptmail-1.0.0) with ESMTPSA
 for <samba-technical@lists.samba.org>; 13 Jul 2024 03:10:59 -0000
X-PTMail-RemoteIP: 85.246.65.64
X-PTMail-AllowedSender-Action: 
X-PTMail-Service: default
To: <samba-technical@lists.samba.org>
Subject: Error in the man page for "vfs_nfs4acl_xattr"
Date: Sat, 13 Jul 2024 04:10:59 +0100
Message-ID: <000701dad4d2$493917b0$dbab4710$@sapo.pt>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Content-Language: pt
Thread-Index: AdrU0c59DY/I1fjDQLaJdunRnG4BlA==
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
From: miguel medalha via samba-technical <samba-technical@lists.samba.org>
Reply-To: miguel medalha <medalist@sapo.pt>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The man page for the nfs4acl_xattr module contains an error. Near the top of
the page, under "Description", we can read:

"The vfs_acl_xattr VFS module stores NTFS Access Control Lists (ACLs) in
Extended Attributes (EAs/xattrs). This enables the full mapping of Windows
ACLs on Samba servers."

Looks like this description "leaked" from the " vfs_acl_xattr" man page...



