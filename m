Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F9AC6C0B2
	for <lists+samba-technical@lfdr.de>; Wed, 19 Nov 2025 00:47:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=O4Qy67r0WsvsoCb54DNk1kfuGqNvxmypCWDAzg4loaw=; b=Yke+3SC1RoLmwYbeOfTkS1zB0S
	4o7dxfYG8/w/uRnLgZnqGbPxcPIsy2ISvd0oSNdllWyLfxKQD2gqzj85vPetf5pyVdVidWD6skvLM
	/U0KA9xE1HSwxmzZwPTHB9TWvBylV8cIc6vr004ec5W4L82KEnieCClTi9fKWzBuGDYavPAH9qQwP
	46SKEDmlQ+s2u5I3HONxLTSllXkTrePmKZ650ZBb3oK0PZpi2kniYFlSwKR7XiCBmuo/fumRnqyjE
	hexDNMUr8rL9Vs/gYuuMlPfAK/UAf3QVzmoKNH1M1eowvlWQNlzMZ9rfi1vKrXMURot45fG28bX5M
	cgJjlapw==;
Received: from ip6-localhost ([::1]:32072 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vLVPJ-00CbkA-OP; Tue, 18 Nov 2025 23:46:45 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:44199) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vLVPE-00Cbk3-Hb
 for samba-technical@lists.samba.org; Tue, 18 Nov 2025 23:46:43 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-8804650ca32so56016996d6.0
 for <samba-technical@lists.samba.org>; Tue, 18 Nov 2025 15:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763509598; x=1764114398; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=O4Qy67r0WsvsoCb54DNk1kfuGqNvxmypCWDAzg4loaw=;
 b=ITh/mCATOOXwm2loQqYCVdbpnzYL1TSMmhQtryBuO6sQdUOrRpnyPQqqXtX3VTBt2b
 cin+KyC9/RAk0rk0bBUYct65Qg4/Ry3as5cf3fK0odgZ2b09jeU9huPpRcqnOaEExurX
 opXb/eldqVEKR0Jl/cfXDI/1DECPNRmR/w9X95pinZxeyNa/+5dgbfGlLkx0oFX7fugG
 eFP+vksowk+MIIK8vdaVATmb9E7bpzYbphmsDFLWCiln/JUkTD+V1yLr0LebYGob7FQ0
 gXOQ3KQNo8KChBkNvL35EDLSqkADoxdEPmq54Q01WEyvRVTfq4ToiqPBDTJzH5/Uf3Gl
 pxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763509598; x=1764114398;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O4Qy67r0WsvsoCb54DNk1kfuGqNvxmypCWDAzg4loaw=;
 b=gg1OqI1l620qisqKanT6X2SbZkz1wS3QvA8Jhnky5SCOeWL5p3vhDbN/10qnx/TmZs
 8ITypPB3EyMScAyJWNPBqG/qjVzrA1rQ0criAodwz03P/t+sPclSxz+vFrRmn5MRI6MP
 KvIu8iuuBjs3PRIUHa1chyKEbx0Bap3wbZA6SoKASmC2YumvUCBvYbUwlc48lMOmnR2c
 x6xhvri34axlwWLJhWei99PwCd+hO4TNTju+TiVL4P+ShSHIMdfdRWgAlDlZ4l6LpSFF
 eHtfoxCH3itc/npspFYeCGf9fplzZpKbcD0RUIWorG4W3ShUFjoAT7eDNnAoFsOQBvI+
 PS2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdxIYpshBSMqgFNr6OfjmB17mLgW9XHU2ZfjTAtUNMMtkIs1Q8UrdCedkj+C8TrdgCI2SrXnEgoiiJeiVhDZU=@lists.samba.org
X-Gm-Message-State: AOJu0Yx7rphJRWLkkp6qvqLvILHX9WK8YoU9daYPJg/qAzBkfRsQT5zl
 RvT/lcAhqHbbTQH+md7jdepm7JsJ/KsWN4V1KamFjOGYh3yH1xc0xPO2HRVZ1Ne2/oMN4lTaW78
 rcY+h1YDBuQhSZOcxCQ/oJGTusX3iiZM=
X-Gm-Gg: ASbGncvipAVGW6wIa0z2R15Icdwrk1cXvXVHLi7LNhfszYybe+hfxRgOITX0v5K/3v/
 rBd78jSrHBpMYdb8qK6BgqZoKD330RP/9ZfHw/ZCCOpfgYEQ9YRIvqjLat4PXQ7yj/U7cb3oqiU
 iAL8IMGjE8Vu2MhWeacQ6gPdjlZg5NkUAY/YxU3a/j7ZXBFUf14VSeYPSVEdIQKiu8IJvBUJEgc
 t0+SMmNuvPM5JcGgTqupgFA+jR98YZJ5/FZhH+CAVPs4O0QypC4iaxE+nWgdwUDQIRO4jUqvzzq
 0GZPa/2vluxz/HWLGLmK7M/6UsGQapFLnxZRIaUeoxxeVJwzULXdS/QeH7B2nvsJegwFicoymib
 aAASmpLXuNSLQUhikKUvBz3wuuZHB9Pb//Jsw/r4XUS3Y7j4SJP09WqRGkL1Le1kBhaCyFdyxDq
 eJbVqpyOcIYw==
