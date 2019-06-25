Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 359A452878
	for <lists+samba-technical@lfdr.de>; Tue, 25 Jun 2019 11:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=llU9IFT5EZBFFg3qedfWDR9ytiNbVudrlCrNsGxNuq0=; b=jr3Kb5SfMfS+Y5tnfbk/AdDaK+
	RvPXIoYeQN9fWlnN1yEMEMBpInhutLTvGIvG10euLrnZUHiCRTBBO0zam/0B90SqBTx5K8usaTRWk
	g6CXl066syatE38Oy4TQpqw8b7XcLJ5IbwX1SFfJxXXTN95+IfaEMw2GvbDJQGdYvb65WAMlFhDRK
	AlYGSB47BzI0LUn/Ja/a/6BK4JvLwRVNOhvkncaR854U3KAz+vlFOVOFiFQ5dfjzXmdL3wx4+jJ6f
	I+yFs2667BOTXsheHlRkRQLH1MEvQWSB/ZhG9UleePloXoQzj0ME10//c/F39Mf9yyeWuJ8LZRSSD
	x7YvQaqA==;
Received: from localhost ([::1]:49598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfi0V-001aPu-J3; Tue, 25 Jun 2019 09:44:55 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38086) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfi0R-001aPn-5s
 for samba-technical@lists.samba.org; Tue, 25 Jun 2019 09:44:53 +0000
Received: by mail-pf1-x42a.google.com with SMTP id y15so4555664pfn.5
 for <samba-technical@lists.samba.org>; Tue, 25 Jun 2019 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=llU9IFT5EZBFFg3qedfWDR9ytiNbVudrlCrNsGxNuq0=;
 b=T7gk86sIRLA5bvBEJg8kTtiSLjtMFWgdgTCNaLyHJwigPxOpcpF7Hwp+HfNER5LDdz
 lQUH3vP0cGj0YYJRHvroAxFwdpzVI1KJtKUur/HIUl1h9mOtjnqy+3CQZKfeZ20o2xJO
 lfkJz3m0nmyC7dNQneEL8zTWv9eSMAYOlihaAYVVC6GP0gFjOghjJZs+hljTEHajk2qS
 Cloa7rbqZWebZI/36qa9DAVS5dHjTtkMZ0Vyi9ugFZeU6iA4mmZSKAUy/ZArMZ8zuVYU
 DTfdTQ9bslHJ+J8czABu/RZwcLGfAdlhNpki7mH02lnM0nMbaNSUxmZRaKsCJzm2Dv0e
 Tl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=llU9IFT5EZBFFg3qedfWDR9ytiNbVudrlCrNsGxNuq0=;
 b=TgEmP8InFmR42dNYXCuAIGszO8C/3YYAcpMyaBejkOhfuAUAT1q6ZC1WA3gUeGnsmL
 GrWmWUldvx2dkkmlQWkmsPiTMkx8/7r8HJupl3M2sEq8JkaFRmxkGl6xQhuTljJ/3STC
 5FpRuCn+nIy6+NrDqb+MSuV6ImAy20buosxRzNGEFci6mhQttuN7qFHAlwXtWYG+/NCz
 BPSAgD3RYsMdRiefGbdpg7Gs6D4NvMDWvKx/2ed182C6hVCZTbEde19e1GLwTqgT6HDE
 DrEvdeDV+wiPY1RM00qRLXvMQXZC52DlW3mdTZrA2gp+I/vIdbwi1BipHpn6AKxibIV0
 NASA==
X-Gm-Message-State: APjAAAWpaHIwaomTxGAjdPeHseQQBS+3VyPKvK9+pRIT38TBwLk1SXr3
 lDoOL3Djq+Wc1qDPG7qwxSaB7WzlWXIn9VR4GXHSiqRQ
X-Google-Smtp-Source: APXvYqwHT/5+4FVcbz49guL9o/LBLM0R/q1CqlXHRuuSyzrWxFHS4N8MINbsyDLNroe6qj8W8MgkcYO0VWZQop8rvSg=
X-Received: by 2002:a63:d4c:: with SMTP id 12mr10040740pgn.30.1561455888755;
 Tue, 25 Jun 2019 02:44:48 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 25 Jun 2019 04:44:37 -0500
