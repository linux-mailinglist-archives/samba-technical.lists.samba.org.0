Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6F47A59E4
	for <lists+samba-technical@lfdr.de>; Tue, 19 Sep 2023 08:21:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Vn/Ef8dEo50kPl9ZS7d92kvxbOdIpVpVXkjKTfy4vTY=; b=dLpRCZr4+NlxQu/bqic9oUBnrj
	Ee27To28miKYWxvF247VeUFurU2zTEXwdOLXyne+tTofP6SI6qVpReiZZazy3RWcYMb6wbRg9agpK
	YE0Xb/orwUldFFssyBjiw8baAC46IKDe7z2+RW92qEcbPdVhFhuL5Z/Uy26FqYALnvPHHP1q/eqxb
	CjmConVMB5Ag9f3MIjVoxZeqgWD/vjL79wyeHZd91HNGsTR6xRIq/5DHdZoAw4R3HtSg73bfVS9No
	1ptbsZTG4sFPC7ZHMReyIYjiwWNqAfBatYJlE6nEgdXLdjmw1QcvTXOw2e7IcVSqQYeIG7AFBAv7p
	PmRjjOrw==;
Received: from ip6-localhost ([::1]:53222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qiU6X-005F6X-Q4; Tue, 19 Sep 2023 06:21:01 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:48528) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qiU6R-005F6O-QA
 for samba-technical@lists.samba.org; Tue, 19 Sep 2023 06:20:58 +0000
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-502b1bbe5c3so8838153e87.1
 for <samba-technical@lists.samba.org>; Mon, 18 Sep 2023 23:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695104454; x=1695709254; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Vn/Ef8dEo50kPl9ZS7d92kvxbOdIpVpVXkjKTfy4vTY=;
 b=E01gSOtN902PSFnAZsC1D0ViVJQtVi465JBzz8r6RPiypSkjm08tF7F3xhauARozgK
 Vx+E8J8k8g4OFbptLzTSpXKi5RioLsTRd8U2Q3NeY/EraR3NxeAbgYc8qUv/SbAByP82
 ft2XB0BnjPOHDOoUmSM+SMfvElp66tb1ei9VTy3v4B6FGAjVi6xcVuVoSkFH0CGyrLVl
 LH3yS+4mmXZMEwSy9mVxGa7P6uBK2VEaJoL4Joe3/KAscBAPVoijAw2DSScKiwa8TXVv
 eMpVvpBSkK9GAYYopp/BaB+Bg3m7pSYXlnf14GzyhrjoIkwjouPO1gqkVpuPYD4gv1uA
 WVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695104454; x=1695709254;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vn/Ef8dEo50kPl9ZS7d92kvxbOdIpVpVXkjKTfy4vTY=;
 b=F3vCcdtvKsW1S+pKWkk9EwyrWT7Zfi2vZx84qvfWVLu04DbdNhS6BqFWT3ROF32S0l
 VMwZOBziglGmqyfut5oQaJ1QzKWFK1kj+8WQyFcw7l9TYuOvhJ/EzZG39YEJnERCONzS
 Nf8dormqm1HlMHjeSkHeLJoDYSPOddioOuaHi8FFkLr4ubuBKKLKStihYJIj1G4tFEYX
 25UXTNP15hkhekbGyjMc/6RvXiuVFVU0RH0d+MR8UbmAl0WESezefQesEPp4ntwwvfNW
 K5hTyYu7UgTyxgD2UMSLIHQiUdYn9b4ZRFjrg825dF7mLw7uchoAVA1y8VKBaULKxcaC
 3oXw==
X-Gm-Message-State: AOJu0Yw74B/fSsr2bI+73V9e3mLi+W3rwIy5ouV+esc+d7eRg2yMQ9Ik
 Y6sXXaH+5dFma0+BThtePH0Nz2rVoq6+Z4CsNFk=
X-Google-Smtp-Source: AGHT+IH/4ib678LjeuzM8k5t4MmxPp5ujt4edKL/rgV0u70EpOaO5aAcm8kd6KzgySMzURPfXXRmazE8Vb9X1e5+Eic=
X-Received: by 2002:a19:4f1a:0:b0:4ff:95c:e158 with SMTP id
 d26-20020a194f1a000000b004ff095ce158mr9132996lfb.64.1695104454039; Mon, 18
 Sep 2023 23:20:54 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 19 Sep 2023 01:20:42 -0500
Message-ID: <CAH2r5mssSM9HhMXVu8570jX7Yx1CyERhjeg4S+Rp77HWrTHb6g@mail.gmail.com>
Subject: [PATCH][SMB3 client] add dynamic trace points for smbdirect (RDMA)
 connect
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000d784080605b042ef"
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
Cc: Tom Talpey <tom@talpey.com>, Paulo Alcantara <pc@manguebit.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000d784080605b042ef
Content-Type: text/plain; charset="UTF-8"

     smb3_smbd_connect_done and smb3_smbd_connect_err

To improve debugging of RDMA issues add those two new tracepoints. We
already had dynamic tracepoints for the non-RDMA connect done and
error cases, but didn't for the smbdirect cases.

See attached patch

-- 
Thanks,

Steve

