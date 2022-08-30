Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 105995A5936
	for <lists+samba-technical@lfdr.de>; Tue, 30 Aug 2022 04:16:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Oj3S4mz1YMZqLTYMLdQERsT0bL7qohRFCPvLzIXkMZQ=; b=InTUD9PX2O+dpdWr8iIF3qaliR
	DwQaGR6VarU5QPgAne1ksT0WgB80bqTPYYAlhh90e9A6h6bAGxcmmArQQKkOpw9Ka7nD0FmyRIaUz
	hqZzu+ceNkoWs4b4cxz+9zKcl9U6zXXN3Ybdia6UpG19VKJ6jRul6nWSHvs4i5Rjyzp7IOgSHt/fH
	qwfcQePF9zh+NrwqW7SPZB2rsmatbhHGm4Fvmy89TXl1QjAjS9YR6z1e3FGCHYaZdn63YA2bazqCR
	+Bm4Nj6K6x7DiayMggfaelRUtXhgmDTqlPU0I7vDmKXki7MuBfrckdo39GLaATIo4+xZ/EMmRelbc
	yCdWN2Jw==;
Received: from ip6-localhost ([::1]:27168 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oSqnI-002zbx-QJ; Tue, 30 Aug 2022 02:16:00 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:34392) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oSqnE-002zbo-GU
 for samba-technical@lists.samba.org; Tue, 30 Aug 2022 02:15:58 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id b128so6534777vsc.1
 for <samba-technical@lists.samba.org>; Mon, 29 Aug 2022 19:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=Oj3S4mz1YMZqLTYMLdQERsT0bL7qohRFCPvLzIXkMZQ=;
 b=Ikyv6bOJubYNpo+C1FAItktJeI1UHoFTE9cCOE+S6L2N3M9fcgX6VA0RDr3J7aLUea
 ky5YOmLiYCDwmANn/DzDCycz4gprWbJ5H2mMyt/a1r2pjq8v7479J5rDjINDn6VhYVEv
 o18kFIE/Hsa6NVU99DJ8qXQ0ZFcO8vJ/yQZ4Ww7uejrStRNUQsGQe07gkIjKtkwr/xF3
 4iRVeD5yu3MpKj68cXIxgAOySEdJynmeJ3PQ23xvOEIRnR5RgxpHS/OcEgTXCjMp3V3f
 /g0rJCn2cheWV2BZAkhtfXiyvK4dbbhIjWDaNTiXI1/OVWamtNKH0Xct33vL0QeCYp7i
 fWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=Oj3S4mz1YMZqLTYMLdQERsT0bL7qohRFCPvLzIXkMZQ=;
 b=sBCrTlqTlHBWuYBPjZky2xr1KH12uskgNOPafidP+/bYP48UwIF6S2Pjf7aTHUXSOy
 tzMG5l8UDb9MtIiqQGoPKDzv4DjKofsLtGQG4Wu16xFKWfKtEKd8CObAnyuYJHvakOqI
 I9wkz9LZBSZQjvX1hOKNyM7h23X+cE++YRqhcok2Kai6Rg1H2QvaiInVNlQ2iyJK3Avg
 PDMsEe9a4LzNr90zyhHEy5jcu6STS3CrVOY/TOXIL93N72gPXvxfFgcxteOl23oNMT0D
 tffvJZdej8+4xWyUK67QbEQjv/YZj82Ujdz8EdMw+l/1WzjBtqqBFhoOF9HmbTKP9/uJ
 HVyQ==
X-Gm-Message-State: ACgBeo32zlfImlK/0sV9rtAvEJpXY8o9WCgWGtXBZR06HSi6aeDfrW9s
 LK+93WQ6gj+/IxjMmUGT1ZZgpsz3izVHd8bke04=
X-Google-Smtp-Source: AA6agR59sBMJEFng0G5tKDLfd505T3Z7CG+Vi7pAjb8Sex9HrM2H1ZJuKnpjfmtPFbs+lYew25EQlfbDTObJ4uIPRro=
X-Received: by 2002:a67:b205:0:b0:390:7910:aae6 with SMTP id
 b5-20020a67b205000000b003907910aae6mr4026430vsf.61.1661825754556; Mon, 29 Aug
 2022 19:15:54 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 29 Aug 2022 21:15:43 -0500
Message-ID: <CAH2r5muT-nX+tgk6wm=L1qjWNhc2c5GDBaQXBGbrE-hNkPr3cw@mail.gmail.com>
Subject: [PATCH v2][SMB3 client] smb3: use filemap_write_and_wait_range
 instead of filemap_write_and_wait
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000c7807f05e76bf543"
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
Cc: Jeff Layton <jlayton@kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 David Howells <dhowells@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000c7807f05e76bf543
Content-Type: text/plain; charset="UTF-8"

