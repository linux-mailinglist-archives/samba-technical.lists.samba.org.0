Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 925BD5F20A9
	for <lists+samba-technical@lfdr.de>; Sun,  2 Oct 2022 01:51:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=mNlj1ar7MjAtt10PpJ5/PhVXSQp48TQeJStKYXUqZqM=; b=UY9LTCrgf4tlRO/almYI8kznAS
	4FGkC6Bx/TL9j4JfEHpN0fFYNhhH4hAaPYlAl/PO0SqUM14NcTpouUZzMPvAS17IOWZdEH4yiur/8
	vyW3mqrtRrYL8v4yAzh020AxvmqotkQNlEBSYMWEb6uT+ARkfBhzVFwqSK3PalzP+0BZJOltZ1mck
	t81+W0Oe5oCXR0ePm5VXrR+n04Uq4KABFlABw36WRSEuExGFQHmbueOKJFcLL2AM0N3HpK0aMEiyM
	avagLn/lkJNwTsyFmOIvJ8ZE4/1Vh9wF9BpJgK1KLbGroEqWKYWuoKL4ocaFLcJSVpArsS/eIknPf
	hcqRrh+g==;
Received: from ip6-localhost ([::1]:36652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oemGK-0077ss-Eu; Sat, 01 Oct 2022 23:51:16 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:41848) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oemGB-0077sj-QW
 for samba-technical@lists.samba.org; Sat, 01 Oct 2022 23:51:13 +0000
Received: by mail-vs1-xe34.google.com with SMTP id k6so8239143vsc.8
 for <samba-technical@lists.samba.org>; Sat, 01 Oct 2022 16:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=mNlj1ar7MjAtt10PpJ5/PhVXSQp48TQeJStKYXUqZqM=;
 b=YRxnBcYn8lsbD640gx99JQcxyJ713Nt1LQbipREAPqcji3dRxHRvGSeIkckqbAuooN
 ihCxLgE7rsdTtBqZf3KBfy2nPgUJ3vkmfCNSjQ/caoav0gT95pPPmu3jjApcpJgqspCe
 tyPrMY2zC1RFv3XtfiybVkvP97tgBqKDJrB6VMEDOLL4LwL/gB1IH6J2Daoe/94msJo8
 XyD2IQE8idIa4egqh6TwrVTvMJEoFlCAppf6nvYdIUQezlgYZGYid8oSykiUC9XBMLzP
 stEXvc1JZ3CpKuj2dnkt+r3C6HrDdzlDK5xF0ZnVwWJ8qsK/uSKjYWbkQNOiZ7p6UDdo
 LkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=mNlj1ar7MjAtt10PpJ5/PhVXSQp48TQeJStKYXUqZqM=;
 b=blsa4MkFMvXFPELYXy+Wi2aRvG1aj4Yzsg9RiS9xJF4vjTrtdk+C8pr8i7y/4sikjc
 caPp3B/37AsDT8gdjPcZtVNJVn0QnWvzREyNq4m3udgKFrL9VFhB25Ntai/lzyLCh16x
 rexG+XqWTGQ9q0q3eZhjnUt1Kuylff1CkMDvU2qwFiYl4hrqmKTqfxqf8TmoPVklruRc
 pO/p0KCcDI4hL8uAzX4oy4i0wQWE4Pny/Z2JnGIeS+YM1H7xqslZP28pqWHATHGrbYCO
 8ptws9tOWK4m/PSC6Dgw1o4XjAt5RFPbA+yqjtcJ6ubq6FjvAmam6i+KnRTTLxCmHTUt
 l4eQ==
X-Gm-Message-State: ACrzQf0JJh5sNEZ0sNt5rIbKeIFzKiI+eRcyL2mpkLQB1xJuEzqBgWg0
 mmHkq06mbayDU170HNcN2MZbbg5kKBH/u2IHUnRURGI2Q2M=
X-Google-Smtp-Source: AMsMyM5QU9kVSrhZ0eQqhgJS2wntE8tOsajoWmiTYQ9Nk8QiHLEfZsUSKeAnxFGg1jtFf1JrOFqEd9a8+6JuChFJn1Y=
X-Received: by 2002:a05:6102:3118:b0:3a6:5332:25c0 with SMTP id
 e24-20020a056102311800b003a6533225c0mr859459vsh.60.1664668265021; Sat, 01 Oct
 2022 16:51:05 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 1 Oct 2022 18:50:54 -0500
Message-ID: <CAH2r5mvM6a4dU3d7Mxer9jWP0xkA2hyF9PrkwreES5T11W9O9w@mail.gmail.com>
Subject: new SMB3.1.1 create contexts
To: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
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

Noticed a few SMB3.1.1 create contexts missing from the Linux kernel
code.  Any more beyond these four that are still missing?

diff --git a/fs/smbfs_common/smb2pdu.h b/fs/smbfs_common/smb2pdu.h
index 2cab413fffee..7d605db3bb3b 100644
--- a/fs/smbfs_common/smb2pdu.h
+++ b/fs/smbfs_common/smb2pdu.h
@@ -1101,7 +1101,11 @@ struct smb2_change_notify_rsp {
 #define SMB2_CREATE_REQUEST_LEASE              "RqLs"
 #define SMB2_CREATE_DURABLE_HANDLE_REQUEST_V2  "DH2Q"
 #define SMB2_CREATE_DURABLE_HANDLE_RECONNECT_V2        "DH2C"
-#define SMB2_CREATE_TAG_POSIX
"\x93\xAD\x25\x50\x9C\xB4\x11\xE7\xB4\x23\x83\xDE\x96\x8B\xCD\x7C"
+#define SMB2_CREATE_TAG_POSIX
"\x93\xAD\x25\x50\x9C\xB4\x11\xE7\xB4\x23\x83\xDE\x96\x8B\xCD\x7C"
+#define SMB2_CREATE_APP_INSTANCE_ID
"\x45\xBC\xA6\x6A\xEF\xA7\xF7\x4A\x90\x08\xFA\x46\x2E\x14\x4D\x74"
+#define SMB2_CREATE_APP_INSTANCE_VERSION
"\xB9\x82\xD0\xB7\x3B\x56\x07\x4F\xA0\x7B\x52\x4A\x81\x16\xA0\x10"
+#define SVHDX_OPEN_DEVICE_CONTEXT
"\x9C\xCB\xCF\x9E\x04\xC1\xE6\x43\x98\x0E\x15\x8D\xA1\xF6\xEC\x83"
+#define SMB2_CREATE_TAG_AAPL                   "AAPL"


-- 
Thanks,

Steve

