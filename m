Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBBB2E82D9
	for <lists+samba-technical@lfdr.de>; Fri,  1 Jan 2021 04:37:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PzHWKB4oDEBjEu6qHGV4isGKa2Be4k1zGdzgyHO/+VY=; b=aUimLN8y6h6h1KD6Us5jnf37IP
	SuqeFcxB4aPKg3wR2Xmzy4mcLHpVO2auhqicHOuOu/0DzCeiverQY6m1HIGrJyTsM4Py3Azdh1qNm
	ypuSZIGEz3EifUJSxeHsWDFeeSWJ2yLcvqciL0hymhWS1k7r4PWvyELrxFG9Z+2WpqmEu5QE6J7hl
	em7klAM1XSfYBJYlJctF/EZ/cfKu3Zal/XZREZqVvFwJQM0LCRXWJS880bT+CPePMKwxL9mErxgTP
	KyC1jqhgJLMfm3weakUeBKhwVmWk8rFtQ31MOf2SDZrUdoXZOjQ/pC33SxTI2f9Fe8Cbg2lz97cCV
	5wEBb8Jw==;
Received: from ip6-localhost ([::1]:32566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kvBEM-004SEh-Eq; Fri, 01 Jan 2021 03:35:58 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:42905) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvBEF-004SEa-SK
 for samba-technical@lists.samba.org; Fri, 01 Jan 2021 03:35:54 +0000
Received: by mail-lf1-x136.google.com with SMTP id b26so47348806lff.9
 for <samba-technical@lists.samba.org>; Thu, 31 Dec 2020 19:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=PzHWKB4oDEBjEu6qHGV4isGKa2Be4k1zGdzgyHO/+VY=;
 b=dEoobE5dHGfPSqWJrINMYeXidcOfNakHe9l4MO0lWgRDMQ8DG/u9FIYBK/sGfk/aUP
 P4XRcC/dAZq0aan63GEXprhW3kdAnnKCdDn6NwdNLXJfGhfYYKcpvIzesrDyitFXn4Ji
 5x3Kd9htmeo5DbaZ/ZX1nAvFtmOtCIjYBOBXd19r9HoFbOf7jxqngRyyQTAkHqTKGx7m
 puPGiZNob9XjWQq03AE8nGSrYr15dhrUn6F+RZ3VZBdKI8EkNnOEh5EoOKBHjNlD40lQ
 dYQN4XzYMEATCvyLVnXBVG6QAq0t073GKJ/E3VTxP4UKUcBNGVUCAoePNJerVGtNdJhP
 IJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=PzHWKB4oDEBjEu6qHGV4isGKa2Be4k1zGdzgyHO/+VY=;
 b=qyCTuyMQ1jJvuyUiqWwajO2TrYrQbLyUV2Ne8BeaJYjNRlJt4h1pk42BlyLkZK3lPR
 HWZy/aTFLbGhR/IfScwACKlO1Bvfx5NrIkCbwxCfKYXno6smai2rp8cabmzIb0oRx7vw
 KCXb9qj7woz/tCgeKa8PXbddph+cSdnGhnRMWsv5CRBw37zbsoeBKYGWzEfesGGGrAlk
 yLAKsCcxzmDpzT+86yaXY23WKEnbhy7JLj1K9hTOOCwnP7johO1RtHKagOl0ZCMiXY8P
 /LGbC2v/9nlACqXBPoqgbrw0MK96nZmbBnpU9wrxfXrvdKIzqOyJbFihVtDsxr7+w1ff
 vplw==
X-Gm-Message-State: AOAM530EGTj+izw1ivK3CnG5iehLzEPSIVxNmFSviAkT0+nJIAm6KVue
 IoYbPs14ON6H9/5s0vcZ3CGaKska8txqcHmHx60=
X-Google-Smtp-Source: ABdhPJwpmjucyqwt8MdFj8Jsi/3/U31nqDlYbPn9PqDTTFpG0RpYQjxcfAOBC1sbUdglYcx1yZQXzTgLnCzAYm7LSh4=
X-Received: by 2002:a2e:87cb:: with SMTP id v11mr28773359ljj.218.1609472134510; 
 Thu, 31 Dec 2020 19:35:34 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 31 Dec 2020 21:35:23 -0600
Message-ID: <CAH2r5msH3LZuF69UFcfgtG7XXurMDc=-Ab7Ct4XwfARR8d+wRA@mail.gmail.com>
Subject: [PATCH][SMB3] allow files to be created with backslash in file name
To: Xiaoli Feng <xifeng@redhat.com>, CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000da8d4405b7ce6e47"
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

--000000000000da8d4405b7ce6e47
Content-Type: text/plain; charset="UTF-8"

Backslash is reserved in Windows (and SMB2/SMB3 by default) but
allowed in POSIX so must be remapped when POSIX extensions are
not enabled.