X-Google-Smtp-Source: AGHT+IG1ybOUdC7NN5Ug1UYt3LymjIoXH27sZabYuk+bt5UoSaUVuB3KSoG3Fr2rH+PMf+JTR3LdGVMgzaN9/xcxqRE=
X-Received: by 2002:a05:6214:1c0f:b0:880:42a7:772c with SMTP id
 6a1803df08f44-8845fd509b9mr8167666d6.54.1763509598402; Tue, 18 Nov 2025
 15:46:38 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 18 Nov 2025 17:46:26 -0600
X-Gm-Features: AWmQ_blhXXnq12LEDM8AAVYpXJJg1iJQCsyTVfTojMoJ-I7DESkhUkPL7KvhKXI
Message-ID: <CAH2r5ms6CEykTOCFyJ4GVx2hBGX3EzrtNwgE4z+2_+LuYASRAg@mail.gmail.com>
Subject: Multichannel mount failures to Samba depending on IP address (single
 channel works)
To: Shyam Prasad <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>, 
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

Saw an interesting multichannel failure scenario to Samba today:

Samba server smb.conf has
   "server multi channel support = yes"
in the [global] section but it does not include a line for
"interfaces" (uses the default)

On localhost, mounting to current Samba from Linux (tried various
versions of cifs.ko so does not appear to be a recent regression),
noticed:

1) mount -t cifs //locahost/share /mnt                                    worked
2) mount -t cifs //localhost/share /mnt -o multichannel          failed
3) mount -t cifs //127.0.0.1/share /mnt                                   worked
4) mount -t cifs //127.0.0.1/share /mnt -o multichannel          failed
5) mount -t cifs //192.168.1.190/share /mnt -o multichannel   worked

When mounting with "localhost" or "127.0.0.1" as the server name (non
multichannel) note that it does not show [CONNECTED] in
/proc/fs/cifs/DebugData

Server interfaces: 3 Last updated: 3 seconds ago
1) Speed: 1Gbps
Capabilities: None
IPv4: 192.168.1.198
Weight (cur,total): (0,1)
Allocated channels: 0

2) Speed: 1Gbps
Capabilities: None
IPv6: 2603:8080:2200:13fc:c82b:b16f:52c8:2329
Weight (cur,total): (0,1)
Allocated channels: 0

3) Speed: 1Gbps
Capabilities: None
IPv6: 2603:8080:2200:13fc:5b60:a7d6:77d7:72cc
Weight (cur,total): (0,1)
Allocated channels: 0

Note that when mounting to "192.168.1.190" (non-multichannel) it only
shows two instead of three interfaces (not sure why it drops one of
the IPv6 ones) but it does correctly show [CONNECTED]

Server interfaces: 2 Last updated: 1 seconds ago
1) Speed: 1Gbps
Capabilities: None
IPv4: 192.168.1.198
Weight (cur,total): (1,1)
Allocated channels: 1
[CONNECTED]

2) Speed: 1Gbps
Capabilities: None
IPv6: 2603:8080:2200:13fc:5b60:a7d6:77d7:72cc
Weight (cur,total): (0,1)
Allocated channels: 0

The mount failures with multichannel to 127.0.0.1 are weird - the
first negprot/sessionsetup/tcon works fine but the second negprot then
sessionsetup fails with the server returning with
"STATUS_SESSION_DELETED" which seems strange (since the session is
valid, and channel one session setup worked fine).  Any idea if this
is a Samba server bug?

Presumably the workaround is to add an "interfaces" line to smb.conf
to force it to return 127.0.0.1 as a valid interface, but this still
seems like it could be a server bug.  And quite confusing to users (as
"Resource temporarily unavailable" won't make sense to them since
single channel works fine) Any thoughts?

And log messages are unlikely to help the user figure out the server
config (or bug) issue.

[12421.964837] CIFS: Attempting to mount //localhost/test
[12422.032199] CIFS: VFS: \\localhost Send error in SessSetup = -11
[12422.032234] CIFS: VFS: failed to open extra channel on
iface:192.168.1.198 rc=-11
[12422.137163] CIFS: successfully opened new channel on
iface:2603:8080:2200:13fc:c82b:b16f:52c8:2329
[12422.137401] CIFS: VFS: reconnect tcon failed rc = -11

Thoughts?

-- 
Thanks,

Steve

