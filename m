Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 948F1CA2701
	for <lists+samba-technical@lfdr.de>; Thu, 04 Dec 2025 06:55:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=vWSnMjMUo2BVbtZ66uGmlUBpFRXfYW4PAcFCjqqTd5Y=; b=yjz8MXYcZz5bhz71fpaIm7Cpxm
	+n373zPP0n1wNFHOMQdOs527aELat2ZD8vm3KD0tohVBbjMWdZ1OBRGxvKxaH8CnQhGr7oVe9LlKl
	i5Dhe3BMuAWcgfmxwQ8YGHl7rm6f/YJoo31ss04R+ABAl+KD41Yb+CtFd1Ha564tPbxkh+5EP+wno
	y5h6L4BTZjs+PtdRjV4z6uWowa2rq+DNWsuBUpQw2OIYlHGTRggfTHMX2BH7CeWVwLMZCqDQc0BxM
	kRaA7vikhjc18oiz0mu1Y5jj1CoGkxUtSF698/260cHn+ZAWhWSyHYsVySlmQXLTAuz9JiFo8AKCt
	qqd7P4Mw==;
Received: from ip6-localhost ([::1]:19466 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vR2JZ-00FfvD-Ba; Thu, 04 Dec 2025 05:55:41 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:52503) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vR2JT-00Ffv4-BW
 for samba-technical@lists.samba.org; Thu, 04 Dec 2025 05:55:37 +0000
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-88246401c9eso6125056d6.1
 for <samba-technical@lists.samba.org>; Wed, 03 Dec 2025 21:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764827733; x=1765432533; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vWSnMjMUo2BVbtZ66uGmlUBpFRXfYW4PAcFCjqqTd5Y=;
 b=YMgFyDOwiugrsmTf6PXU28TUjxuamxa52HTEjU2Gjyo/a/8NmJIJU3LyU2yO/W0Cxe
 l0GYSI3W0pzI6VG34Hzyh2iC9+kys2lIgImgiBOE0EUOjKR+agFeWFLhSX369rXQfn66
 oVmeFok9EIt3bUvDDQS933e8DqkwmZaQAulSpcZLRK6yKWwdYcTPxursfPmfi3V45l6c
 cNKdGBw4Df+F7SMqvG9K0LZ07FFK9z853GAkVJqIAwozCqsgtKrpRfVt0VfdS97mUcA4
 xkMnPpHos3Y0gxE4NOB5k5tHYykpwe/zyaO5UT5KBhscAtzGpSbM3lN8KRMUPPsKLdpq
 slZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764827733; x=1765432533;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vWSnMjMUo2BVbtZ66uGmlUBpFRXfYW4PAcFCjqqTd5Y=;
 b=egdNlTovFLIvBWtygUg/PPEQwBB1YJ3bVqh5IoFHK+4O5boEn+I1IFxGNByJJK1HFs
 VUWCYaLqOTpvvE/+i8/x2SNANswrR0jJ6sn4cz/5E763qi5NW8+JwhUSJGUA5/2CClsS
 MTRG0y+p+8MN7/cJgfIlY8qmdqJn53xOej/xKsSfqnhpReZS1a/XPtGSoWewID+tDY83
 adlNPtiRMRFQ6ty9TKL7vrx8tw8lH6laTi+pJZqeyV7giP919RK+QnDB3Agyvc7ZJRlj
 n60DtRKqE9MTTQpVzqA8nBGBp2jMgyIXmIDXbLl1T/OEKz90cLEgICT8QPPasAFukoMq
 +b6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8aicVJrzXLWvHE0J4ZGvF6g8vpUyz0naCSoTQ4s6C8DgML1JOPcVk++ZKuAv0xD4g31DqRwOrtoi3osnKSzM=@lists.samba.org
X-Gm-Message-State: AOJu0YxvJB1IuBb3/va+2vpREyv9sks21yynG493L9IdyfqG/oPYL+b7
 zt1dKsPmnthGD0GUSnv1Z/ii8243eyTNTb8kqyx5u5Fm5f8/y/b9RB5IK3/9/sy0sMnNFBsiCTe
 LnBTIvh0WLWSKFFJQmc2FhNZ0Fxa3WBY=