The default mapping for SMB3 mounts ("SFM") allows mapping backslash
(ie 0x5C in UTF8) to 0xF026 in UCS-2 (using the Unicode remapping
range reserved for these characters), but this was not mapped by
cifs.ko (unlike asterisk, greater than, question mark etc).  This patch
fixes that to allow creating files and directories with backslash
in the file or directory name.

Before this patch:
   touch "/mnt2/filewith\slash"
would return
   touch: setting times of '/mnt2/filewith\slash': Invalid argument

With the patch touch and mkdir with the backslash in the name works.

This problem was found while debugging xfstest 453 - see
    https://bugzilla.kernel.org/show_bug.cgi?id=210961

This patch may be even more important to Samba, as alternative ways of
storing these files can create more problems. Interestingly Samba
server reports local files with backslashes in them over the wire
without remapping, even though these are illegal in SMB3 which would
cause confusion on the client(s).  Has anyone tried Windows mounting
to Samba and viewing files with locally created Linux files that
include these reserved characters (presumably Windows clients won't
like it either)?

This patch does allow creating/viewing files with remotely with '\' in
the file name from Linux (cifs.ko) but does not completely fix xfstest
453 kernel (more investigation of this test is needed).  Test 453
creates filenames with 'horrifying'
(using their term) sequences of arbitrary bytes in file names.

Reported-by: Xiaoli Feng <xifeng@redhat.com>

-- 
Thanks,

Steve

--000000000000da8d4405b7ce6e47
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-allow-files-to-be-created-with-backslash-in-fil.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-allow-files-to-be-created-with-backslash-in-fil.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kjdpv0vx0>
X-Attachment-Id: f_kjdpv0vx0

