Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B68447E91F8
	for <lists+samba-technical@lfdr.de>; Sun, 12 Nov 2023 19:23:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=hxtcgldtJZPcZNXHMyW/ENFCiGu1+jo32hZKBtKGEBs=; b=dYddcQWCwFfgo2ij8tJtbkNjTO
	KKC/pDGEZUVABFkZGlvN1XHxfFx5b+H1PLGWPmoNKUb+nx/rXBvbOWBKsser26Dmo0wcJELyugXLw
	JpJnIPkQQpahNj5przfZ/xvDAK/y0WRwYHILXT17R5TlYUZ4ukIX2ZIhvsDFfdv476aUXc29j3BGz
	0CAbT/vL9nLQrP172+IdiAMyrEMi2ay9IncKI/aci1lZ7zEyKnjCmROsV1/tbP6dgN5JJj7+1aYCs
	7kh6FZPDmFOes5XyRA8dTsi1VMOH/v8iL/HDjKX7bJ25Q4SFo5/l896dRtzXadVf3TqJPikwvxrXl
	sYjp5uqQ==;
Received: from ip6-localhost ([::1]:24166 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2F66-007r6R-BO; Sun, 12 Nov 2023 18:22:14 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:46322) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2F61-007r6C-Ap
 for samba-technical@lists.samba.org; Sun, 12 Nov 2023 18:22:12 +0000
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507a98517f3so4837423e87.0
 for <samba-technical@lists.samba.org>; Sun, 12 Nov 2023 10:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699813325; x=1700418125; darn=lists.samba.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nGioeq9IUHR65TvkHhFj6LKgN6yvn4WdOY7zuGyT0Sc=;
 b=BFFRX/RvQVQKfvb2yUFIaeYr9y2jR7yeybVp//rJX56i0eiY5bSoHe4fs0oOlHF/7t
 eFRz8rx95APmxc5NPVyMwjrZ6A6sJogEgu4fdWNyWyHUcuUByRCj55BSKCFFAHDTii9b
 mC1RJ4X7kS4NzwxxdSW1nH3eaTGO3QMnO8HtYF/4QeK7kx0bij8isWMaK1lAZmx0WXzA
 ZWPqIiCZQS/9wJQLLUWbILngwJYcMBWjbUCU7t2ca0AI2MAKzHYz0PzNMQdEPknXE8U4
 6QKIQmg4qr4/j1YB8hZ6uDpl58Bf3d7PIdMNZXbG2YyiI+wOrJ5Oh+FdqNgb7rSKgmJc
 T6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699813325; x=1700418125;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nGioeq9IUHR65TvkHhFj6LKgN6yvn4WdOY7zuGyT0Sc=;
 b=Y+sZ176dZ4DHNlswjm7RojEl4OuPxna5fXbC2/nUySc2dE6WRKO15Kjoeo2tM55iZ7
 EX26S2SYskzlDvhCBEt2CZtvpTK5me5ExIjyw9FIumsXUM6f3wTHIxHpw02d5HbAKfdR
 vTrkOl7jxnE1nXljwTYq+w2dvAJp2gXkZsY89IKSOhxjGdQYGjWB0nUhtrqKkTn6NUPr
 L2yd8uJ4FfDRN+aL7eCeiBWkYNUi2RBvk0e5kgmqqSV212c7nq7p/gsyRVRKu3J52EIl
 4HWl6eqUV/u9XfqHvxFhAdIQuMnlnKPHqFoPbj9jHkR/xhnnl0dfyEZOiUaDst6MqKbj
 W9PQ==
X-Gm-Message-State: AOJu0YzPRBbO0kS9Dy7j3PGYyd4mcBhHyDULJ1uOK31pKM3DGFXz/57l
 5pGkgeoRZL513f5Oo39c+HExXLaRVOuOPcascSI=
X-Google-Smtp-Source: AGHT+IFFw2chOtDybHt974PFVshIN1/9PctmOvUWRdbArM2PaBh/snO+tAgR4o2MP3g5Qsa+e8WbsemQipsIXSyr3MA=
X-Received: by 2002:ac2:4852:0:b0:509:8a68:eb8b with SMTP id
 18-20020ac24852000000b005098a68eb8bmr2447730lfy.2.1699813324745; Sun, 12 Nov
 2023 10:22:04 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mt-t0QDZk4Zz+cSs8=s=VhUW09erUBAtm8f7xXG3rHJqw@mail.gmail.com>
 <CAH2r5mtWC4hX8v-CwDQC6qp4tWzdNaMSag9myYM4dGmC4zr9FA@mail.gmail.com>
 <CAH2r5mugOefduw_pgpYCZtHPiuosSQrcOKb0MFcv8v7giEopMA@mail.gmail.com>
