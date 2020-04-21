Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 278651B1C5A
	for <lists+samba-technical@lfdr.de>; Tue, 21 Apr 2020 05:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=LoWESeIpMF7OxmcC/QgUNWBUj7YSsoAc3GveT4i4nAA=; b=GVcSy4Ehzu8f2ZyIJLRozuhx44
	LLqlQ6JTRR7gGpxCMOfqkTIxX86exbAFywyBPRzfFNwuE/HaDWPNU6XB0vdw4veSJuvMqAmhKzix3
	erHcac0E0kHPvPaeCXL6d7BcnczAY7wmKxshUKudrMzppGk6J1QlSKeyZCOSfThJmyMbnbg9wHXio
	xGrAK/cyh9PLU8vO/baUQ7PjuRxJtWm+LOI8VPqbv9lERTIaKPkW23Vh5TttjI1OtzHRhS1fGjwGG
	ySuWuEuQZYfVY4lNDoweePMHW7N1eBWmuK9WpeiCnkNfequSkxHNBUvtuT3BxJFVo6gT1UzFBdLF1
	D0vUxU3A==;
Received: from localhost ([::1]:57820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jQjA2-001Kke-0k; Tue, 21 Apr 2020 03:01:22 +0000
Received: from mx.cjr.nz ([51.158.111.142]:14894) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jQj9s-001KkN-Re
 for samba-technical@lists.samba.org; Tue, 21 Apr 2020 03:01:15 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id B4721804E0;
 Tue, 21 Apr 2020 02:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1587437100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LoWESeIpMF7OxmcC/QgUNWBUj7YSsoAc3GveT4i4nAA=;
 b=L2vHT9O0iEUyHqHb+FcgupeoFzDokY+TXw71mVSfz3q3dJVu9eWbq6/Gw1YBtK/x4CvsTP
 IwdAtLc98J6JXvRA+evcpJFJ6u/SV8UHM1uuFcB/3jND1zfPZPcXl5+IqzOpJmESQVA6iN
 9WvQaqF8l/usubvxUf9Qh4GokFrY9zjluu/xHhbR7+imXuhZKtap/Ct0T1zz6NTblPmZEq
 7OEzJl88w20yk9keDc5EZ3MKuRPyjS2e4WUi/x05aL4fiXvOIdn8kfQc9ZZJG7pd51k60X
 9Cn1CqscVhadv6v87ke0qYYZDU8cccEzaLuxw4zWB7ctUd9xm+hbObKR4YkyxA==
To: linux-cifs@vger.kernel.org, smfrench@gmail.com,
 samba-technical@lists.samba.org
Subject: [PATCH 3/3] cifs: fix uninitialised lease_key in open_shroot()
Date: Mon, 20 Apr 2020 23:44:24 -0300
Message-Id: <20200421024424.3112-3-pc@cjr.nz>
In-Reply-To: <20200421024424.3112-1-pc@cjr.nz>
References: <20200421024424.3112-1-pc@cjr.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@cjr.nz>
Cc: Paulo Alcantara <pc@cjr.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SMB2_open_init() expects a pre-initialised lease_key when opening a
file with a lease, so set pfid->lease_key prior to calling it in
open_shroot().

This issue was observed when performing some DFS failover tests and
the lease key was never randomly generated.

Signed-off-by: Paulo Alcantara (SUSE) <pc@cjr.nz>
---
 fs/cifs/smb2ops.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index b36c46f48705..f829f4165d38 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -687,6 +687,11 @@ int open_shroot(unsigned int xid, struct cifs_tcon *tcon,
 	if (smb3_encryption_required(tcon))
 		flags |= CIFS_TRANSFORM_REQ;
 
+	if (!server->ops->new_lease_key)
+		return -EIO;
+
+	server->ops->new_lease_key(pfid);
+
 	memset(rqst, 0, sizeof(rqst));
 	resp_buftype[0] = resp_buftype[1] = CIFS_NO_BUFFER;
 	memset(rsp_iov, 0, sizeof(rsp_iov));
-- 
2.26.0


