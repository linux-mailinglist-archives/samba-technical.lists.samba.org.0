Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E285321A11F
	for <lists+samba-technical@lfdr.de>; Thu,  9 Jul 2020 15:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=eQCG3qsjmK98yV0FHVtb5TTGWwI8S0ytVaimViekmug=; b=UBF6IqptIqS9uG1c8eriuL+wLE
	DXyNO0KBK5o3FEAAqBIdY9pR0xdS3r4zeZhAe0qyrnEX1441wrIOJTjTdMgvF2PrO1rTA/9iyFt45
	EwJI5JnIj+gDT9vuN/iXHEujqVWgk+8TN974IdAaU/wgscxN2AD9DUU37p1D59iHWt09HK/W4PlxN
	acHaF9zM3YYdHr5DIGXkzIWWHJUjU69WOWVGTD0Z6aaX5g2iUzvvMMsD+/h+Kzy2dkYOHfxdM5Hzy
	m4PbU9KHBM03LZrXYByveUypI/hoaIWANBavH1f1HA6qLzCI9mD4LUuxsN8RSIbwUFOq3P0ykqogg
	QOl+AiNA==;
Received: from localhost ([::1]:62468 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jtWsi-006RI2-0E; Thu, 09 Jul 2020 13:46:32 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:43692) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jtWsW-006RHu-Py
 for samba-technical@lists.samba.org; Thu, 09 Jul 2020 13:46:24 +0000
Received: by mail-oi1-x230.google.com with SMTP id x83so1882299oif.10
 for <samba-technical@lists.samba.org>; Thu, 09 Jul 2020 06:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=1UlmbQuQP+1MFZp9/knRbl0fu7LuOJYoWE/9jk4cfJs=;
 b=F4sIGKury72oNAhdE+fEqByy3nehZFC75N5LCZ+g6MZEeHkmc500lR4WAh4To8Uspw
 BRHF1czV7Ut38HMiiIoCvOr+O5TQk8YdbTfu8qBrpJ39wzYneGlQSvJmY6/rlLg1nDyX
 op4iWnISh8yUOJyB+pTSBBuougrV+eoSFmbDzaEUCsFtQ5KJNa4znZgKbXQgT7euNQ5k
 DK+IW6Wj47QSmoO0XJp8F9pFYoejtrWZI22qUZQzueKLAqtJHzYFmei2zUc5ecx3RT2O
 VDyB2YcyqR/rLrtopoP0ZhkZBQs3t5LTB2Pmc/ycegl4UDuQJRkr/8PYtjmi73JWnmP6
 4UEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1UlmbQuQP+1MFZp9/knRbl0fu7LuOJYoWE/9jk4cfJs=;
 b=Bkj122Ktx7TRd8tpRwrRwTnjyVOFKPr6oyr63kKzttsJviSfGmhk5eSz/ZTH+w5h71
 op0GRGZqQAWlCgc19XuGNcN6DF3QmLt5Aj9t2TQ5vPvrqxwTMNLihWiNsKMVI5xFjQmE
 e1PGPfoyfu8jQAyZro/cV+aADFWU5eDBweTXIUhAlOeZLvYOMudqrr1AuStZOy3Ng3vk
 DJVtN2usYJWBbaoHMdUIIQaYKxEaxVqYNe/o/RlysHSXn0vBAusMacdBXbDaKh2UHo5t
 5PCJ1RFIXRZSxBetxsJGMQw3MchQ9SP/vCwLA2a+ARk8ebf2gFEL6ksYFXi9nzEorAU3
 5orA==
X-Gm-Message-State: AOAM53300kFWKK675bGP63GecV9jGSo8USoMBJkuPVnZ8kp2O6Dy1zV/
 NOMnJD1yffhw0tdN8zsctid/BjZ3byTR9e8mm12LzV8nwcs=
X-Google-Smtp-Source: ABdhPJzo6OgJEN0H82kdRA1RkAM1+CgqDfeOGvlkWHPCPhcgZT++h6eB1D5lXrOwwvN211eP0j2C2nbjydt/w04PZeU=
X-Received: by 2002:aca:4e05:: with SMTP id c5mr50738oib.37.1594302377996;
 Thu, 09 Jul 2020 06:46:17 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 9 Jul 2020 09:46:07 -0400
Message-ID: <CAB5c7xp8YLavq8OVt=RCd8KL6uBYhBK=5=USfVjkNeV==X7LZA@mail.gmail.com>
Subject: Issue with open_file_nt_create() and NFSv4 ACLs (ZFS)
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

In principal, when using NFSv4 ACLs, the ACL on the parent directory will
determine the ACL on newly created files and directories. The problem is as
follows:

1) Admin removes CREATOR-OWNER, CREATOR-GROUP, and WORLD, which maps to
owner@, group@, everyone@ from the ACL, leaving only something like the
following when viewed server-side:

root@fbsd12build:/usr/ports/net/samba # getfacl /zroot/SMB/
# file: /zroot/SMB/
# owner: root
# group: wheel
      user:smbuser:rwxpDdaARWcCos:fd-----:allow
      user:awalker:rwxpDdaARWcCos:fd-----:allow

2) User creates new file, kernel sets correct inherited ACL, and samba then
calls SMB_VFS_CHMOD() on the file in open_file_nt_create() because "inherit
acls" is false and we short-circuit before calling
directory_has_default_acl(). This results in additional entries for owner@,
group@, and everyone@ being added to the new file, and upset sys admins.

I'm somewhat torn between how to handle this. There are very much a finite
number of brands of ACLs. My thought is that perhaps we can expand struct
connection_struct with an "acl_brand" enum (set perhaps in the
fs_capabilities function) so that we can do something like below  to
cleanly separate POSIX1E behavior from NFSv4 behavior (following is
sufficient to avoid the unwanted fchmod()). Then again, we could possibly
move more of this to the VFS.

--- a/source3/smbd/open.c
+++ b/source3/smbd/open.c
@@ -3638,10 +3638,24 @@ static NTSTATUS
open_file_ntcreate(connection_struct *conn,
        /*
         * Ensure we pay attention to default ACLs on directories if
required.
         */
-
-        if ((flags2 & O_CREAT) && lp_inherit_acls(SNUM(conn)) &&
-           (def_acl = directory_has_default_acl(conn, parent_dir))) {
-               unx_mode = (0777 & lp_create_mask(SNUM(conn)));
+       switch(conn->aclbrand) {
+       case SMB_ACL_BRAND_POSIX:
+               if ((flags2 & O_CREAT) && lp_inherit_acls(SNUM(conn)) &&
+                   (def_acl = directory_has_default_acl(conn,
parent_dir))) {
+                       unx_mode = (0777 & lp_create_mask(SNUM(conn)));
+               }
+               break;
+       default:
+               /*
+                * Pass along to VFS to determine whether the ACL has
+                * any inheriting entries.
+                */
+               if (flags2 & O_CREAT) {
+                       def_acl = directory_has_default_acl(conn,
parent_dir);
+               }
+               break;
        }
