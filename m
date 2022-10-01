Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E145F1DF3
	for <lists+samba-technical@lfdr.de>; Sat,  1 Oct 2022 18:56:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=IS18AKkvs6Ni+OLfS43Y4FnjRvwNRzH8XXbVwq68aoA=; b=tcPnW5skoej9GP2eIKgjGsg1uJ
	KwgUfqXUzoRsBMiXdk6kOLU+DRNcEqHeCsezfvL7Ua5+xVJDUZ5vnFDujhplfK/Mow1EFznCHGdwb
	lEZ7FK2Dw8y8HuWTL0kyr1rvhjN5dtW+cvLxu/OELSG+LVJowb9D3JAxUbBd/OAMiwj/eNsBWFThS
	lJhzlw2E3QbOYBcp46PdZB8nrimy0HZyD6XDV1vbU2T+5CWHMRx9twvpIAALvg2anLv8OPUBd7GXq
	Rxx4AoPV/ETj0RDwyCeF1hIJRM0/bql80m3eCRPMa2LPEDpQ+4Qd3ZfbuFRGrio5NhwALOXRLm+zh
	++DIkTHw==;
Received: from ip6-localhost ([::1]:36610 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oeflV-0075ZP-0x; Sat, 01 Oct 2022 16:55:01 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a]:42908) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oeflQ-0075ZG-A6
 for samba-technical@lists.samba.org; Sat, 01 Oct 2022 16:54:58 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id s192so3688988vkb.9
 for <samba-technical@lists.samba.org>; Sat, 01 Oct 2022 09:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=IS18AKkvs6Ni+OLfS43Y4FnjRvwNRzH8XXbVwq68aoA=;
 b=TsYJAdoRgM4M/jM/6/oohzhNg5OJ0csO7MG9B6vYWTJZcTWd+VmmNR37Ri4r9Us+Tc
 Gy1D0zOSey9o4lkxHz1P/wuEo81O7sEIWy5jyaErkx3Glq1tQ8NIAF2aMEZXueee4xRg
 XJSxaOWuz5nTMtsK5gB+OXcKh2+EK79TLf/p+E8jYrzseTQsmEPvw187jp0LEseRo88U
 pdoXXTlRZpsIaqiSUXbbiGqYfUPOrCHjlvydDH58vgzDgUOy1xqjzfgcnUH/sgYmSJOL
 FdWKx7Fupl/LP2owpT6KIS0dare8tVfeNgxmiC6tPBLGVk5CoRkArpNAMBD78KvpZLrm
 XIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=IS18AKkvs6Ni+OLfS43Y4FnjRvwNRzH8XXbVwq68aoA=;
 b=Kcx5KHd/F2EsunOlqmMzGCilCcR65+NA5sMCQCETMRQB1VRCecZVu4Ew/wzWjMtG6T
 F4SVbGzxRqID1s8QbdmSebghTOmntz+8xki8nfDy7lN7NpXSqrDhLeNE/3OqRBXleV4A
 mXPCoK9WemIqVH8qPupGpRBFGTClDd+aDBDzj8PtXFeAZs1/M8g9eiQ16a2gmVMMrzbK
 hq54ZSx21oS+D9mgO+cP/Epa9lRbu6tibzVPLZt1D5ioxcTktZJzz2rDt75G7uly7Xh4
 9MV5/2Ccqh60qbW2qzUSPXk/CGlOdq7mjA4f04hKAfwlfdlReZFY1DQzdbehgQKayoTJ
 Zi+Q==
X-Gm-Message-State: ACrzQf31e84+PgutvJ+t7zbiHzrlJWWGo4EGSYnNFcJpi3v8hDoBgOUO
 2XdIUKdiyhTbeEWLATkbuLJ2D6E7KmebxJLTbwc=
X-Google-Smtp-Source: AMsMyM66PwdUyNYg0aQe6ynKxht23H2THhvyK4vZB9qjMsiuLWbCvF9lD7HjKRIxpYFYkbJr2CkDpewOc4716Qul0cE=
X-Received: by 2002:ac5:cb0a:0:b0:3a2:2fa3:87d8 with SMTP id
 r10-20020ac5cb0a000000b003a22fa387d8mr6352562vkl.3.1664643294079; Sat, 01 Oct
 2022 09:54:54 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 1 Oct 2022 11:54:43 -0500
Message-ID: <CAH2r5mvS6_AXjbK8sY_dEWUbmtRjodSYEtxeNz_NST9+EyC96A@mail.gmail.com>
Subject: [PATCH][smb3 client] log less confusing message on multichannel
 mounts to Samba when no interfaces returned
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="00000000000038ecb905e9fbf87c"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000038ecb905e9fbf87c
Content-Type: text/plain; charset="UTF-8"

