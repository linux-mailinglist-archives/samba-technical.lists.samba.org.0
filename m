Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E26A8377B
	for <lists+samba-technical@lfdr.de>; Thu, 10 Apr 2025 05:56:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=+YLBy+c7rlobD2v0xr3ok/BHui3xNByHOuO6KapeFiw=; b=1O5r904MiPAyIjGGftYbbxm49I
	WYGzXfwKKvh3XF9Kop8dxsxAX0zRsT4SL3okzmVRkMlhWGLxAh+aFXvnLCKlsvj4nrwNECvAQb36v
	/SvlL0hp1YuOj2xE7zkty41ES4gO670p5y7WNQAgSINqkjQ5nBADgdjsdtniJCe2fr/sgqdLoFH4d
	dCtVv98Fk2LqOdMgt55c9S89P1NKWHv6GLxRchGCzlwxp3SVWS5eEfBs7wdOIHO6e55YkYJ65t8kz
	A22MPcd7I9E1xrN/nQkprN0E1Dc2IOc2FakXXwlYItC/O7w0/02I3YHtCvUyqZoApN3I0ZiPGzilj
	P8S/WMCQ==;
Received: from ip6-localhost ([::1]:59958 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2j11-0025Up-KM; Thu, 10 Apr 2025 03:55:47 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:58836) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2j0x-0025Th-2Z
 for samba-technical@lists.samba.org; Thu, 10 Apr 2025 03:55:45 +0000
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-54b10594812so486569e87.1
 for <samba-technical@lists.samba.org>; Wed, 09 Apr 2025 20:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744257329; x=1744862129; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+YLBy+c7rlobD2v0xr3ok/BHui3xNByHOuO6KapeFiw=;
 b=I3y71QNKgEgoQZC1sNpRMG0IvXAvp2SGigVA4YIhYvssbSLkKQMX1qxA44yh7Md91+
 pcR569OFP9rtPPsFMU+SYHNCPdd2+HKDL+Ap/nVudVaRujpX/bDKk0SW17MLgByMXGUe
 H/OSynjlQEDFJTBWP0s9UIg8kxzsqZsx/kkNZAIaOUWzTEa4NmWEOcj3QoS/kw1pb0PQ
 VkkraW+s5HS/UwZL4SW2ZHK8AWeMnHeDam2adBgPvX8w1XdRQpD5VqV3+ozSXan/UzWf
 2OZkUALPx0UTmPPHAt+X1n+cBDMUhKShgcOjjMYFPKZNQfEpIhgRnYyqGxSM2IJndV6u
 wVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744257329; x=1744862129;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+YLBy+c7rlobD2v0xr3ok/BHui3xNByHOuO6KapeFiw=;
 b=ETe44AelFlKtOdvnNHDuggrZTntaHN6PDbdUYqty2ZKzRhrHbu+g5X1w7i+Nu1q2n0
 KSn1c/X+9c2JDrsHb6oCR5n3WFDZRQnmxeXGUHvJFmg53pxPfS5WdR8oYuOUNQPOg072
 pkbsfjMU/eXmd2/97p6vtsby234KGWbm8njt6/H2wvaN3GIB9e7TLCg9L1CTpXg0eRdA
 SQ0LuVjA0BbHI+p4mM/rGFYycUXq1KQN37ApWjxIk+LqUT/6hH7CtMOv10CUNLYausCg
 9pyYM6JbC/14RTc5n6FdxJseXvA0Mf/M6vjmFN+LLvr8LrgYY/vs1yjHl/5uaHYLzMuW
 td4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlGoVhXvLHORG5klt8H2dYYoQg8d7adjpqVF82NnR2wal6ajvAB6Ue+o17loGWRDYuKCrUKQYksbDdHGgvoB8=@lists.samba.org