Message-ID: <CAH2r5msYuBS1Jvjs4_+YG0BK9zM=iuj_mWiJd49G1SVF5m6m+g@mail.gmail.com>
Subject: [PATCH][SMB3.1.1] Send new netname negotiate context
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="000000000000951045058c22c7c9"
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

--000000000000951045058c22c7c9
Content-Type: text/plain; charset="UTF-8"

Add new SMB3.1.1 netname negotiate context (only sent in request, no
response context to parse).  See MS-SMB2 2.2.3.1.4

-- 
Thanks,

Steve

--000000000000951045058c22c7c9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-Send-netname-context-during-negotiate-protocol.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-Send-netname-context-during-negotiate-protocol.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jxbmiff60>
X-Attachment-Id: f_jxbmiff60

RnJvbSBkNWU5MjcxYmNjN2VkYzIzMzYyOGU0M2U1MjNkNzgyNmM4MmViMzE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFR1ZSwgMjUgSnVuIDIwMTkgMDQ6Mzk6NTEgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiBTZW5kIG5ldG5hbWUgY29udGV4dCBkdXJpbmcgbmVnb3RpYXRlIHByb3RvY29sCgpTZWUg
TVMtU01CMiAyLjIuMy4xLjQKCkFsbG93cyBob3N0bmFtZSB0byBiZSB1c2VkIGJ5IGxvYWQgYmFs
YW5jZXJzCgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5j
b20+Ci0tLQogZnMvY2lmcy9zbWIycGR1LmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKy0t
CiBmcy9jaWZzL3NtYjJwZHUuaCB8ICA2ICsrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2NpZnMvc21iMnBkdS5j
IGIvZnMvY2lmcy9zbWIycGR1LmMKaW5kZXggOGUyODk0MDRmNmIwLi4zNGQ1Mzk3YTE5ODkgMTAw
NjQ0Ci0tLSBhL2ZzL2NpZnMvc21iMnBkdS5jCisrKyBiL2ZzL2NpZnMvc21iMnBkdS5jCkBAIC00
OTUsNiArNDk1LDIxIEBAIGJ1aWxkX2VuY3J5cHRfY3R4dChzdHJ1Y3Qgc21iMl9lbmNyeXB0aW9u
X25lZ19jb250ZXh0ICpwbmVnX2N0eHQpCiAJcG5lZ19jdHh0LT5DaXBoZXJzWzFdID0gU01CMl9F
TkNSWVBUSU9OX0FFUzEyOF9DQ007CiB9CiAKK3N0YXRpYyB1bnNpZ25lZCBpbnQKK2J1aWxkX25l
dG5hbWVfY3R4dChzdHJ1Y3Qgc21iMl9uZXRuYW1lX25lZ19jb250ZXh0ICpwbmVnX2N0eHQsIGNo
YXIgKmhvc3RuYW1lKQoreworCXN0cnVjdCBubHNfdGFibGUgKmNwID0gbG9hZF9ubHNfZGVmYXVs
dCgpOworCisJcG5lZ19jdHh0LT5Db250ZXh0VHlwZSA9IFNNQjJfTkVUTkFNRV9ORUdPVElBVEVf
Q09OVEVYVF9JRDsKKworCS8qIGNvcHkgdXAgdG8gbWF4IG9mIGZpcnN0IDEwMCBieXRlcyBvZiBz
ZXJ2ZXIgbmFtZSB0byBOZXROYW1lIGZpZWxkICovCisJcG5lZ19jdHh0LT5EYXRhTGVuZ3RoID0g
Y3B1X3RvX2xlMTYoMiArCisJCSgyICogY2lmc19zdHJ0b1VURjE2KHBuZWdfY3R4dC0+TmV0TmFt
ZSwgaG9zdG5hbWUsIDEwMCwgY3ApKSk7CisJLyogY29udGV4dCBzaXplIGlzIERhdGFMZW5ndGgg
KyBtaW5pbWFsIHNtYjJfbmVnX2NvbnRleHQgKi8KKwlyZXR1cm4gRElWX1JPVU5EX1VQKGxlMTZf
dG9fY3B1KHBuZWdfY3R4dC0+RGF0YUxlbmd0aCkgKworCQkJc2l6ZW9mKHN0cnVjdCBzbWIyX25l
Z19jb250ZXh0KSwgOCkgKiA4OworfQorCiBzdGF0aWMgdm9pZAogYnVpbGRfcG9zaXhfY3R4dChz
dHJ1Y3Qgc21iMl9wb3NpeF9uZWdfY29udGV4dCAqcG5lZ19jdHh0KQogewpAQCAtNTU5LDkgKzU3
NCwxNSBAQCBhc3NlbWJsZV9uZWdfY29udGV4dHMoc3RydWN0IHNtYjJfbmVnb3RpYXRlX3JlcSAq
cmVxLAogCQkJCTgpICogODsKIAkJKnRvdGFsX2xlbiArPSBjdHh0X2xlbjsKIAkJcG5lZ19jdHh0
ICs9IGN0eHRfbGVuOwotCQlyZXEtPk5lZ290aWF0ZUNvbnRleHRDb3VudCA9IGNwdV90b19sZTE2
KDQpOworCQlyZXEtPk5lZ290aWF0ZUNvbnRleHRDb3VudCA9IGNwdV90b19sZTE2KDUpOwogCX0g
ZWxzZQotCQlyZXEtPk5lZ290aWF0ZUNvbnRleHRDb3VudCA9IGNwdV90b19sZTE2KDMpOworCQly
ZXEtPk5lZ290aWF0ZUNvbnRleHRDb3VudCA9IGNwdV90b19sZTE2KDQpOworCisJY3R4dF9sZW4g
PSBidWlsZF9uZXRuYW1lX2N0eHQoKHN0cnVjdCBzbWIyX25ldG5hbWVfbmVnX2NvbnRleHQgKilw
bmVnX2N0eHQsCisJCQkJCXNlcnZlci0+aG9zdG5hbWUpOworCSp0b3RhbF9sZW4gKz0gY3R4dF9s
ZW47CisJcG5lZ19jdHh0ICs9IGN0eHRfbGVuOworCiAJYnVpbGRfcG9zaXhfY3R4dCgoc3RydWN0
IHNtYjJfcG9zaXhfbmVnX2NvbnRleHQgKilwbmVnX2N0eHQpOwogCSp0b3RhbF9sZW4gKz0gc2l6
ZW9mKHN0cnVjdCBzbWIyX3Bvc2l4X25lZ19jb250ZXh0KTsKIH0KZGlmZiAtLWdpdCBhL2ZzL2Np
ZnMvc21iMnBkdS5oIGIvZnMvY2lmcy9zbWIycGR1LmgKaW5kZXggMjM1MjRmZTk0N2RlLi42NDI4
NTc0OTYzZGYgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvc21iMnBkdS5oCisrKyBiL2ZzL2NpZnMvc21i
MnBkdS5oCkBAIC0zMTcsNiArMzE3LDEyIEBAIHN0cnVjdCBzbWIyX2NvbXByZXNzaW9uX2NhcGFi
aWxpdGllc19jb250ZXh0IHsKICAqIEZvciBzbWIyX25ldG5hbWVfbmVnb3RpYXRlX2NvbnRleHRf
aWQgU2VlIE1TLVNNQjIgMi4yLjMuMS40LgogICogSXRzIHN0cnVjdCBzaW1wbHkgY29udGFpbnMg
TmV0TmFtZSwgYW4gYXJyYXkgb2YgVW5pY29kZSBjaGFyYWN0ZXJzCiAgKi8KK3N0cnVjdCBzbWIy
X25ldG5hbWVfbmVnX2NvbnRleHQgeworCV9fbGUxNglDb250ZXh0VHlwZTsgLyogMHgxMDAgKi8K
KwlfX2xlMTYJRGF0YUxlbmd0aDsKKwlfX2xlMzIJUmVzZXJ2ZWQ7CisJX19sZTE2CU5ldE5hbWVb
MF07IC8qIGhvc3RuYW1lIG9mIHRhcmdldCBjb252ZXJ0ZWQgdG8gVUNTLTIgKi8KK30gX19wYWNr
ZWQ7CiAKICNkZWZpbmUgUE9TSVhfQ1RYVF9EQVRBX0xFTgkxNgogc3RydWN0IHNtYjJfcG9zaXhf
bmVnX2NvbnRleHQgewotLSAKMi4yMC4xCgo=
--000000000000951045058c22c7c9--

