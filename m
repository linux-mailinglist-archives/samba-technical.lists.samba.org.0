Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B8BB21C0F
	for <lists+samba-technical@lfdr.de>; Tue, 12 Aug 2025 06:18:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BRBE98POvm3y1OXAISByb05MPTLMuNS4snXh7kL3Tyg=; b=vVma3PmccIs62knjr4qtmNBC3f
	bO3d+jebAMdJaEqScbBBqJJyzT+mLILz26m+KJw1zfI/mj4kCCTBrrxQmks4vybxOBb7IX2Vanivj
	Y3rqcseuOpJaaQNPKmFR8BaU4UH8gqq/bBLGdkFG8YjWi/XYEgLs98X+2gqthmkXVu1vPG0aSquXI
	Wuvqj/bisHkrNftU+v6kn7EAzxd5Nq8YtERry/DFRgY0HflsHaznlIefqinLo9tQJSGL9WSV81bp9
	wmFsXbnmYvDVVaeDB5q0uTejhwtSgzkAv52u6mecjoUeTozror76qSdm+u3FVM0sQ8pee37hRWkrd
	7lpPonfg==;
Received: from ip6-localhost ([::1]:20548 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ulgSS-00Etfa-Hj; Tue, 12 Aug 2025 04:17:56 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:57785) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ulgSN-00EtfS-EH
 for samba-technical@lists.samba.org; Tue, 12 Aug 2025 04:17:54 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-70884da4b55so53278746d6.3
 for <samba-technical@lists.samba.org>; Mon, 11 Aug 2025 21:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754972269; x=1755577069; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BRBE98POvm3y1OXAISByb05MPTLMuNS4snXh7kL3Tyg=;
 b=S2ZHosi35UbCGGcQiRONF/aCTRTlvoPBFaCPSTMzdro6kTZ/w3D+mYeucZ7kYuNj2A
 f3Aq5jggAYW1fBCbmOxo3wG0lsiXmTKo4i8xfAaibB8CJ+z57rbATN1TDFqNY6/xcCiN
 GtrYB+p/XxtAzb95Vvshg/EK+p4K4q44yOU57UcImXNyFt6B30LHLElpaI//2OBifH+f
 7f2yJC5vT4qhpaVrsWK+k5k2+c+Lde9O7k2mlQuv69bgxa8cJGFWHdECvARwc5W14khi
 h6EYU8zUQNNSY0tVCPXJ8qtSMJ/06o2X7RCxL9t3xOJtKQbEFxuUufmTQoEEIMtdnomR
 cPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754972269; x=1755577069;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BRBE98POvm3y1OXAISByb05MPTLMuNS4snXh7kL3Tyg=;
 b=uWNg7sawMOaZ//bg8ib9Lud+xPSOxrG1Cir0pFUs2KkvZCpaX/rhgdFidhoPo2d/kk
 HSvUtsK//BMHzbLwyP8nk8Kc2jQWCWNT6nx/URzUOIfpihhVY8UZgqfdqh9OyizKGk09
 34LNrlRIIyjcuJQJdaKUVfuyDG2GREkn2la5qlPxpDcETWyljLVnERjwL+xyyaHadp6k
 7sE87L8DVEZMGoMflcl0VRy1rYl4Kb+P/QyMbRTmTj5swsZsNFJixRRoBthqDfPYeVQ6
 bIABH2jr6UUDBoahJ0t2vszdGv6YxTRQCTZ8NZ8QESUS4y4xM8nouvUr7P81BFuKIgVH
 VM+g==
X-Gm-Message-State: AOJu0Yys/CphekHtnhMdPvPhgJ5JrMzuFMRQObtkr3o8nlfn7+ZwLzjC
 DuCkn5TLxjf+yauZ0IX/9uIj85vqVnror9E/GuqS75ZCTc2i849TZ6kAuTgdVDISF1BlOxcI3se
 tjH03zkMwv9dbkldpi/eJBV+ZU9RgfxM=
X-Gm-Gg: ASbGncvr0yBo5EmFgXOkjx9YqxRvwyGSgNJdPwh0BV2MKVkXoETQps/T4/rFxvHZlbd
 Ct8NwMaeEF8Tw1vS4jnclSz6BiyLQVbf8pDVxz4WLlIZH/xPwm1psCcNO4UOQx9eO0rw4N0K44B
 QQyAMZ4mX+KfV0rrxJL2myGM8B8HAT6fmfl6L3LKLi9P01ppV5VKJLTh1JlxcSY5ixlnYmJ7mUA
 nmg51zltPPTLBoGi3jzSJ013EhvqOWVsB7wnezbvjuNwnn0IkXv
