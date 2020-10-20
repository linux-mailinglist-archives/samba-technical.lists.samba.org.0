Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 923F1293539
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 08:50:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=jXHnSeYQeTW3HLpObyFjDOAq3ChHqMB4DCElm9XMuCE=; b=VT0r04teBLqOqBoAxSVx4tABNc
	E9BOPy+Srzd83ND1KPMRo8wRS7f3myqqLtM21nGBnSGmtzsEIosDHBF5t14+WdfyWsKOce+NsJSJR
	cc1Vuk60Ts0TlFe33vrDCGExtA7LfiDaCvty/zgWu6gfgbG4/CPWBVV66Q2by03q/pkIqO+agN5Xy
	w73T8j6cEyPvzrM3WtuAE9XiIQ3jNvIeq3pP5n5p88QwtpyrnhyhG7S0bSffWJCdvyu6TmYioG9hS
	cfXLaQ3Gh1dtRVLxxAUIkhYBaag2dVM0+CXmI+A4Npf1hKpNHBOWCaECzdX6psHwHw0xxjMx3ubjv
	c6cr8GhQ==;
Received: from ip6-localhost ([::1]:25872 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUlT2-00CpBl-1E; Tue, 20 Oct 2020 06:49:56 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:33698) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUlSe-00CpBa-JP
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 06:49:36 +0000
Received: by mail-io1-xd2c.google.com with SMTP id p15so1588280ioh.0
 for <samba-technical@lists.samba.org>; Mon, 19 Oct 2020 23:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jXHnSeYQeTW3HLpObyFjDOAq3ChHqMB4DCElm9XMuCE=;
 b=pnbJiuBC5vRuxzmuAxjWlOBxuqk4Sq11E0d1Pk9vwdlEJcFmi4NfOBpPdQHHDaLx0r
 RckmCRwdaL/7r8U6U8cGfjD5t+HSab3sv6UGjIrt9OozQbYDkV6FL9+YC3QhymQZHxwV
 xKBHAz7w3H/uQBAQ93BHZdgZXFxa7YcG0VG/L/VgYjgg9asNetjwaObA+Q2+rX3SIxt6
 ae3K42CaQ5PlM6hwE5Z7AgTIPPr74Rr9iVYK+mj2HtLgjV0Ws6xbw8XAm2pj4Bi0Behj
 oMnFpkE3uxHP6LypN+dSH6J7kJPTkCornBVJ05fUxEKRiOerV4GMX4FgHzphLu7fZDZK
 lVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jXHnSeYQeTW3HLpObyFjDOAq3ChHqMB4DCElm9XMuCE=;
 b=AbKhV8vsO4XuFjBDV4z15u0XN86I7cxrTywn3Gy68y28Cji6WqU/hM4sTj16uzTYez
 6chKT64nGND1PthxRbijkgXqJurfFiZIv4weA7lmc27IodS1LwzuaYq7vvquvIYkSLVi
 DweKQg/27ocUlzSG7adY4av/wHJFm5kUoxQb8ESlBULD1VN+yP1DNAXDIkBfw4FGn3hS
 Yk6cSdxQ/oN80q7UyBSoAFTZCyvYx5RP25FAP8Mo3lxPvD7hpcLA0c2SwjS1owgLIJx2
 0q9CMA16gUtS3GQAHVVmNT46uRxUs16ocfvl+hv9ZpSlpXWPFfbMLzbeULassHh6UrWA
 68Ow==
X-Gm-Message-State: AOAM533r11+QvOFhrbGNrQ0RMwZ6u1wUFg3Gjqw4WNyWfoj0zM+TnX82
 qJAGPnREJ0eUU1kSdXeMClhlETaxbOwxQz2UpQ8IA/Cc2a8=
X-Google-Smtp-Source: ABdhPJwG+PJgXdV12dNhMQ93KGu800tNOiS/iGGSz3e5jnPJmDIEaieL43Ie6Ga+u2TkN/N7YlrRm7OKmobzxo2ueyw=
X-Received: by 2002:a02:5d01:: with SMTP id w1mr733565jaa.77.1603176569903;
 Mon, 19 Oct 2020 23:49:29 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 20 Oct 2020 17:49:18 +1100
Message-ID: <CAJ+X7mQPg0yGd19pRaXCPzDyr04YEsa=TDDnBj+Gmdt12VdhoQ@mail.gmail.com>
Subject: libndr: Avoid assigning duplicate versions to symbols
To: Samba Technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>, Andreas Schneider <asn@samba.org>
Content-Type: multipart/mixed; boundary="000000000000f646e205b214a1d3"
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000f646e205b214a1d3
Content-Type: text/plain; charset="UTF-8"

Hi,

On freebsd 12, the linking of libndr.so fails with following error:

[ 918/3912] Linking bin/default/librpc/libndr.so
ld: error: duplicate symbol '_ndr_pull_error' in version script
ld: error: duplicate symbol '_ndr_push_error' in version script
clang: error: linker command failed with exit code 1 (use -v to see invocation)

This happened because symbols _ndr_push_error and _ndr_pull_error were
added to abi_match in commit 42ac80fb46cfb485e8c4a26d455fa784fdd1daed.
It generates the following snippet in ndr.vscript.

--------------------
NDR_1.0.0 {
        global:
                _ndr_pull_error;
                _ndr_push_error;
                ndr_print_steal_switch_value;
                ndr_push_steal_switch_value;
} NDR_0.2.1;