When doing insert range and collapse range we should be
writing out the cached pages for the ranges affected but not
the whole file (and also checking for errors if writing them out
fails)

See attached

-- 
Thanks,

Steve

--000000000000c7807f05e76bf543
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-use-filemap_write_and_wait_range-instead-of-fil.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-use-filemap_write_and_wait_range-instead-of-fil.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l7fk486b0>
X-Attachment-Id: f_l7fk486b0

RnJvbSA5MGNhMDhiM2VlNjlmMTVjNWE2ZTNkOGQ3NmQ1MTZkOGYwM2NjZjE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IE1vbiwgMjkgQXVnIDIwMjIgMTE6NTM6NDEgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiB1c2UgZmlsZW1hcF93cml0ZV9hbmRfd2FpdF9yYW5nZSBpbnN0ZWFkIG9mCiBmaWxlbWFw
X3dyaXRlX2FuZF93YWl0CgpXaGVuIGRvaW5nIGluc2VydCByYW5nZSBhbmQgY29sbGFwc2UgcmFu
Z2Ugd2Ugc2hvdWxkIGJlCndyaXRpbmcgb3V0IHRoZSBjYWNoZWQgcGFnZXMgZm9yIHRoZSByYW5n
ZXMgYWZmZWN0ZWQgYnV0IG5vdAp0aGUgd2hvbGUgZmlsZS4KCkNjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNv
bT4KLS0tCiBmcy9jaWZzL2NpZnNmcy5jICB8ICA4ICsrKysrKy0tCiBmcy9jaWZzL3NtYjJvcHMu
YyB8IDEzICsrKysrKysrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9jaWZzL2NpZnNmcy5jIGIvZnMvY2lmcy9j
aWZzZnMuYwppbmRleCBlOWZiMzM4YjhlN2UuLjgwNDJkNzI4MGRlYyAxMDA2NDQKLS0tIGEvZnMv
Y2lmcy9jaWZzZnMuYworKysgYi9mcy9jaWZzL2NpZnNmcy5jCkBAIC0xMjE5LDggKzEyMTksNiBA
QCBzc2l6ZV90IGNpZnNfZmlsZV9jb3B5Y2h1bmtfcmFuZ2UodW5zaWduZWQgaW50IHhpZCwKIAog
CWNpZnNfZGJnKEZZSSwgImNvcHljaHVuayByYW5nZVxuIik7CiAKLQlmaWxlbWFwX3dyaXRlX2Fu
ZF93YWl0KHNyY19pbm9kZS0+aV9tYXBwaW5nKTsKLQogCWlmICghc3JjX2ZpbGUtPnByaXZhdGVf
ZGF0YSB8fCAhZHN0X2ZpbGUtPnByaXZhdGVfZGF0YSkgewogCQlyYyA9IC1FQkFERjsKIAkJY2lm
c19kYmcoVkZTLCAibWlzc2luZyBjaWZzRmlsZUluZm8gb24gY29weSByYW5nZSBzcmMgZmlsZVxu
Iik7CkBAIC0xMjUwLDYgKzEyNDgsMTIgQEAgc3NpemVfdCBjaWZzX2ZpbGVfY29weWNodW5rX3Jh
bmdlKHVuc2lnbmVkIGludCB4aWQsCiAJbG9ja190d29fbm9uZGlyZWN0b3JpZXModGFyZ2V0X2lu
b2RlLCBzcmNfaW5vZGUpOwogCiAJY2lmc19kYmcoRllJLCAiYWJvdXQgdG8gZmx1c2ggcGFnZXNc
biIpOworCisJcmMgPSBmaWxlbWFwX3dyaXRlX2FuZF93YWl0X3JhbmdlKHNyY19pbm9kZS0+aV9t
YXBwaW5nLCBvZmYsCisJCQkJCSAgb2ZmICsgbGVuIC0gMSk7CisJaWYgKHJjKQorCQlnb3RvIG91
dDsKKwogCS8qIHNob3VsZCB3ZSBmbHVzaCBmaXJzdCBhbmQgbGFzdCBwYWdlIGZpcnN0ICovCiAJ
dHJ1bmNhdGVfaW5vZGVfcGFnZXMoJnRhcmdldF9pbm9kZS0+aV9kYXRhLCAwKTsKIApkaWZmIC0t
Z2l0IGEvZnMvY2lmcy9zbWIyb3BzLmMgYi9mcy9jaWZzL3NtYjJvcHMuYwppbmRleCA3Yzk0MWNl
MWU3YTkuLmYxZDM2YjcwY2VmNyAxMDA2NDQKLS0tIGEvZnMvY2lmcy9zbWIyb3BzLmMKKysrIGIv
ZnMvY2lmcy9zbWIyb3BzLmMKQEAgLTM2ODcsNyArMzY4NywxMCBAQCBzdGF0aWMgbG9uZyBzbWIz
X2NvbGxhcHNlX3JhbmdlKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgY2lmc190Y29uICp0Y29u
LAogCX0KIAogCWZpbGVtYXBfaW52YWxpZGF0ZV9sb2NrKGlub2RlLT5pX21hcHBpbmcpOwotCWZp
bGVtYXBfd3JpdGVfYW5kX3dhaXQoaW5vZGUtPmlfbWFwcGluZyk7CisJcmMgPSBmaWxlbWFwX3dy
aXRlX2FuZF93YWl0X3JhbmdlKGlub2RlLT5pX21hcHBpbmcsIG9mZiwgb2xkX2VvZiAtIDEpOwor
CWlmIChyYyA8IDApCisJCWdvdG8gb3V0XzI7CisKIAl0cnVuY2F0ZV9wYWdlY2FjaGVfcmFuZ2Uo
aW5vZGUsIG9mZiwgb2xkX2VvZik7CiAKIAlyYyA9IHNtYjJfY29weWNodW5rX3JhbmdlKHhpZCwg
Y2ZpbGUsIGNmaWxlLCBvZmYgKyBsZW4sCkBAIC0zNzA4LDcgKzM3MTEsNyBAQCBzdGF0aWMgbG9u
ZyBzbWIzX2NvbGxhcHNlX3JhbmdlKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgY2lmc190Y29u
ICp0Y29uLAogCWZzY2FjaGVfcmVzaXplX2Nvb2tpZShjaWZzX2lub2RlX2Nvb2tpZShpbm9kZSks
IGNpZnNpLT5zZXJ2ZXJfZW9mKTsKIG91dF8yOgogCWZpbGVtYXBfaW52YWxpZGF0ZV91bmxvY2so
aW5vZGUtPmlfbWFwcGluZyk7Ci0gb3V0Ogorb3V0OgogCWlub2RlX3VubG9jayhpbm9kZSk7CiAJ
ZnJlZV94aWQoeGlkKTsKIAlyZXR1cm4gcmM7CkBAIC0zNzM4LDcgKzM3NDEsOSBAQCBzdGF0aWMg
bG9uZyBzbWIzX2luc2VydF9yYW5nZShzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IGNpZnNfdGNv
biAqdGNvbiwKIAllb2YgPSBjcHVfdG9fbGU2NChvbGRfZW9mICsgbGVuKTsKIAogCWZpbGVtYXBf
aW52YWxpZGF0ZV9sb2NrKGlub2RlLT5pX21hcHBpbmcpOwotCWZpbGVtYXBfd3JpdGVfYW5kX3dh
aXQoaW5vZGUtPmlfbWFwcGluZyk7CisJcmMgPSBmaWxlbWFwX3dyaXRlX2FuZF93YWl0X3Jhbmdl
KGlub2RlLT5pX21hcHBpbmcsIG9mZiwgb2xkX2VvZiArIGxlbiAtIDEpOworCWlmIChyYyA8IDAp
CisJCWdvdG8gb3V0XzI7CiAJdHJ1bmNhdGVfcGFnZWNhY2hlX3JhbmdlKGlub2RlLCBvZmYsIG9s
ZF9lb2YpOwogCiAJcmMgPSBTTUIyX3NldF9lb2YoeGlkLCB0Y29uLCBjZmlsZS0+ZmlkLnBlcnNp
c3RlbnRfZmlkLApAQCAtMzc1Nyw3ICszNzYyLDcgQEAgc3RhdGljIGxvbmcgc21iM19pbnNlcnRf
cmFuZ2Uoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBjaWZzX3Rjb24gKnRjb24sCiAJcmMgPSAw
Owogb3V0XzI6CiAJZmlsZW1hcF9pbnZhbGlkYXRlX3VubG9jayhpbm9kZS0+aV9tYXBwaW5nKTsK
LSBvdXQ6CitvdXQ6CiAJaW5vZGVfdW5sb2NrKGlub2RlKTsKIAlmcmVlX3hpZCh4aWQpOwogCXJl
dHVybiByYzsKLS0gCjIuMzQuMQoK
--000000000000c7807f05e76bf543--

