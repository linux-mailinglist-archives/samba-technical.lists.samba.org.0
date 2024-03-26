Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 716D188BB30
	for <lists+samba-technical@lfdr.de>; Tue, 26 Mar 2024 08:27:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=t/DKagLJUqB3Qqeq6AHDspb2Po48jJogFgHhFU62M3w=; b=URlURf6OSOWK0IKUfm6Qb5DlQ7
	AoCUsugxRarHIC1uNzC85veIx8Qxih7T0AXtM8Grfa06W5XlO0ma0zzDoFlGrNKGTWojVbaIJpOI2
	1EV6bluQmah6anioWJNB81qGet7lBcfmfieKSl1ImaIAabEvG/TfPGT/KG9NlyeS92eRv4hRNjukz
	JeLAGGg+sKoEcvndnIpxkHxEDfldQ309B5tKL91Z/XWpu1AjiaVyb1ehbmcu9sif/ATE8mTrx3+nF
	UXI1TjPzowJTuX/NHwKSkAV7hGLBVgcXTWPWqCGOzVwgHjVNp66ZduoVpbvo+DKxgZ/w1Y/9uS/VL
	nK33Bk0Q==;
Received: from ip6-localhost ([::1]:58070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rp1Cx-001Hle-Aa; Tue, 26 Mar 2024 07:26:56 +0000
Received: from mx.inno.tech ([185.228.49.205]:27584) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1rp1Ci-001HlX-2j
 for samba-technical@lists.samba.org; Tue, 26 Mar 2024 07:26:45 +0000
Received: from ksmg3 (localhost [127.0.0.1])
 by mx.inno.tech (Postfix) with ESMTP id 1691380020
 for <samba-technical@lists.samba.org>; Tue, 26 Mar 2024 10:07:19 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.inno.tech 1691380020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inno.tech; s=s1;
 t=1711436839; bh=t/DKagLJUqB3Qqeq6AHDspb2Po48jJogFgHhFU62M3w=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:From;
 b=DDEE0zjYwG7dxB7EZLvXOwcpm8pSoJ585Ln0ddxfnI1W3sQ/MGecCwGsxJobOwDEb
 ybFTXgUKrwDI4bDABQN3n3pl5r4QJjFQIJjJsB4TU8DtNGO52zgwB/7RMkIjJj3odm
 OZOZDjULL9dDuO32nRBkzuJS2z1w1XCeORyCgy3zGUjBYHMNiRi70udGRiOCeMVR0m
 IriAd7glaC2GIG2lOPVQ2MdVEdTAcZtDfGA1O+ZR2QJMRGqrPAcMX/MPltBMdjy/7I
 LM1Qw9d4k4e3FJEarOoRaGn6pIOCqWZh8LsjB7z2VXoMkqEQSG7X/K2tTEuMOA6rjB
 GEyh3nJgQ7iJg==
Received: from SEC-DLP-QRNT (unknown [10.0.0.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.inno.tech (Postfix) with ESMTPS
 for <samba-technical@lists.samba.org>; Tue, 26 Mar 2024 10:07:19 +0300 (MSK)
X-CHECKED: 1
X-CHECKED-RELAY-ID: 3c279d7389fa9528e53a55e18b8e1fb6328980c7
X-Cache: 20240326_100544442_00007014
X-MS-Exchange-Organization-AuthAs: Partner
Received: from [10.1.225.77] (10.1.225.77) by MAIL-DC2.inno.local
 (10.12.115.2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 26 Mar
 2024 10:05:44 +0300
Message-ID: <e9b901cb-6afb-4327-924f-65743bef1e5a@inno.tech>
Date: Tue, 26 Mar 2024 10:05:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Samba doesn't compile with GCC of version 7.5.0 without optimization
To: <samba-technical@lists.samba.org>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.1.225.77]
X-KSMG-Rule-ID: 5
X-KSMG-Message-Action: skipped
X-KSMG-AntiSpam-Status: not scanned, allowlist
X-KSMG-AntiPhishing: not scanned, allowlist
X-KSMG-LinksScanning: not scanned, allowlist
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 not scanned, allowlist
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
From: Pavel Kalugin via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Kalugin <PKalugin@inno.tech>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi All.

I pulled the Samba master and found that it doesn't compile on my OpenSUSE =
15.5
with the stock GCC version 7.5.0 in developer mode, i.e. with optimizations=
 disabled.

Is that GCC version is still supported?

In case it is:
The problem commit is this: https://gitlab.com/samba-team/samba/-/commit/92=
4eb6bac50885a4d90cba227de569087185a06d

The message is:
```
[1909/4885] Compiling lib/crypto/gkdi.c
In file included from /usr/lib64/gcc/x86_64-suse-linux/7/include/stdint.h:9=
:0,
                  from /usr/include/inttypes.h:27,
                  from ../../lib/crypto/../replace/replace.h:64,
                  from ../../source4/include/includes.h:23,
                  from ../../lib/crypto/gkdi.c:21:
.../../lib/crypto/gkdi.c: In function =E2=80=98gkdi_get_key_start_time=E2=80=
=99:
.../../lib/crypto/gkdi.c:197:4: error: initializer element is not constant
     UINT64_MAX /
     ^
.../../lib/crypto/gkdi.c:197:4: note: (near initialization for =E2=80=98max_=
gkid.l0_idx=E2=80=99)
.../../lib/crypto/gkdi.c:200:4: error: initializer element is not constant
     UINT64_MAX /
     ^
.../../lib/crypto/gkdi.c:200:4: note: (near initialization for =E2=80=98max_=
gkid.l1_idx=E2=80=99)
.../../lib/crypto/gkdi.c:204:4: error: initializer element is not constant
     UINT64_MAX / gkdi_key_cycle_duration %
     ^
.../../lib/crypto/gkdi.c:204:4: note: (near initialization for =E2=80=98max_=
gkid.l2_idx=E2=80=99)
```

The reason is that GCC version < 8.1 can't handle such initialization, see
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D66618 and
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D69960

The fix that is working for me is here: https://gitlab.com/samba-team/samba=
/-/merge_requests/3574

And the solution is to give up the static specifier in such a case, unfortu=
nately.

--=20
Pavel Kalugin
inno.tech