NDR_1.0.1 {
        global:
                ndr_*;
                GUID_*;
                _ndr_pull_error;
                _ndr_push_error;
        local:
                ndr_table_*;
                _end;
                __bss_start;
                _edata;
                *;
};
--------------------

Symbols _ndr_push_error and _ndr_pull_error are added to both versions
NDR_1.0.0 and NDR_1.0.1. This does not seem to be a problem for linux
ld.  It seems to ignore the later version assignments to the same
symbol as seen from the objdump:

$ objdump -T bin/default/librpc/libndr.so.1.0.1  | grep _ndr_pu.._error
0000000000012afe g    DF .text    0000000000000162  NDR_1.0.0   _ndr_push_error
0000000000012973 g    DF .text    000000000000018b  NDR_1.0.0   _ndr_pull_error

One solution is to avoid adding specific symbols to abi_match and only
use wildcards in abi_match.  This avoids the need to modify wafsamba
abi_write_vscript() function in samba_abi.py.  Patch is attached that
changes the symbols _ndr_push_error and _ndr_pull_error to wildcard
patterns as _ndr_push_error* and _ndr_pull_error*.

Amitay.

--000000000000f646e205b214a1d3
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-libndr-Avoid-assigning-duplicate-versions-to-symbols.patch"
Content-Disposition: attachment; 
	filename="0001-libndr-Avoid-assigning-duplicate-versions-to-symbols.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kghlngjv0>
X-Attachment-Id: f_kghlngjv0

RnJvbSA2MTc2NTg3Y2I3OThmZmJlZDU2NTEzMmYxZTllNGE0ZTAzYjA2YzA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbWl0YXkgSXNhYWNzIDxhbWl0YXlAZ21haWwuY29tPgpEYXRl
OiBUdWUsIDIwIE9jdCAyMDIwIDE3OjI3OjE0ICsxMTAwClN1YmplY3Q6IFtQQVRDSF0gbGlibmRy
OiBBdm9pZCBhc3NpZ25pbmcgZHVwbGljYXRlIHZlcnNpb25zIHRvIHN5bWJvbHMKClN5bWJvbHMg
X25kcl9wdXNoX2Vycm9yIGFuZCBfbmRyX3B1bGxfZXJyb3Iga2VlcCBnZXR0aW5nIHJlZGVmaW5l
ZCBhcwp0aGV5IGFyZSBpbmNsdWRlZCB3aXRob3V0IHdpbGRjYXJkIGluIGFiaV9tYXRjaC4gIEFw
cGFyZW50bHkgb24gbGludXggbGQKZG9lcyBub3QgY29tcGxhaW4gYWJvdXQgZHVwbGljYXRlIHN5
bWJvbHMsIGJ1dCBvbiBmcmVlYnNkIGxkIGZhaWxzIHRvCmxpbmsgd2l0aCBmb2xsb3dpbmcgZXJy
b3I6CgogIFsgOTE4LzM5MTJdIExpbmtpbmcgYmluL2RlZmF1bHQvbGlicnBjL2xpYm5kci5zbwog
IGxkOiBlcnJvcjogZHVwbGljYXRlIHN5bWJvbCAnX25kcl9wdWxsX2Vycm9yJyBpbiB2ZXJzaW9u
IHNjcmlwdAogIGxkOiBlcnJvcjogZHVwbGljYXRlIHN5bWJvbCAnX25kcl9wdXNoX2Vycm9yJyBp
biB2ZXJzaW9uIHNjcmlwdAogIGNsYW5nOiBlcnJvcjogbGlua2VyIGNvbW1hbmQgZmFpbGVkIHdp
dGggZXhpdCBjb2RlIDEgKHVzZSAtdiB0byBzZWUgaW52b2NhdGlvbikKClNpZ25lZC1vZmYtYnk6
IEFtaXRheSBJc2FhY3MgPGFtaXRheUBnbWFpbC5jb20+Ci0tLQogbGlicnBjL3dzY3JpcHRfYnVp
bGQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9saWJycGMvd3NjcmlwdF9idWlsZCBiL2xpYnJwYy93c2NyaXB0X2J1aWxk
CmluZGV4IDlkYTFhM2M4MTkyLi4zOThmZmY3MTY3ZSAxMDA2NDQKLS0tIGEvbGlicnBjL3dzY3Jp
cHRfYnVpbGQKKysrIGIvbGlicnBjL3dzY3JpcHRfYnVpbGQKQEAgLTY0NSw3ICs2NDUsNyBAQCBi
bGQuU0FNQkFfTElCUkFSWSgnbmRyJywKICAgICBoZWFkZXJfcGF0aD0gWygnKmdlbl9uZHIqJywg
J2dlbl9uZHInKV0sCiAgICAgdm51bT0nMS4wLjEnLAogICAgIGFiaV9kaXJlY3Rvcnk9J0FCSScs
Ci0gICAgYWJpX21hdGNoPSchbmRyX3RhYmxlXyogbmRyXyogR1VJRF8qIF9uZHJfcHVsbF9lcnJv
ciBfbmRyX3B1c2hfZXJyb3InLAorICAgIGFiaV9tYXRjaD0nIW5kcl90YWJsZV8qIG5kcl8qIEdV
SURfKiBfbmRyX3B1bGxfZXJyb3IqIF9uZHJfcHVzaF9lcnJvcionLAogICAgICkKIAogYmxkLlNB
TUJBX0xJQlJBUlkoJ2RjZXJwYy1iaW5kaW5nJywKLS0gCjIuMjYuMgoK
--000000000000f646e205b214a1d3--