X-Gm-Gg: ASbGncuHVD4cB+RUJfl48dLntV54vWhrmngkcf/DzHvEqZA8Osspdr5u3SGgEmJFU5H
 jML2SR4Xwhf2R0out5a8ixDbk4LtbuXxNifCSVA8axGxFzmE6HAQlc0+JhI1tpVDyiFTrtyMfgj
 1oSJtYw0Cm9K9ume901XhUT13GLmuHRULJ5IPh6QPwync3njScyBQZFZvc4Xgh19kIuA5uHLou1
 D4mRsoS6zSC4Y6TLEZoHNrvze72eWixUVfW7RSHh4b8fBWrAIJyI1yKyjIQVXoS+roDf988mdUJ
 Y5pATxSTMVKuaVOcO9us4z5Y5hZQxu6piwaeQk0Rsi3jDA3/R0TQFPI9fdvl4tqqx9zXlVv09i3
 qYu0l2D7bKOmA6/HDFaFW3zCoRcp0cUiqggStFwA7/Vhx/+8LXPVCRgJ+Iv2Kn7DPFbWKPOkuNE
 cisuaH+6Ltsw==
X-Google-Smtp-Source: AGHT+IFNY7QVhu9WsokzE7laoVb4TZBsiUhTnW5+Y4YZfnoG0Ll+HG0WhYUp874NWtGsRCwwgVNYuvGpKpwLFO8a3SQ=
X-Received: by 2002:a05:6214:194f:b0:882:3781:e29c with SMTP id
 6a1803df08f44-8881953a31dmr76537406d6.38.1764827733294; Wed, 03 Dec 2025
 21:55:33 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 3 Dec 2025 23:55:22 -0600
X-Gm-Features: AWmQ_bnAwSqZ0YChGtVU0xxlLeRRxz1gujSOBA4TjPG9rTCad9kJWNydMtYsaEg
Message-ID: <CAH2r5mvbfUt=1t9r2TDN8zmiO032x4NV+2Vb08YPiFzx5ObgSw@mail.gmail.com>
Subject: updated ksmbd-for-next
To: Namjae Jeon <linkinjeon@kernel.org>,
 "Stefan (metze) Metzmacher" <metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Have updated the branches so cifs-2.6.git for-next has the 17 pending
client patches, let me know if client patches missing or if problems
with any of these (there are seven more error mapping fixes from
ChenXiaoSong that I would like to include once reviewed) and if
additional Reviewed-by or Tested-by or Acked-by should be added for
any of these:

/cifs-2.6$ git log --oneline -18
ba521f56912f (HEAD -> for-next, origin/for-next) smb: add two elements
to smb2_error_map_table array
905d8999d67d smb/client: remove unused elements from smb2_error_map_table array
26866d690bd1 smb/client: reduce loop count in map_smb2_to_linux_error() by half
3ff9bc2be897 cifs: Fix handling of a beyond-EOF DIO/unbuffered read over SMB2
8f869faed209 cifs: Remove dead function prototypes
d1d9fad9591c cifs: Do some preparation prior to organising the
function declarations
d53ec5423b0e cifs: Add a tracepoint to log EIO errors
0b0c42440bd8 cifs: Don't need state locking in smb2_get_mid_entry()
48114e9c5a3a cifs: Remove the server pointer from smb_message
b6a11f9a6030 cifs: Fix specification of function pointers
61726ae16c86 cifs: Replace SendReceiveBlockingLock() with
SendReceive() plus flags
d3f782f4e4da cifs: Clean up some places where an extra kvec[] was
required for rfc1002
ff83eef764a2 cifs: Make smb1's SendReceive() wrap cifs_send_recv()
e35b4fcf9409 cifs: Remove the RFC1002 header from smb_hdr
dfca45e69875 cifs: Fix handling of a beyond-EOF DIO/unbuffered read over SMB1
8eca12a25669 cifs: client: allow changing multichannel mount options on remount
1ef15fbe6771 cifs: client: enforce consistent handling of multichannel
and max_channels
869737543b39 Merge tag 'v6.19-rc-smb-fixes' of git://git.samba.org/ksmbd
smfrench@smfrench-ThinkPad-P16s-Gen-2:~/cifs-2.6$

and ksmbd-for-next has the three pending smbdirect and server ones,
let me know if additional ksmbd or smbdirect ones to add to
ksmbd-for-next:

/smb3-kernel$ git log --oneline -4
7526439c8f01 (HEAD -> ksmbd-for-next, origin/ksmbd-for-next) smb:
server: defer the initial recv completion logic to
smb_direct_negotiate_recv_work()
b640cf3f23d4 smb: server: initialize recv_io->cqe.done = recv_done just once
d40508dddee7 smb: smbdirect: introduce smbdirect_socket.connect.{lock,work}
869737543b39 Merge tag 'v6.19-rc-smb-fixes' of git://git.samba.org/ksmbd


-- 
Thanks,

Steve