X-Gm-Message-State: AOJu0YzD/o+/fmum0XhWTSIHOOuH+8+ClkhGfnqglqxaoIRGyN9wyX6/
 KWwpNR8nWnn/M/qdPLREc3Sxsb4cXIfWHb+cIGrb5ZumBNkgE4nRBt4ewI7PwK377ZkgvJnK+Dq
 tmYHGfzphi203SgT0qyxseWHogXA=
X-Gm-Gg: ASbGncsS4N+OOKGwUg0Q8ERMHSjzZICAyyh062+o6E9ithEO2SAEQBjDMI/Y/ddwxvd
 RJgQFXA4hwfEO1nk5qm4hy0jUzAB8PFAbT23LfpIeuwU94KSCqPMcyPiTW3ll4VfxxQqk6+99uw
 OAfEOhURtGYj5nYo1Y5tKI+GgHGeYAVQrfoxi4NwEGH/UVzLiC6cK4SL0=
X-Google-Smtp-Source: AGHT+IFerYVIXiGtqKbBSpCYYSNZT25E67fS51X90afaowH38gXlrOvjPEx6H0akkp4MoF+UXy9KOvYv6qBa2wB8/HY=
X-Received: by 2002:a05:6512:158d:b0:545:ee3:f3c5 with SMTP id
 2adb3069b0e04-54d3c5a800amr173350e87.17.1744257329184; Wed, 09 Apr 2025
 20:55:29 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 9 Apr 2025 22:55:17 -0500
X-Gm-Features: ATxdqUHwk1qFsQAj_o5txSLEti67-Gvq-7FcadmxhUTZapiStP2Hpw1XJocCRPc
Message-ID: <CAH2r5mtHccZDP-QdWsb508iNpjeaCPsC8bxrpUgXk3y77aEcfg@mail.gmail.com>
Subject: [PATCH] Add missing defines for new File System Attributes
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="00000000000080e56b0632648e41"
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
Cc: Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000080e56b0632648e41
Content-Type: text/plain; charset="UTF-8"

Trivial patch to add the two new defines for FileSystemAttributes


Two new file system attributes were recently added. See MS-FSCC 2.5.1:
           FILE_SUPPORTS_POSIX_UNLINK_RENAME and
           FILE_RETURNS_CLEANUP_RESULT_INFO

Update the missing defines for ksmbd.ko and cifs.ko

See attached


-- 
Thanks,

Steve

--00000000000080e56b0632648e41
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-Add-defines-for-two-new-FileSystemAttributes.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-Add-defines-for-two-new-FileSystemAttributes.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m9atrmy90>
X-Attachment-Id: f_m9atrmy90