In-Reply-To: <CAH2r5mugOefduw_pgpYCZtHPiuosSQrcOKb0MFcv8v7giEopMA@mail.gmail.com>
Date: Sun, 12 Nov 2023 12:21:53 -0600
Message-ID: <CAH2r5mujJjTaOU8YrpZEPamoW3fSLTVkNk-L9bAmCqBAAxckdg@mail.gmail.com>
Subject: Re: [PATCH][smb3 client] allow debugging session and tcon info to
 improve stats analysis and debugging
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000006848610609f8a101"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000006848610609f8a101
Content-Type: text/plain; charset="UTF-8"

Attached is a sample program (that uses the new cifs.ko IOCTL) to dump the
tree id for a mount to make it easier to look at traces, wireshark,
/proc/fs/cifs/Stats, /proc/fs/cifs/DebugData if you have more than one
mount (would be useful to add something similar to debugging tools and/or
smb-info or something new in cifs-utils).

e.g.

# ./get-tcon-inf /mnt2
ioctl completed. tid 0x47b3d0e2 session id: 0xf6cde60a

# cat /proc/fs/cifs/DebugData | grep "tid: 0x47b3d0e2" -C3
2) \\localhost\test Mounts: 1 DevInfo: 0x20 Attributes: 0x801007f
PathComponentMax: 255 Status: 1 type: DISK Serial Number: 0xaab31952
Share Capabilities: None Aligned, Partition Aligned, Share Flags: 0x0
tid: 0x47b3d0e2 Optimal sector size: 0x200 Maximal Access: 0x1f01ff
-- 
Thanks,

Steve

--0000000000006848610609f8a101
Content-Type: text/x-csrc; charset="US-ASCII"; name="get-tcon-inf.c"
Content-Disposition: attachment; filename="get-tcon-inf.c"
Content-Transfer-Encoding: base64
Content-ID: <f_lovsxpcm0>
X-Attachment-Id: f_lovsxpcm0

I2luY2x1ZGUgPHN5cy9pb2N0bC5oPgojaW5jbHVkZSA8c3lzL3R5cGVzLmg+CiNpbmNsdWRlIDxz
eXMvc3RhdC5oPgojaW5jbHVkZSA8ZXJybm8uaD4KI2luY2x1ZGUgPHN0ZGJvb2wuaD4KI2luY2x1
ZGUgPGZjbnRsLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHN0ZGludC5oPgojaW5j
bHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8dGltZS5oPgojaW5j
bHVkZSA8dW5pc3RkLmg+CgoKc3RydWN0IF9fYXR0cmlidXRlX18oKF9fcGFja2VkX18pKXNtYl9t
bnRfdGNvbl9pbmZvIHsKICAgICAgIHVpbnQzMl90ICAgdGlkOwogICAgICAgdWludDY0X3QgICBz
ZXNzaW9uX2lkOwp9IF9fcGFja2VkOwoKCiNkZWZpbmUgQ0lGU19JT0NfR0VUX1RDT05fSU5GTyAw
eDgwMGNjZjBjCmludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKewoJc3RydWN0IHNtYl9t
bnRfdGNvbl9pbmZvIG1udF9pbmZvOwoJaW50IGY7CgoJaWYgKChmID0gb3Blbihhcmd2WzFdLCBP
X1JET05MWSkpIDwgMCkgewoJCWZwcmludGYoc3RkZXJyLCAiRmFpbGVkIHRvIG9wZW4gJXNcbiIs
IGFyZ3ZbMV0pOwoJCWV4aXQoMSk7Cgl9CgoJaWYgKGlvY3RsKGYsIENJRlNfSU9DX0dFVF9UQ09O
X0lORk8sICZtbnRfaW5mbykgPCAwKQoJCXByaW50ZigiRXJyb3IgJWQgcmV0dXJuZWQgZnJvbSBp
b2N0bFxuIiwgZXJybm8pOwoJZWxzZSB7CgkJcHJpbnRmKCJpb2N0bCBjb21wbGV0ZWQuIHRpZCAw
eCV4IHNlc3Npb24gaWQ6IDB4JWx4XG4iLCBtbnRfaW5mby50aWQsIG1udF9pbmZvLnNlc3Npb25f
aWQpOwoJfQp9CgoKCg==
--0000000000006848610609f8a101--