--000000000000d784080605b042ef
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Add-dynamic-trace-points-for-RDMA-smbdirect-reconnec.patch"
Content-Disposition: attachment; 
	filename="0001-Add-dynamic-trace-points-for-RDMA-smbdirect-reconnec.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lmpxdyd70>
X-Attachment-Id: f_lmpxdyd70

RnJvbSBmYjI2OTdhNTYxZjcyYjI4MDIzNjk3OTY4ZmFjZTFlYzI1ZGE4NTc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFR1ZSwgMTkgU2VwIDIwMjMgMDE6MTQ6MzkgLTA1MDAKU3ViamVjdDogW1BBVENIXSBB
ZGQgZHluYW1pYyB0cmFjZSBwb2ludHMgZm9yIFJETUEgKHNtYmRpcmVjdCkgcmVjb25uZWN0Cgog
ICAgIHNtYjNfc21iZF9jb25uZWN0X2RvbmUgYW5kIHNtYjNfc21iZF9jb25uZWN0X2VycgoKVG8g
aW1wcm92ZSBkZWJ1Z2dpbmcgb2YgUkRNQSBpc3N1ZXMgYWRkIHRob3NlIHR3by4gV2UgYWxyZWFk
eQpoYWQgZHluYW1pYyB0cmFjZXBvaW50cyBmb3Igbm9uLVJETUEgY29ubmVjdCBkb25lIGFuZCBl
cnJvciBjYXNlcy4KClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9z
b2Z0LmNvbT4KLS0tCiBmcy9zbWIvY2xpZW50L3NtYmRpcmVjdC5jIHwgNSArKysrLQogZnMvc21i
L2NsaWVudC90cmFjZS5oICAgICB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVudC9zbWJkaXJlY3Qu
YyBiL2ZzL3NtYi9jbGllbnQvc21iZGlyZWN0LmMKaW5kZXggMmEyYWVjOGM2MTEyLi4yYTlmMDY0
Y2NjNmEgMTAwNjQ0Ci0tLSBhL2ZzL3NtYi9jbGllbnQvc21iZGlyZWN0LmMKKysrIGIvZnMvc21i
L2NsaWVudC9zbWJkaXJlY3QuYwpAQCAtMTQwMSw4ICsxNDAxLDExIEBAIGludCBzbWJkX3JlY29u
bmVjdChzdHJ1Y3QgVENQX1NlcnZlcl9JbmZvICpzZXJ2ZXIpCiAJc2VydmVyLT5zbWJkX2Nvbm4g
PSBzbWJkX2dldF9jb25uZWN0aW9uKAogCQlzZXJ2ZXIsIChzdHJ1Y3Qgc29ja2FkZHIgKikgJnNl
cnZlci0+ZHN0YWRkcik7CiAKLQlpZiAoc2VydmVyLT5zbWJkX2Nvbm4pCisJaWYgKHNlcnZlci0+
c21iZF9jb25uKSB7CiAJCWNpZnNfZGJnKFZGUywgIlJETUEgdHJhbnNwb3J0IHJlLWVzdGFibGlz
aGVkXG4iKTsKKwkJdHJhY2Vfc21iM19zbWJkX2Nvbm5lY3RfZG9uZShzZXJ2ZXItPmhvc3RuYW1l
LCBzZXJ2ZXItPmNvbm5faWQsICZzZXJ2ZXItPmRzdGFkZHIpOworCX0gZWxzZQorCQl0cmFjZV9z
bWIzX3NtYmRfY29ubmVjdF9lcnIoc2VydmVyLT5ob3N0bmFtZSwgc2VydmVyLT5jb25uX2lkLCAm
c2VydmVyLT5kc3RhZGRyKTsKIAogCXJldHVybiBzZXJ2ZXItPnNtYmRfY29ubiA/IDAgOiAtRU5P
RU5UOwogfQpkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVudC90cmFjZS5oIGIvZnMvc21iL2NsaWVu
dC90cmFjZS5oCmluZGV4IGE3ZTQ3NTViZWQwZi4uZGUxOTllYzlmNzI2IDEwMDY0NAotLS0gYS9m
cy9zbWIvY2xpZW50L3RyYWNlLmgKKysrIGIvZnMvc21iL2NsaWVudC90cmFjZS5oCkBAIC05MzUs
NiArOTM1LDggQEAgREVGSU5FX0VWRU5UKHNtYjNfY29ubmVjdF9jbGFzcywgc21iM18jI25hbWUs
ICBcCiAJVFBfQVJHUyhob3N0bmFtZSwgY29ubl9pZCwgYWRkcikpCiAKIERFRklORV9TTUIzX0NP
Tk5FQ1RfRVZFTlQoY29ubmVjdF9kb25lKTsKK0RFRklORV9TTUIzX0NPTk5FQ1RfRVZFTlQoc21i
ZF9jb25uZWN0X2RvbmUpOworREVGSU5FX1NNQjNfQ09OTkVDVF9FVkVOVChzbWJkX2Nvbm5lY3Rf
ZXJyKTsKIAogREVDTEFSRV9FVkVOVF9DTEFTUyhzbWIzX2Nvbm5lY3RfZXJyX2NsYXNzLAogCVRQ
X1BST1RPKGNoYXIgKmhvc3RuYW1lLCBfX3U2NCBjb25uX2lkLAotLSAKMi4zOS4yCgo=
--000000000000d784080605b042ef--