Some servers can return an empty network interface list so, unless
multichannel is requested, no need to log an error for this, and
when multichannel is requested on mount but no interfaces, log
something less confusing.  For this case change
   parse_server_interfaces: malformed interface info
to
   empty network interface list returned by server

Cc: <stable@vger.kernel.org>
Signed-off-by: Steve French <stfrench@microsoft.com>

See attached patch

-- 
Thanks,

Steve

--00000000000038ecb905e9fbf87c
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-do-not-log-confusing-message-when-server-return.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-do-not-log-confusing-message-when-server-return.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l8q5m2il0>
X-Attachment-Id: f_l8q5m2il0

RnJvbSA5NmEwYWYyYzUwYWM1ZTQ1NGQxZTg5NmE5ODc3YTUxZWQxMDAzMTJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxMTo0NDowOCAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIHNt
YjM6IGRvIG5vdCBsb2cgY29uZnVzaW5nIG1lc3NhZ2Ugd2hlbiBzZXJ2ZXIgcmV0dXJucyBubwog
bmV0d29yayBpbnRlcmZhY2VzCgpTb21lIHNlcnZlcnMgY2FuIHJldHVybiBhbiBlbXB0eSBuZXR3
b3JrIGludGVyZmFjZSBsaXN0IHNvLCB1bmxlc3MKbXVsdGljaGFubmVsIGlzIHJlcXVlc3RlZCwg
bm8gbmVlZCB0byBsb2cgYW4gZXJyb3IgZm9yIHRoaXMsIGFuZAp3aGVuIG11bHRpY2hhbm5lbCBp
cyByZXF1ZXN0ZWQgb24gbW91bnQgYnV0IG5vIGludGVyZmFjZXMsIGxvZwpzb21ldGhpbmcgbGVz
cyBjb25mdXNpbmcuICBGb3IgdGhpcyBjYXNlIGNoYW5nZQogICBwYXJzZV9zZXJ2ZXJfaW50ZXJm
YWNlczogbWFsZm9ybWVkIGludGVyZmFjZSBpbmZvCnRvCiAgIGVtcHR5IG5ldHdvcmsgaW50ZXJm
YWNlIGxpc3QgcmV0dXJuZWQgYnkgc2VydmVyCgpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+
ClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0t
CiBmcy9jaWZzL3NtYjJvcHMuYyB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL2NpZnMvc21iMm9wcy5jIGIvZnMvY2lmcy9z
bWIyb3BzLmMKaW5kZXggNWIwNjAwOTM5MjA2Li44OGNiZjI4OTBmNmEgMTAwNjQ0Ci0tLSBhL2Zz
L2NpZnMvc21iMm9wcy5jCisrKyBiL2ZzL2NpZnMvc21iMm9wcy5jCkBAIC01NDMsNiArNTQzLDE3
IEBAIHBhcnNlX3NlcnZlcl9pbnRlcmZhY2VzKHN0cnVjdCBuZXR3b3JrX2ludGVyZmFjZV9pbmZv
X2lvY3RsX3JzcCAqYnVmLAogCX0KIAlzcGluX3VubG9jaygmc2VzLT5pZmFjZV9sb2NrKTsKIAor
CS8qCisJICogU2FtYmEgc2VydmVyIGUuZy4gY2FuIHJldHVybiBhbiBlbXB0eSBpbnRlcmZhY2Ug
bGlzdCBpbiBzb21lIGNhc2VzLAorCSAqIHdoaWNoIHdvdWxkIG9ubHkgYmUgYSBwcm9ibGVtIGlm
IHdlIHdlcmUgcmVxdWVzdGluZyBtdWx0aWNoYW5uZWwKKwkgKi8KKwlpZiAoYnl0ZXNfbGVmdCA9
PSAwKSB7CisJCWlmIChzZXMtPmNoYW5fbWF4ID4gMSkKKwkJCWNpZnNfZGJnKFZGUywgImVtcHR5
IG5ldHdvcmsgaW50ZXJmYWNlIGxpc3QgcmV0dXJuZWQgYnkgc2VydmVyXG4iKTsKKwkJcmMgPSAt
RUlOVkFMOworCQlnb3RvIG91dDsKKwl9CisKIAl3aGlsZSAoYnl0ZXNfbGVmdCA+PSBzaXplb2Yo
KnApKSB7CiAJCW1lbXNldCgmdG1wX2lmYWNlLCAwLCBzaXplb2YodG1wX2lmYWNlKSk7CiAJCXRt
cF9pZmFjZS5zcGVlZCA9IGxlNjRfdG9fY3B1KHAtPkxpbmtTcGVlZCk7Ci0tIAoyLjM0LjEKCg==
--00000000000038ecb905e9fbf87c--