RnJvbSAwMzU5Njg0MWQ0MTE5ODQwNTQ4Njc2YTliNmQ5MTY1ODBiYWE2MThjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFRodSwgMzEgRGVjIDIwMjAgMjE6MTI6MTkgLTA2MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiBhbGxvdyBmaWxlcyB0byBiZSBjcmVhdGVkIHdpdGggYmFja3NsYXNoIGluIGZpbGUgbmFt
ZQoKQmFja3NsYXNoIGlzIHJlc2VydmVkIGluIFdpbmRvd3MgKGFuZCBTTUIyL1NNQjMgYnkgZGVm
YXVsdCkgYnV0CmFsbG93ZWQgaW4gUE9TSVggc28gbXVzdCBiZSByZW1hcHBlZCB3aGVuIFBPU0lY
IGV4dGVuc2lvbnMgYXJlCm5vdCBlbmFibGVkLgoKVGhlIGRlZmF1bHQgbWFwcGluZyBmb3IgU01C
MyBtb3VudHMgKCJTRk0iKSBhbGxvd3MgbWFwcGluZyBiYWNrc2xhc2gKKGllIDB4NUMgaW4gVVRG
OCkgdG8gMHhGMDI2IGluIFVDUy0yICh1c2luZyB0aGUgVW5pY29kZSByZW1hcHBpbmcKcmFuZ2Ug
cmVzZXJ2ZWQgZm9yIHRoZXNlIGNoYXJhY3RlcnMpLCBidXQgdGhpcyB3YXMgbm90IG1hcHBlZCBi
eQpjaWZzLmtvICh1bmxpa2UgYXN0ZXJpc2ssIGdyZWF0ZXIgdGhhbiwgcXVlc3Rpb24gbWFyayBl
dGMpLiAgVGhpcyBwYXRjaApmaXhlcyB0aGF0IHRvIGFsbG93IGNyZWF0aW5nIGZpbGVzIGFuZCBk
aXJlY3RvcmllcyB3aXRoIGJhY2tzbGFzaAppbiB0aGUgZmlsZSBvciBkaXJlY3RvcnkgbmFtZS4K
CkJlZm9yZSB0aGlzIHBhdGNoOgogICB0b3VjaCAiL21udDIvZmlsZXdpdGhcc2xhc2giCndvdWxk
IHJldHVybgogICB0b3VjaDogc2V0dGluZyB0aW1lcyBvZiAnL21udDIvZmlsZXdpdGhcc2xhc2gn
OiBJbnZhbGlkIGFyZ3VtZW50CgpXaXRoIHRoZSBwYXRjaCB0b3VjaCBhbmQgbWtkaXIgd2l0aCB0
aGUgYmFja3NsYXNoIGluIHRoZSBuYW1lIHdvcmtzLgoKVGhpcyBwcm9ibGVtIHdhcyBmb3VuZCB3
aGlsZSBkZWJ1Z2dpbmcKICAgIGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MjEwOTYxCgpSZXBvcnRlZC1ieTogWGlhb2xpIEZlbmcgPHhpZmVuZ0ByZWRoYXQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0t
LQogZnMvY2lmcy9jaWZzX3VuaWNvZGUuYyB8ICA2ICsrKysrKwogZnMvY2lmcy9kaXIuYyAgICAg
ICAgICB8IDEwICsrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9jaWZzL2NpZnNfdW5pY29kZS5jIGIvZnMv
Y2lmcy9jaWZzX3VuaWNvZGUuYwppbmRleCA5YmQwM2EyMzEwMzIuLmE2NTMxMGM4N2RiNCAxMDA2
NDQKLS0tIGEvZnMvY2lmcy9jaWZzX3VuaWNvZGUuYworKysgYi9mcy9jaWZzL2NpZnNfdW5pY29k
ZS5jCkBAIC05OCw2ICs5OCw5IEBAIGNvbnZlcnRfc2ZtX2NoYXIoY29uc3QgX191MTYgc3JjX2No
YXIsIGNoYXIgKnRhcmdldCkKIAljYXNlIFNGTV9QRVJJT0Q6CiAJCSp0YXJnZXQgPSAnLic7CiAJ
CWJyZWFrOworCWNhc2UgU0ZNX1NMQVNIOgorCQkqdGFyZ2V0ID0gJ1xcJzsKKwkJYnJlYWs7CiAJ
ZGVmYXVsdDoKIAkJcmV0dXJuIGZhbHNlOwogCX0KQEAgLTQzMSw2ICs0MzQsOSBAQCBzdGF0aWMg
X19sZTE2IGNvbnZlcnRfdG9fc2ZtX2NoYXIoY2hhciBzcmNfY2hhciwgYm9vbCBlbmRfb2Zfc3Ry
aW5nKQogCWNhc2UgJ3wnOgogCQlkZXN0X2NoYXIgPSBjcHVfdG9fbGUxNihTRk1fUElQRSk7CiAJ
CWJyZWFrOworCWNhc2UgJ1xcJzoKKwkJZGVzdF9jaGFyID0gY3B1X3RvX2xlMTYoU0ZNX1NMQVNI
KTsKKwkJYnJlYWs7CiAJY2FzZSAnLic6CiAJCWlmIChlbmRfb2Zfc3RyaW5nKQogCQkJZGVzdF9j
aGFyID0gY3B1X3RvX2xlMTYoU0ZNX1BFUklPRCk7CmRpZmYgLS1naXQgYS9mcy9jaWZzL2Rpci5j
IGIvZnMvY2lmcy9kaXIuYwppbmRleCA2ODkwMGYxNjI5YmYuLjYyY2M1ODllMzNjZCAxMDA2NDQK
LS0tIGEvZnMvY2lmcy9kaXIuYworKysgYi9mcy9jaWZzL2Rpci5jCkBAIC0yMDgsOCArMjA4LDE0
IEBAIGNoZWNrX25hbWUoc3RydWN0IGRlbnRyeSAqZGlyZW50cnksIHN0cnVjdCBjaWZzX3Rjb24g
KnRjb24pCiAJCSAgICAgZGlyZW50cnktPmRfbmFtZS5sZW4gPgogCQkgICAgIGxlMzJfdG9fY3B1
KHRjb24tPmZzQXR0ckluZm8uTWF4UGF0aE5hbWVDb21wb25lbnRMZW5ndGgpKSkKIAkJcmV0dXJu
IC1FTkFNRVRPT0xPTkc7Ci0KLQlpZiAoIShjaWZzX3NiLT5tbnRfY2lmc19mbGFncyAmIENJRlNf
TU9VTlRfUE9TSVhfUEFUSFMpKSB7CisJLyoKKwkgKiBJZiBQT1NJWCBleHRlbnNpb25zIG5lZ290
aWF0ZWQgb3IgaWYgbWFwcGluZyByZXNlcnZlZCBjaGFyYWN0ZXJzCisJICogKHZpYSBTRk0sIHRo
ZSBkZWZhdWx0IG9uIG1vc3QgbW91bnRzIGN1cnJlbnRseSwgdGhlbiAnXCcgaXMKKwkgKiByZW1h
cHBlZCBvbiB0aGUgd2lyZSBpbnRvIHRoZSBVbmljb2RlIHJlc2VydmVkIHJhbmdlLCAweEYwMjYp
IHRoZW4KKwkgKiBkbyBub3QgbmVlZCB0byByZWplY3QgZ2V0L3NldCByZXF1ZXN0cyB3aXRoIGJh
Y2tzbGFzaCBpbiBwYXRoCisJICovCisJaWYgKCEoY2lmc19zYi0+bW50X2NpZnNfZmxhZ3MgJiBD
SUZTX01PVU5UX1BPU0lYX1BBVEhTKSAmJgorCSAgICAhKGNpZnNfc2ItPm1udF9jaWZzX2ZsYWdz
ICYgQ0lGU19NT1VOVF9NQVBfU0ZNX0NIUikpIHsKIAkJZm9yIChpID0gMDsgaSA8IGRpcmVudHJ5
LT5kX25hbWUubGVuOyBpKyspIHsKIAkJCWlmIChkaXJlbnRyeS0+ZF9uYW1lLm5hbWVbaV0gPT0g
J1xcJykgewogCQkJCWNpZnNfZGJnKEZZSSwgIkludmFsaWQgZmlsZSBuYW1lXG4iKTsKLS0gCjIu
MjcuMAoK
--000000000000da8d4405b7ce6e47--