X-Google-Smtp-Source: AGHT+IFZg5h3gPGj0bDCCeBKUqsI68/fATToWXzteGu6B/C4BErOV98+oU1O6Oj4fh+TmIXIQGU08zX5uc7owcGaFBw=
X-Received: by 2002:a05:6214:2aad:b0:709:e095:128f with SMTP id
 6a1803df08f44-709e09536a3mr528716d6.25.1754972269334; Mon, 11 Aug 2025
 21:17:49 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 11 Aug 2025 23:17:37 -0500
X-Gm-Features: Ac12FXzBDaFBO5kjoLovPIpMy18Rz9iHv72fzhkfQ17S8HQbJSqxfVq1U1IDV5Q
Message-ID: <CAH2r5muN4QgGt1ZrOFkWFaqwM0V2HBWZn0OGNgZzPHJOTPjxjw@mail.gmail.com>
Subject: [PATCH][SMB3 client] fix for slab out of bound on mount to ksmbd
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000b46cbb063c235244"
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000b46cbb063c235244
Content-Type: text/plain; charset="UTF-8"

smb3: fix for slab out of bounds on mount to ksmbd

With KASAN enabled, it is possible to get a slab out of bounds
during mount to ksmbd due to missing check in parse_server_interfaces()
(see below):

 BUG: KASAN: slab-out-of-bounds in
 parse_server_interfaces+0x14ee/0x1880 [cifs]
 Read of size 4 at addr ffff8881433dba98 by task mount/9827

 CPU: 5 UID: 0 PID: 9827 Comm: mount Tainted: G
 OE       6.16.0-rc2-kasan #2 PREEMPT(voluntary)
 Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
 Hardware name: Dell Inc. Precision Tower 3620/0MWYPT,
 BIOS 2.13.1 06/14/2019
 Call Trace:
  <TASK>
 dump_stack_lvl+0x9f/0xf0
 print_report+0xd1/0x670
 __virt_addr_valid+0x22c/0x430
 ? parse_server_interfaces+0x14ee/0x1880 [cifs]
 ? kasan_complete_mode_report_info+0x2a/0x1f0
 ? parse_server_interfaces+0x14ee/0x1880 [cifs]
   kasan_report+0xd6/0x110
   parse_server_interfaces+0x14ee/0x1880 [cifs]
   __asan_report_load_n_noabort+0x13/0x20
   parse_server_interfaces+0x14ee/0x1880 [cifs]
 ? __pfx_parse_server_interfaces+0x10/0x10 [cifs]
 ? trace_hardirqs_on+0x51/0x60
 SMB3_request_interfaces+0x1ad/0x3f0 [cifs]
 ? __pfx_SMB3_request_interfaces+0x10/0x10 [cifs]
 ? SMB2_tcon+0x23c/0x15d0 [cifs]
 smb3_qfs_tcon+0x173/0x2b0 [cifs]
 ? __pfx_smb3_qfs_tcon+0x10/0x10 [cifs]
 ? cifs_get_tcon+0x105d/0x2120 [cifs]
 ? do_raw_spin_unlock+0x5d/0x200
 ? cifs_get_tcon+0x105d/0x2120 [cifs]
 ? __pfx_smb3_qfs_tcon+0x10/0x10 [cifs]
 cifs_mount_get_tcon+0x369/0xb90 [cifs]
 ? dfs_cache_find+0xe7/0x150 [cifs]
 dfs_mount_share+0x985/0x2970 [cifs]
 ? check_path.constprop.0+0x28/0x50
 ? save_trace+0x54/0x370
 ? __pfx_dfs_mount_share+0x10/0x10 [cifs]
 ? __lock_acquire+0xb82/0x2ba0
 ? __kasan_check_write+0x18/0x20
 cifs_mount+0xbc/0x9e0 [cifs]
 ? __pfx_cifs_mount+0x10/0x10 [cifs]
 ? do_raw_spin_unlock+0x5d/0x200
 ? cifs_setup_cifs_sb+0x29d/0x810 [cifs]
 cifs_smb3_do_mount+0x263/0x1990 [cifs]

Reported-by: Namjae Jeon <linkinjeon@kernel.org>
Tested-by: Namjae Jeon <linkinjeon@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Steve French <stfrench@microsoft.com>

See attached

-- 
Thanks,

Steve

--000000000000b46cbb063c235244
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-fix-for-slab-out-of-bounds-on-mount-to-ksmbd.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-fix-for-slab-out-of-bounds-on-mount-to-ksmbd.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_me8161290>
X-Attachment-Id: f_me8161290