RnJvbSA1ZDE0Njk4YmJjMDE4MGFkNTZlOGExY2JkNzk2YmVhYWNmMDhhOWQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFdlZCwgOSBBcHIgMjAyNSAyMjo0NTowNSAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIHNt
YjM6IEFkZCBkZWZpbmVzIGZvciB0d28gbmV3IEZpbGVTeXN0ZW1BdHRyaWJ1dGVzCgpUd28gbmV3
IGZpbGUgc3lzdGVtIGF0dHJpYnV0ZXMgd2VyZSByZWNlbnRseSBhZGRlZC4gU2VlIE1TLUZTQ0Mg
Mi41LjE6CiAgICAgICBGSUxFX1NVUFBPUlRTX1BPU0lYX1VOTElOS19SRU5BTUUgYW5kCiAgICAg
ICBGSUxFX1JFVFVSTlNfQ0xFQU5VUF9SRVNVTFRfSU5GTwoKVXBkYXRlIHRoZSBtaXNzaW5nIGRl
ZmluZXMgZm9yIGtzbWJkIGFuZCBjaWZzLmtvCgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2gg
PHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvc21iL2NsaWVudC9jaWZzcGR1LmggICAg
fCAyICsrCiBmcy9zbWIvc2VydmVyL3NtYl9jb21tb24uaCB8IDIgKysKIDIgZmlsZXMgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVudC9jaWZzcGR1Lmgg
Yi9mcy9zbWIvY2xpZW50L2NpZnNwZHUuaAppbmRleCA0OGQwZDZmNDM5Y2YuLjE4ZDY3YWIxMTNm
MCAxMDA2NDQKLS0tIGEvZnMvc21iL2NsaWVudC9jaWZzcGR1LmgKKysrIGIvZnMvc21iL2NsaWVu
dC9jaWZzcGR1LmgKQEAgLTIyNTYsNiArMjI1Niw4IEBAIHR5cGVkZWYgc3RydWN0IHsKICNkZWZp
bmUgRklMRV9TVVBQT1JUU19FTkNSWVBUSU9OCTB4MDAwMjAwMDAKICNkZWZpbmUgRklMRV9TVVBQ
T1JUU19PQkpFQ1RfSURTCTB4MDAwMTAwMDAKICNkZWZpbmUgRklMRV9WT0xVTUVfSVNfQ09NUFJF
U1NFRAkweDAwMDA4MDAwCisjZGVmaW5lIEZJTEVfU1VQUE9SVFNfUE9TSVhfVU5MSU5LX1JFTkFN
RSAweDAwMDAwNDAwCisjZGVmaW5lIEZJTEVfUkVUVVJOU19DTEVBTlVQX1JFU1VMVF9JTkZPICAw
eDAwMDAwMjAwCiAjZGVmaW5lIEZJTEVfU1VQUE9SVFNfUkVNT1RFX1NUT1JBR0UJMHgwMDAwMDEw
MAogI2RlZmluZSBGSUxFX1NVUFBPUlRTX1JFUEFSU0VfUE9JTlRTCTB4MDAwMDAwODAKICNkZWZp
bmUgRklMRV9TVVBQT1JUU19TUEFSU0VfRklMRVMJMHgwMDAwMDA0MApkaWZmIC0tZ2l0IGEvZnMv
c21iL3NlcnZlci9zbWJfY29tbW9uLmggYi9mcy9zbWIvc2VydmVyL3NtYl9jb21tb24uaAppbmRl
eCBhM2Q4YTkwNWIwN2UuLmQ3NDJiYTc1NDM0OCAxMDA2NDQKLS0tIGEvZnMvc21iL3NlcnZlci9z
bWJfY29tbW9uLmgKKysrIGIvZnMvc21iL3NlcnZlci9zbWJfY29tbW9uLmgKQEAgLTcyLDYgKzcy
LDggQEAKICNkZWZpbmUgRklMRV9TVVBQT1JUU19FTkNSWVBUSU9OCTB4MDAwMjAwMDAKICNkZWZp
bmUgRklMRV9TVVBQT1JUU19PQkpFQ1RfSURTCTB4MDAwMTAwMDAKICNkZWZpbmUgRklMRV9WT0xV
TUVfSVNfQ09NUFJFU1NFRAkweDAwMDA4MDAwCisjZGVmaW5lIEZJTEVfU1VQUE9SVFNfUE9TSVhf
VU5MSU5LX1JFTkFNRSAweDAwMDAwNDAwCisjZGVmaW5lIEZJTEVfUkVUVVJOU19DTEVBTlVQX1JF
U1VMVF9JTkZPICAweDAwMDAwMjAwCiAjZGVmaW5lIEZJTEVfU1VQUE9SVFNfUkVNT1RFX1NUT1JB
R0UJMHgwMDAwMDEwMAogI2RlZmluZSBGSUxFX1NVUFBPUlRTX1JFUEFSU0VfUE9JTlRTCTB4MDAw
MDAwODAKICNkZWZpbmUgRklMRV9TVVBQT1JUU19TUEFSU0VfRklMRVMJMHgwMDAwMDA0MAotLSAK
Mi40My4wCgo=
--00000000000080e56b0632648e41--

