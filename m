Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AC14930F1
	for <lists+samba-technical@lfdr.de>; Tue, 18 Jan 2022 23:40:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=yqjcDkDLFuxD/E3IY7kN5HbG7Me5rWq+SC0fQFHJSCU=; b=DtZLOrY8UYaQHLznPVZ/XwkO9y
	2SkxMvftTWdzjdzlTMddJOx2g3CNWu8utgCCAHjShnm3ZX95prvBxlc9iDFc/pz5PxzfqSy+DoXmT
	SNjaWwfr0+ulSlitwmtJcNhl6eH/2iSaj+NkyblJjev9PXR4FRQNjKvaxLS+CvL6bIaQNReHe+g1T
	PR6Ovft7hQZJUGL70u0D6lkzAz2FVzQVYGlKOiTCh4CsAcppbAjlfLt3mjaa/AE2clYcDq+a6mWbd
	tBkltCVgh6MKBoE2bN3NPUnymeviqH9h27g/PEGyOHo2KRRqscaSnrQTyVHxXJDrpIrm59NC14ywC
	CUegoARg==;
Received: from ip6-localhost ([::1]:24826 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n9x9O-009gHS-E2; Tue, 18 Jan 2022 22:40:26 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:35345) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n9x9E-009gFz-S4
 for samba-technical@lists.samba.org; Tue, 18 Jan 2022 22:40:20 +0000
Received: by mail-lf1-x12c.google.com with SMTP id x11so1425339lfa.2
 for <samba-technical@lists.samba.org>; Tue, 18 Jan 2022 14:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=yqjcDkDLFuxD/E3IY7kN5HbG7Me5rWq+SC0fQFHJSCU=;
 b=ikQYOBQho1WQEk+6MPYwSlxb/cMjeYv6C784FHZww1zgXtO2sscmmkXUMrlQKKCDrA
 VlO8zKIJS92c+S/4lwFC4YNPqXGVwTsENkgWPuBXP1HPi3+8hu7rHcShgPawkUxf0on2
 1Yjn8swD/EvXh6d1unoKf3Wd6g+hYMpXWNl7JddD+L37wViRXBhATWI3joxEFYYDd0QE
 BsBWosUmuX58e2rU6/F6ZaMVqo719kd8I1TfYIPnGof2QnKi82URtJ5FqETG/7Z3GA9/
 BYEnVq6/Z5JN1Szq54siNIb6v62vS1/3uqtjW950JRG1WpMZStYZPCRDzz8qSqHi6z3y
 baUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yqjcDkDLFuxD/E3IY7kN5HbG7Me5rWq+SC0fQFHJSCU=;
 b=A6jRjCDKWN8u893ZVcyewKCajc8EsqSRlqXmBircfsWpIsfZX0BzX8MTUXjNLdIhdl
 5Hehq9Uwwmvall4p3fuPVhjrmjgrXi754HASVLd+L1JWLDeoUp4QsmxnAe1bIl4M6oLH
 a/a3x+4XDHp3Psj7ulBxM4jkXZjyG4z6CHQWvi0Foa6sMOzhQwERZP4vpcbqFyXxv/F0
 HX7i0D6RsDrXaI6RL2ZmTUSzOnIz0E12LWFFzN/2HRzyOBD/Pk6rIeJzNuUC0Bins499
 Ojje3sGJLMd+tKd68vkeKK5TY+JAh1FVXrDon6OfINsXDCW0n8qv2rurXWt1KJvtpXIZ
 y8+g==
X-Gm-Message-State: AOAM532RapGLu6xxwHEwNR9ls8ra5eif3wd+ix9DrHey1LcuIReFA9mC
 O+RxX3lBU4B1bP/tAs184LuR1BRQn2SIYlvMy3MBOeBTE7k=
X-Google-Smtp-Source: ABdhPJx7wt+iJsuUhXfvPvn17JqE5Ol++PQR8kFg7Zxhiu6ZUoVqek9wvXcqtMsQD37C7XRI5UujJa0wIPHbVQw5S/I=
X-Received: by 2002:a05:651c:1503:: with SMTP id
 e3mr19651971ljf.460.1642545615084; 
 Tue, 18 Jan 2022 14:40:15 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 18 Jan 2022 16:40:04 -0600
Message-ID: <CAH2r5msv5w5oWVomujjwoC=PiNBu3b7kbQO6uJXVKbAwxGKuJw@mail.gmail.com>
Subject: [PATCH][SMB3] add new defines from protocol specification
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Trivial update to list of valid smb3 fsctls

In the October updates to MS-SMB2 two additional FSCTLs
were described.  Add the missing defines for these,
as well as fix a typo in an earlier define.

Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smbfs_common/smb2pdu.h  | 2 +-
 fs/smbfs_common/smbfsctl.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/smbfs_common/smb2pdu.h b/fs/smbfs_common/smb2pdu.h
index 7ccadcbe684b..38b8fc514860 100644
--- a/fs/smbfs_common/smb2pdu.h
+++ b/fs/smbfs_common/smb2pdu.h
@@ -449,7 +449,7 @@ struct smb2_netname_neg_context {
  */

 /* Flags */
-#define SMB2_ACCEPT_TRANSFORM_LEVEL_SECURITY 0x00000001
+#define SMB2_ACCEPT_TRANSPORT_LEVEL_SECURITY 0x00000001

 struct smb2_transport_capabilities_context {
  __le16 ContextType; /* 6 */
diff --git a/fs/smbfs_common/smbfsctl.h b/fs/smbfs_common/smbfsctl.h
index 926f87cd6af0..d51939c43ad7 100644
--- a/fs/smbfs_common/smbfsctl.h
+++ b/fs/smbfs_common/smbfsctl.h
@@ -95,8 +95,10 @@
 #define FSCTL_SET_SHORT_NAME_BEHAVIOR 0x000901B4 /* BB add struct */
 #define FSCTL_GET_INTEGRITY_INFORMATION 0x0009027C
 #define FSCTL_GET_REFS_VOLUME_DATA   0x000902D8 /* See MS-FSCC 2.3.24 */
+#define FSCTL_SET_INTEGRITY_INFORMATION_EXT 0x00090380
 #define FSCTL_GET_RETRIEVAL_POINTERS_AND_REFCOUNT 0x000903d3
 #define FSCTL_GET_RETRIEVAL_POINTER_COUNT 0x0009042b
+#define FSCTL_REFS_STREAM_SNAPSHOT_MANAGEMENT 0x00090440
 #define FSCTL_QUERY_ALLOCATED_RANGES 0x000940CF
 #define FSCTL_SET_DEFECT_MANAGEMENT  0x00098134 /* BB add struct */
 #define FSCTL_FILE_LEVEL_TRIM        0x00098208 /* BB add struct */
-- 

-- 
Thanks,

Steve