RnJvbSBjNjJjNTEyNTI5YjA3NTRjYmRlZjQ5MmVmOTI3OTdiOWNiNTU0YTU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IE1vbiwgMTEgQXVnIDIwMjUgMjM6MTQ6NTUgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiBmaXggZm9yIHNsYWIgb3V0IG9mIGJvdW5kcyBvbiBtb3VudCB0byBrc21iZAoKV2l0aCBL
QVNBTiBlbmFibGVkLCBpdCBpcyBwb3NzaWJsZSB0byBnZXQgYSBzbGFiIG91dCBvZiBib3VuZHMK
ZHVyaW5nIG1vdW50IHRvIGtzbWJkIGR1ZSB0byBtaXNzaW5nIGNoZWNrIGluIHBhcnNlX3NlcnZl
cl9pbnRlcmZhY2VzKCkKKHNlZSBiZWxvdyk6CgogQlVHOiBLQVNBTjogc2xhYi1vdXQtb2YtYm91
bmRzIGluCiBwYXJzZV9zZXJ2ZXJfaW50ZXJmYWNlcysweDE0ZWUvMHgxODgwIFtjaWZzXQogUmVh
ZCBvZiBzaXplIDQgYXQgYWRkciBmZmZmODg4MTQzM2RiYTk4IGJ5IHRhc2sgbW91bnQvOTgyNwoK
IENQVTogNSBVSUQ6IDAgUElEOiA5ODI3IENvbW06IG1vdW50IFRhaW50ZWQ6IEcKIE9FICAgICAg
IDYuMTYuMC1yYzIta2FzYW4gIzIgUFJFRU1QVCh2b2x1bnRhcnkpCiBUYWludGVkOiBbT109T09U
X01PRFVMRSwgW0VdPVVOU0lHTkVEX01PRFVMRQogSGFyZHdhcmUgbmFtZTogRGVsbCBJbmMuIFBy
ZWNpc2lvbiBUb3dlciAzNjIwLzBNV1lQVCwKIEJJT1MgMi4xMy4xIDA2LzE0LzIwMTkKIENhbGwg
VHJhY2U6CiAgPFRBU0s+CiBkdW1wX3N0YWNrX2x2bCsweDlmLzB4ZjAKIHByaW50X3JlcG9ydCsw
eGQxLzB4NjcwCiBfX3ZpcnRfYWRkcl92YWxpZCsweDIyYy8weDQzMAogPyBwYXJzZV9zZXJ2ZXJf
aW50ZXJmYWNlcysweDE0ZWUvMHgxODgwIFtjaWZzXQogPyBrYXNhbl9jb21wbGV0ZV9tb2RlX3Jl
cG9ydF9pbmZvKzB4MmEvMHgxZjAKID8gcGFyc2Vfc2VydmVyX2ludGVyZmFjZXMrMHgxNGVlLzB4
MTg4MCBbY2lmc10KICAga2FzYW5fcmVwb3J0KzB4ZDYvMHgxMTAKICAgcGFyc2Vfc2VydmVyX2lu
dGVyZmFjZXMrMHgxNGVlLzB4MTg4MCBbY2lmc10KICAgX19hc2FuX3JlcG9ydF9sb2FkX25fbm9h
Ym9ydCsweDEzLzB4MjAKICAgcGFyc2Vfc2VydmVyX2ludGVyZmFjZXMrMHgxNGVlLzB4MTg4MCBb
Y2lmc10KID8gX19wZnhfcGFyc2Vfc2VydmVyX2ludGVyZmFjZXMrMHgxMC8weDEwIFtjaWZzXQog
PyB0cmFjZV9oYXJkaXJxc19vbisweDUxLzB4NjAKIFNNQjNfcmVxdWVzdF9pbnRlcmZhY2VzKzB4
MWFkLzB4M2YwIFtjaWZzXQogPyBfX3BmeF9TTUIzX3JlcXVlc3RfaW50ZXJmYWNlcysweDEwLzB4
MTAgW2NpZnNdCiA/IFNNQjJfdGNvbisweDIzYy8weDE1ZDAgW2NpZnNdCiBzbWIzX3Fmc190Y29u
KzB4MTczLzB4MmIwIFtjaWZzXQogPyBfX3BmeF9zbWIzX3Fmc190Y29uKzB4MTAvMHgxMCBbY2lm
c10KID8gY2lmc19nZXRfdGNvbisweDEwNWQvMHgyMTIwIFtjaWZzXQogPyBkb19yYXdfc3Bpbl91
bmxvY2srMHg1ZC8weDIwMAogPyBjaWZzX2dldF90Y29uKzB4MTA1ZC8weDIxMjAgW2NpZnNdCiA/
IF9fcGZ4X3NtYjNfcWZzX3Rjb24rMHgxMC8weDEwIFtjaWZzXQogY2lmc19tb3VudF9nZXRfdGNv
bisweDM2OS8weGI5MCBbY2lmc10KID8gZGZzX2NhY2hlX2ZpbmQrMHhlNy8weDE1MCBbY2lmc10K
IGRmc19tb3VudF9zaGFyZSsweDk4NS8weDI5NzAgW2NpZnNdCiA/IGNoZWNrX3BhdGguY29uc3Rw
cm9wLjArMHgyOC8weDUwCiA/IHNhdmVfdHJhY2UrMHg1NC8weDM3MAogPyBfX3BmeF9kZnNfbW91
bnRfc2hhcmUrMHgxMC8weDEwIFtjaWZzXQogPyBfX2xvY2tfYWNxdWlyZSsweGI4Mi8weDJiYTAK
ID8gX19rYXNhbl9jaGVja193cml0ZSsweDE4LzB4MjAKIGNpZnNfbW91bnQrMHhiYy8weDllMCBb
Y2lmc10KID8gX19wZnhfY2lmc19tb3VudCsweDEwLzB4MTAgW2NpZnNdCiA/IGRvX3Jhd19zcGlu
X3VubG9jaysweDVkLzB4MjAwCiA/IGNpZnNfc2V0dXBfY2lmc19zYisweDI5ZC8weDgxMCBbY2lm
c10KIGNpZnNfc21iM19kb19tb3VudCsweDI2My8weDE5OTAgW2NpZnNdCgpSZXBvcnRlZC1ieTog
TmFtamFlIEplb24gPGxpbmtpbmplb25Aa2VybmVsLm9yZz4KVGVzdGVkLWJ5OiBOYW1qYWUgSmVv
biA8bGlua2luamVvbkBrZXJuZWwub3JnPgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0tLQogZnMv
c21iL2NsaWVudC9zbWIyb3BzLmMgfCAxMSArKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50
L3NtYjJvcHMuYyBiL2ZzL3NtYi9jbGllbnQvc21iMm9wcy5jCmluZGV4IGY3YTBmMWM4MWI0My4u
ZjM3M2M4Nzc0NjY5IDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L3NtYjJvcHMuYworKysgYi9m
cy9zbWIvY2xpZW50L3NtYjJvcHMuYwpAQCAtNzcyLDYgKzc3MiwxMyBAQCBwYXJzZV9zZXJ2ZXJf
aW50ZXJmYWNlcyhzdHJ1Y3QgbmV0d29ya19pbnRlcmZhY2VfaW5mb19pb2N0bF9yc3AgKmJ1ZiwK
IAkJCWJ5dGVzX2xlZnQgLT0gc2l6ZW9mKCpwKTsKIAkJCWJyZWFrOwogCQl9CisJCS8qIFZhbGlk
YXRlIHRoYXQgTmV4dCBkb2Vzbid0IHBvaW50IGJleW9uZCB0aGUgYnVmZmVyICovCisJCWlmIChu
ZXh0ID4gYnl0ZXNfbGVmdCkgeworCQkJY2lmc19kYmcoVkZTLCAiJXM6IGludmFsaWQgTmV4dCBw
b2ludGVyICVsdSA+ICV6ZFxuIiwKKwkJCQkgX19mdW5jX18sIG5leHQsIGJ5dGVzX2xlZnQpOwor
CQkJcmMgPSAtRUlOVkFMOworCQkJZ290byBvdXQ7CisJCX0KIAkJcCA9IChzdHJ1Y3QgbmV0d29y
a19pbnRlcmZhY2VfaW5mb19pb2N0bF9yc3AgKikoKHU4ICopcCtuZXh0KTsKIAkJYnl0ZXNfbGVm
dCAtPSBuZXh0OwogCX0KQEAgLTc4Myw3ICs3OTAsOSBAQCBwYXJzZV9zZXJ2ZXJfaW50ZXJmYWNl
cyhzdHJ1Y3QgbmV0d29ya19pbnRlcmZhY2VfaW5mb19pb2N0bF9yc3AgKmJ1ZiwKIAl9CiAKIAkv
KiBBenVyZSByb3VuZHMgdGhlIGJ1ZmZlciBzaXplIHVwIDgsIHRvIGEgMTYgYnl0ZSBib3VuZGFy
eSAqLwotCWlmICgoYnl0ZXNfbGVmdCA+IDgpIHx8IHAtPk5leHQpCisJaWYgKChieXRlc19sZWZ0
ID4gOCkgfHwKKwkgICAgKGJ5dGVzX2xlZnQgPj0gb2Zmc2V0b2Yoc3RydWN0IG5ldHdvcmtfaW50
ZXJmYWNlX2luZm9faW9jdGxfcnNwLCBOZXh0KQorCSAgICAgKyBzaXplb2YocC0+TmV4dCkgJiYg
cC0+TmV4dCkpCiAJCWNpZnNfZGJnKFZGUywgIiVzOiBpbmNvbXBsZXRlIGludGVyZmFjZSBpbmZv
XG4iLCBfX2Z1bmNfXyk7CiAKIAlzZXMtPmlmYWNlX2xhc3RfdXBkYXRlID0gamlmZmllczsKLS0g
CjIuNDMuMAoK
--000000000000b46cbb063c235244--

